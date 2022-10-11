AddEventHandler('chatMessage', function(_, _, message)
    if string.sub(message, 1, 1) == '/' then
        CancelEvent()
        return
    end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if not Core.Players[src] then return end
    local Player = Core.Players[src]
    TriggerEvent('log:server:CreateLog', 'joinleave', 'Dropped', 'red', '**' .. GetPlayerName(src) .. '** (' .. Player.PlayerData.license .. ') left..' ..'\n **Reason:** ' .. reason)
    Player.Functions.Save()
    Core.Player_Buckets[Player.PlayerData.license] = nil
    Core.Players[src] = nil
end)


local function onPlayerConnecting(name, _, deferrals)
    local src = source
    local license
    local identifiers = GetPlayerIdentifiers(src)
    deferrals.defer()

    Wait(0)

    if Core.Config.Server.Closed then
        if not IsPlayerAceAllowed(src, 'qbadmin.join') then
            deferrals.done(Core.Config.Server.ClosedReason)
        end
    end

    deferrals.update(string.format(Lang:t('info.checking_ban'), name))

    for _, v in pairs(identifiers) do
        if string.find(v, 'license') then
            license = v
            break
        end
    end

    Wait(2500)

    deferrals.update(string.format(Lang:t('info.checking_whitelisted'), name))

    local isBanned, Reason = Core.Functions.IsPlayerBanned(src)
    local isLicenseAlreadyInUse = Core.Functions.IsLicenseInUse(license)
    local isWhitelist, whitelisted = Core.Config.Server.Whitelist, Core.Functions.IsWhitelisted(src)

    Wait(2500)

    deferrals.update(string.format(Lang:t('info.join_server'), name))

    if not license then
      deferrals.done(Lang:t('error.no_valid_license'))
    elseif isBanned then
        deferrals.done(Reason)
    elseif isLicenseAlreadyInUse and Core.Config.Server.CheckDuplicateLicense then
        deferrals.done(Lang:t('error.duplicate_license'))
    elseif isWhitelist and not whitelisted then
      deferrals.done(Lang:t('error.not_whitelisted'))
    end

    deferrals.done()

end

AddEventHandler('playerConnecting', onPlayerConnecting)


RegisterNetEvent('Core:Server:CloseServer', function(reason)
    local src = source
    if Core.Functions.HasPermission(src, 'admin') then
        reason = reason or 'No reason specified'
        Core.Config.Server.Closed = true
        Core.Config.Server.ClosedReason = reason
        for k in pairs(Core.Players) do
            if not Core.Functions.HasPermission(k, Core.Config.Server.WhitelistPermission) then
                Core.Functions.Kick(k, reason, nil, nil)
            end
        end
    else
        Core.Functions.Kick(src, Lang:t("error.no_permission"), nil, nil)
    end
end)

RegisterNetEvent('Core:Server:OpenServer', function()
    local src = source
    if Core.Functions.HasPermission(src, 'admin') then
        Core.Config.Server.Closed = false
    else
        Core.Functions.Kick(src, Lang:t("error.no_permission"), nil, nil)
    end
end)

RegisterNetEvent('Core:Server:TriggerClientCallback', function(name, ...)
    if Core.ClientCallbacks[name] then
        Core.ClientCallbacks[name](...)
        Core.ClientCallbacks[name] = nil
    end
end)

RegisterNetEvent('Core:Server:TriggerCallback', function(name, ...)
    local src = source
    Core.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('Core:Client:TriggerCallback', src, name, ...)
    end, ...)
end)


RegisterNetEvent('Core:UpdatePlayer', function()
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    local newHunger = Player.PlayerData.metadata['hunger'] - Core.Config.Player.HungerRate
    local newThirst = Player.PlayerData.metadata['thirst'] - Core.Config.Player.ThirstRate
    if newHunger <= 0 then
        newHunger = 0
    end
    if newThirst <= 0 then
        newThirst = 0
    end
    Player.Functions.SetMetaData('thirst', newThirst)
    Player.Functions.SetMetaData('hunger', newHunger)
    TriggerClientEvent('hud:client:UpdateNeeds', src, newHunger, newThirst)
    Player.Functions.Save()
end)

RegisterNetEvent('Core:Server:SetMetaData', function(meta, data)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    if meta == 'hunger' or meta == 'thirst' then
        if data > 100 then
            data = 100
        end
    end
    Player.Functions.SetMetaData(meta, data)
    TriggerClientEvent('hud:client:UpdateNeeds', src, Player.PlayerData.metadata['hunger'], Player.PlayerData.metadata['thirst'])
end)

RegisterNetEvent('Core:ToggleDuty', function()
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('Core:Notify', src, Lang:t('info.off_duty'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('Core:Notify', src, Lang:t('info.on_duty'))
    end
    TriggerClientEvent('Core:Client:SetDuty', src, Player.PlayerData.job.onduty)
end)


RegisterNetEvent('Core:Server:UseItem', function(item)
    print(string.format("%s triggered Core:Server:UseItem by ID %s with the following data. This event is deprecated due to exploitation, and will be removed soon. Check inventory for the right use on this event.", GetInvokingResource(), source))
    Core.Debug(item)
end)

RegisterNetEvent('Core:Server:RemoveItem', function(itemName, amount)
    local src = source
    print(string.format("%s triggered Core:Server:RemoveItem by ID %s for %s %s. This event is deprecated due to exploitation, and will be removed soon. Adjust your events accordingly to do this server side with player functions.", GetInvokingResource(), src, amount, itemName))
end)

RegisterNetEvent('Core:Server:AddItem', function(itemName, amount)
    local src = source
    print(string.format("%s triggered Core:Server:AddItem by ID %s for %s %s. This event is deprecated due to exploitation, and will be removed soon. Adjust your events accordingly to do this server side with player functions.", GetInvokingResource(), src, amount, itemName))
end)

RegisterNetEvent('Core:CallCommand', function(command, args)
    local src = source
    if not Core.Commands.List[command] then return end
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    local hasPerm = Core.Functions.HasPermission(src, "command."..Core.Commands.List[command].name)
    if hasPerm then
        if Core.Commands.List[command].argsrequired and #Core.Commands.List[command].arguments ~= 0 and not args[#Core.Commands.List[command].arguments] then
            TriggerClientEvent('Core:Notify', src, Lang:t('error.missing_args2'), 'error')
        else
            Core.Commands.List[command].callback(src, args)
        end
    else
        TriggerClientEvent('Core:Notify', src, Lang:t('error.no_access'), 'error')
    end
end)


Core.Functions.CreateCallback('Core:Server:SpawnVehicle', function(source, cb, model, coords, warp)
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
    cb(NetworkGetNetworkIdFromEntity(veh))
end)


Core.Functions.CreateCallback('Core:Server:CreateVehicle', function(source, cb, model, coords, warp)
    model = type(model) == 'string' and GetHashKey(model) or model
    if not coords then coords = GetEntityCoords(GetPlayerPed(source)) end
    local CreateAutomobile = GetHashKey("CREATE_AUTOMOBILE")
    local veh = Citizen.InvokeNative(CreateAutomobile, model, coords, coords.w, true, true)
    while not DoesEntityExist(veh) do Wait(0) end
    if warp then TaskWarpPedIntoVehicle(GetPlayerPed(source), veh, -1) end
    cb(NetworkGetNetworkIdFromEntity(veh))
end)