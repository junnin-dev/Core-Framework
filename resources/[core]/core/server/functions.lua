Core.Functions = {}
Core.Player_Buckets = {}
Core.Entity_Buckets = {}
Core.UsableItems = {}

function Core.Functions.GetCoords(entity)
    local coords = GetEntityCoords(entity, false)
    local heading = GetEntityHeading(entity)
    return vector4(coords.x, coords.y, coords.z, heading)
end

function Core.Functions.GetIdentifier(source, idtype)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, idtype) then
            return identifier
        end
    end
    return nil
end

function Core.Functions.GetSource(identifier)
    for src, _ in pairs(Core.Players) do
        local idens = GetPlayerIdentifiers(src)
        for _, id in pairs(idens) do
            if identifier == id then
                return src
            end
        end
    end
    return 0
end

function Core.Functions.GetPlayer(source)
    if type(source) == 'number' then
        return Core.Players[source]
    else
        return Core.Players[Core.Functions.GetSource(source)]
    end
end

function Core.Functions.GetPlayerByCitizenId(citizenid)
    for src in pairs(Core.Players) do
        if Core.Players[src].PlayerData.citizenid == citizenid then
            return Core.Players[src]
        end
    end
    return nil
end

function Core.Functions.GetOfflinePlayerByCitizenId(citizenid)
    return Core.Player.GetOfflinePlayer(citizenid)
end

function Core.Functions.GetPlayerByPhone(number)
    for src in pairs(Core.Players) do
        if Core.Players[src].PlayerData.charinfo.phone == number then
            return Core.Players[src]
        end
    end
    return nil
end

