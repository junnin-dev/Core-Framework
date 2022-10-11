local Core = exports['core']:GetCoreObject()
local timeOut = false

local cachedPoliceAmount = {}
local flags = {}

-- Callback

Core.Functions.CreateCallback('jewellery:server:getCops', function(source, cb)
	local amount = 0
    for _, v in pairs(Core.Functions.GetJNPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cachedPoliceAmount[source] = amount
    cb(amount)
end)

Core.Functions.CreateCallback('jewellery:server:getVitrineState', function(_, cb)
	cb(Config.Locations)
end)

-- Functions

local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            Core.Functions.GetIdentifier(id, 'license'),
            Core.Functions.GetIdentifier(id, 'discord'),
            Core.Functions.GetIdentifier(id, 'ip'),
            reason,
            2147483647,
            'jewelery'
        })
    TriggerEvent('log:server:CreateLog', 'jewelery', 'Jogador banido', 'red',
        string.format('%s was banned by %s for %s', GetPlayerName(id), 'jewelery', reason), true)
    DropPlayer(id, 'You were permanently banned by the server for: Exploiting')
end

-- Events

RegisterNetEvent('jewellery:server:setVitrineState', function(stateType, state, k)
    if stateType == "isBusy" and type(state) == "boolean" and Config.Locations[k] then
        Config.Locations[k][stateType] = state
        TriggerClientEvent('jewellery:client:setVitrineState', -1, stateType, state, k)
    end
end)

RegisterNetEvent('jewellery:server:vitrineReward', function(vitrineIndex)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)
    local cheating = false

    if Config.Locations[vitrineIndex] == nil or Config.Locations[vitrineIndex].isOpened ~= false then
        exploitBan(src, "Trying to trigger an exploitable event \"jewellery:server:vitrineReward\"")
        return
    end
    if cachedPoliceAmount[source] == nil then
        DropPlayer(src, "Exploiting")
        return
    end

    local plrPed = GetPlayerPed(src)
    local plrCoords = GetEntityCoords(plrPed)
    local vitrineCoords = Config.Locations[vitrineIndex].coords

    if cachedPoliceAmount[source] >= Config.RequiredCops then
        if plrPed then
            local dist = #(plrCoords - vitrineCoords)
            if dist <= 25.0 then
                Config.Locations[vitrineIndex]["isOpened"] = true
                Config.Locations[vitrineIndex]["isBusy"] = false
                TriggerClientEvent('jewellery:client:setVitrineState', -1, "isOpened", true, vitrineIndex)
                TriggerClientEvent('jewellery:client:setVitrineState', -1, "isBusy", false, vitrineIndex)

                if otherchance == odd then
                    local item = math.random(1, #Config.VitrineRewards)
                    local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
                    if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
                        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
                    else
                        TriggerClientEvent('Core:Notify', src, Lang:t('error.to_much'), 'error')
                    end
                else
                    local amount = math.random(2, 4)
                    if Player.Functions.AddItem("10kgoldchain", amount) then
                        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items["10kgoldchain"], 'add')
                    else
                        TriggerClientEvent('Core:Notify', src, Lang:t('error.to_much'), 'error')
                    end
                end
            else
                cheating = true
            end
        end
    else
        cheating = true
    end

    if cheating then
        local license = Player.PlayerData.license
        if flags[license] then
            flags[license] = flags[license] + 1
        else
            flags[license] = 1
        end
        if flags[license] >= 3 then
            exploitBan("Getting flagged many times from exploiting the \"jewellery:server:vitrineReward\" event")
        else
            DropPlayer(src, "Exploiting")
        end
    end
end)

RegisterNetEvent('jewellery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('scoreboard:server:SetActivityBusy', "jewellery", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, _ in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('jewellery:client:setAlertState', -1, false)
                TriggerEvent('scoreboard:server:SetActivityBusy', "jewellery", false)
            end
            timeOut = false
        end)
    end
end)