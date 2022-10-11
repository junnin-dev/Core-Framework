local Core = exports['core']:GetCoreObject()
local Bail = {}

-- Callbacks

Core.Functions.CreateCallback('hotdogjob:server:HasMoney', function(source, cb)
    local Player = Core.Functions.GetPlayer(source)

    if Player.PlayerData.money.bank >= Config.StandDeposit then
        Player.Functions.RemoveMoney('bank', Config.StandDeposit)
        Bail[Player.PlayerData.citizenid] = true
        cb(true)
    else
        Bail[Player.PlayerData.citizenid] = false
        cb(false)
    end
end)

Core.Functions.CreateCallback('hotdogjob:server:BringBack', function(source, cb)
    local Player = Core.Functions.GetPlayer(source)

    if Bail[Player.PlayerData.citizenid] then
        Player.Functions.AddMoney('bank', Config.StandDeposit)
        cb(true)
    else
        cb(false)
    end
end)

-- Events

RegisterNetEvent('hotdogjob:server:Sell', function(coords, amount, price)
    local src = source
    local pCoords = GetEntityCoords(GetPlayerPed(src))
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    if #(pCoords - coords) > 4 then exports['core']:ExploitBan(src, 'hotdog job') end
    Player.Functions.AddMoney('cash', tonumber(amount * price), 'hotdog')
end)

RegisterNetEvent('hotdogjob:server:UpdateReputation', function(quality)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local JobReputation = Player.PlayerData.metadata["jobrep"]

    if quality == "exotic" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 3 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 3
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 3
        end
    elseif quality == "rare" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 2 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 2
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 2
        end
    elseif quality == "common" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 1 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 1
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 1
        end
    end
    Player.Functions.SetMetaData("jobrep", JobReputation)
    TriggerClientEvent('hotdogjob:client:UpdateReputation', src, JobReputation)
end)

-- Commands

Core.Commands.Add("removestand", Lang:t("info.command"), {}, false, function(source, _)
    TriggerClientEvent('hotdogjob:staff:DeletStand', source)
end, 'admin')