function Core.Functions.GetPlayers()
    local sources = {}
    for k in pairs(Core.Players) do
        sources[#sources+1] = k
    end
    return sources
end

function Core.Functions.GetJNPlayers()
    return Core.Players
end

function Core.Functions.GetPlayersOnDuty(job)
    local players = {}
    local count = 0
    for src, Player in pairs(Core.Players) do
        if Player.PlayerData.job.name == job then
            if Player.PlayerData.job.onduty then
                players[#players + 1] = src
                count += 1
            end
        end
    end
    return players, count
end

function Core.Functions.GetDutyCount(job)
    local count = 0
    for _, Player in pairs(Core.Players) do
        if Player.PlayerData.job.name == job then
            if Player.PlayerData.job.onduty then
                count += 1
            end
        end
    end
    return count
end

function Core.Functions.GetBucketObjects()
    return Core.Player_Buckets, Core.Entity_Buckets
end

function Core.Functions.SetPlayerBucket(source --[[ int ]], bucket --[[ int ]])
    if source and bucket then
        local plicense = Core.Functions.GetIdentifier(source, 'license')
        SetPlayerRoutingBucket(source, bucket)
        Core.Player_Buckets[plicense] = {id = source, bucket = bucket}
        return true
    else
        return false
    end
end

function Core.Functions.SetEntityBucket(entity --[[ int ]], bucket --[[ int ]])
    if entity and bucket then
        SetEntityRoutingBucket(entity, bucket)
        Core.Entity_Buckets[entity] = {id = entity, bucket = bucket}
        return true
    else
        return false
    end
end

function Core.Functions.GetPlayersInBucket(bucket --[[ int ]])
    local curr_bucket_pool = {}
    if Core.Player_Buckets and next(Core.Player_Buckets) then
        for _, v in pairs(Core.Player_Buckets) do
            if v.bucket == bucket then
                curr_bucket_pool[#curr_bucket_pool + 1] = v.id
            end
        end
        return curr_bucket_pool
    else
        return false
    end
end

function Core.Functions.GetEntitiesInBucket(bucket --[[ int ]])
    local curr_bucket_pool = {}
    if Core.Entity_Buckets and next(Core.Entity_Buckets) then
        for _, v in pairs(Core.Entity_Buckets) do
            if v.bucket == bucket then
                curr_bucket_pool[#curr_bucket_pool + 1] = v.id
            end
        end
        return curr_bucket_pool
    else
        return false
    end
end

function Core.Functions.SpawnVehicle(source, model, coords, warp)
    local ped = GetPlayerPed(source)
    model = type(model) == 'string' and joaat(model) or model
    if not coords then coords = GetEntityCoords(ped) end
    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    if warp then
        while GetVehiclePedIsIn(ped) ~= veh do
            Wait(0)
            TaskWarpPedIntoVehicle(ped, veh, -1)
        end
    end
    while NetworkGetEntityOwner(veh) ~= source do Wait(0) end
    return veh
end

function Core.Functions.CreateVehicle(source, model, coords, warp)
    model = type(model) == 'string' and joaat(model) or model
    if not coords then coords = GetEntityCoords(GetPlayerPed(source)) end
    local CreateAutomobile = `CREATE_AUTOMOBILE`
    local veh = Citizen.InvokeNative(CreateAutomobile, model, coords, coords.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    if warp then TaskWarpPedIntoVehicle(GetPlayerPed(source), veh, -1) end
    return veh
end

function PaycheckInterval()
    if next(Core.Players) then
        for _, Player in pairs(Core.Players) do
            if Player then
                local payment = JNShared.Jobs[Player.PlayerData.job.name]['grades'][tostring(Player.PlayerData.job.grade.level)].payment
                if not payment then payment = Player.PlayerData.job.payment end
                if Player.PlayerData.job and payment > 0 and (JNShared.Jobs[Player.PlayerData.job.name].offDutyPay or Player.PlayerData.job.onduty) then
                    if Core.Config.Money.PayCheckSociety then
                        local account = exports['management']:GetAccount(Player.PlayerData.job.name)
                        if account ~= 0 then
                            if account < payment then 
                                TriggerClientEvent('Core:Notify', Player.PlayerData.source, Lang:t('error.company_too_poor'), 'error')
                            else
                                Player.Functions.AddMoney('bank', payment)
                                exports['management']:RemoveMoney(Player.PlayerData.job.name, payment)
                                TriggerClientEvent('Core:Notify', Player.PlayerData.source, Lang:t('info.received_paycheck', {value = payment}))
                            end
                        else
                            Player.Functions.AddMoney('bank', payment)
                            TriggerClientEvent('Core:Notify', Player.PlayerData.source, Lang:t('info.received_paycheck', {value = payment}))
                        end
                    else
                        Player.Functions.AddMoney('bank', payment)
                        TriggerClientEvent('Core:Notify', Player.PlayerData.source, Lang:t('info.received_paycheck', {value = payment}))
                    end
                end
            end
        end
    end
    SetTimeout(Core.Config.Money.PayCheckTimeOut * (60 * 1000), PaycheckInterval)
end

function Core.Functions.TriggerClientCallback(name, source, cb, ...)
    Core.ClientCallbacks[name] = cb
    TriggerClientEvent('Core:Client:TriggerClientCallback', source, name, ...)
end

function Core.Functions.CreateCallback(name, cb)
    Core.ServerCallbacks[name] = cb
end

function Core.Functions.TriggerCallback(name, source, cb, ...)
    if not Core.ServerCallbacks[name] then return end
    Core.ServerCallbacks[name](source, cb, ...)
end

function Core.Functions.CreateUseableItem(item, data)
    Core.UsableItems[item] = data
end

function Core.Functions.CanUseItem(item)
    return Core.UsableItems[item]
end

function Core.Functions.UseItem(source, item)
    if GetResourceState('inventory') == 'missing' then return end
    exports['inventory']:UseItem(source, item)
end


function Core.Functions.Kick(source, reason, setKickReason, deferrals)
    reason = '\n' .. reason .. '\n🔸 Check our Discord for further information: ' .. Core.Config.Server.Discord
    if setKickReason then
        setKickReason(reason)
    end
    CreateThread(function()
        if deferrals then
            deferrals.update(reason)
            Wait(2500)
        end
        if source then
            DropPlayer(source, reason)
        end
        for _ = 0, 4 do
            while true do
                if source then
                    if GetPlayerPing(source) >= 0 then
                        break
                    end
                    Wait(100)
                    CreateThread(function()
                        DropPlayer(source, reason)
                    end)
                end
            end
            Wait(5000)
        end
    end)
end


function Core.Functions.IsWhitelisted(source)
    if not Core.Config.Server.Whitelist then return true end
    if Core.Functions.HasPermission(source, Core.Config.Server.WhitelistPermission) then return true end
    return false
end


function Core.Functions.AddPermission(source, permission)
    if not IsPlayerAceAllowed(source, permission) then
        ExecuteCommand(('add_principal player.%s Core.%s'):format(source, permission))
        Core.Commands.Refresh(source)
    end
end

function Core.Functions.RemovePermission(source, permission)
    if permission then
        if IsPlayerAceAllowed(source, permission) then
            ExecuteCommand(('remove_principal player.%s Core.%s'):format(source, permission))
            Core.Commands.Refresh(source)
        end
    else
        for _, v in pairs(Core.Config.Server.Permissions) do
            if IsPlayerAceAllowed(source, v) then
                ExecuteCommand(('remove_principal player.%s Core.%s'):format(source, v))
                Core.Commands.Refresh(source)
            end
        end
    end
end


function Core.Functions.HasPermission(source, permission)
    if type(permission) == "string" then
        if IsPlayerAceAllowed(source, permission) then return true end
    elseif type(permission) == "table" then
        for _, permLevel in pairs(permission) do
            if IsPlayerAceAllowed(source, permLevel) then return true end
        end
    end

    return false
end

function Core.Functions.GetPermission(source)
    local src = source
    local perms = {}
    for _, v in pairs (Core.Config.Server.Permissions) do
        if IsPlayerAceAllowed(src, v) then
            perms[v] = true
        end
    end
    return perms
end


function Core.Functions.IsOptin(source)
    local license = Core.Functions.GetIdentifier(source, 'license')
    if not license or not Core.Functions.HasPermission(source, 'admin') then return false end
    local Player = Core.Functions.GetPlayer(source)
    return Player.PlayerData.optin
end

function Core.Functions.ToggleOptin(source)
    local license = Core.Functions.GetIdentifier(source, 'license')
    if not license or not Core.Functions.HasPermission(source, 'admin') then return end
    local Player = Core.Functions.GetPlayer(source)
    Player.PlayerData.optin = not Player.PlayerData.optin
    Player.Functions.SetPlayerData('optin', Player.PlayerData.optin)
end


function Core.Functions.IsPlayerBanned(source)
    local plicense = Core.Functions.GetIdentifier(source, 'license')
    local result = MySQL.single.await('SELECT * FROM bans WHERE license = ?', { plicense })
    if not result then return false end
    if os.time() < result.expire then
        local timeTable = os.date('*t', tonumber(result.expire))
        return true, 'You have been banned from the server:\n' .. result.reason .. '\nYour ban expires ' .. timeTable.day .. '/' .. timeTable.month .. '/' .. timeTable.year .. ' ' .. timeTable.hour .. ':' .. timeTable.min .. '\n'
    else
        MySQL.query('DELETE FROM bans WHERE id = ?', { result.id })
    end
    return false
end


function Core.Functions.IsLicenseInUse(license)
    local players = GetPlayers()
    for _, player in pairs(players) do
        local identifiers = GetPlayerIdentifiers(player)
        for _, id in pairs(identifiers) do
            if string.find(id, 'license') then
                if id == license then
                    return true
                end
            end
        end
    end
    return false
end


function Core.Functions.HasItem(source, items, amount)
    if GetResourceState('inventory') == 'missing' then return end
    return exports['inventory']:HasItem(source, items, amount)
end

function Core.Functions.Notify(source, text, type, length)
    TriggerClientEvent('Core:Notify', source, text, type, length)
end
