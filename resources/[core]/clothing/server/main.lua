local Core = exports['core']:GetCoreObject()

RegisterServerEvent("clothing:saveSkin")
AddEventHandler('clothing:saveSkin', function(model, skin)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if model ~= nil and skin ~= nil then
        MySQL.query('DELETE FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid }, function()
            MySQL.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                Player.PlayerData.citizenid,
                model,
                skin,
                1
            })
        end)
    end
end)

RegisterServerEvent("clothes:loadPlayerSkin")
AddEventHandler('clothes:loadPlayerSkin', function()
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
    if result[1] ~= nil then
        TriggerClientEvent("clothes:loadSkin", src, false, result[1].model, result[1].skin)
    else
        TriggerClientEvent("clothes:loadSkin", src, true)
    end
end)

RegisterServerEvent("clothes:saveOutfit")
AddEventHandler("clothes:saveOutfit", function(outfitName, model, skinData)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if model ~= nil and skinData ~= nil then
        local outfitId = "outfit-"..math.random(1, 10).."-"..math.random(1111, 9999)
        MySQL.insert('INSERT INTO player_outfits (citizenid, outfitname, model, skin, outfitId) VALUES (?, ?, ?, ?, ?)', {
            Player.PlayerData.citizenid,
            outfitName,
            model,
            json.encode(skinData),
            outfitId
        }, function()
            local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
            if result[1] ~= nil then
                TriggerClientEvent('clothing:client:reloadOutfits', src, result)
            else
                TriggerClientEvent('clothing:client:reloadOutfits', src, nil)
            end
        end)
    end
end)

RegisterServerEvent("clothing:server:removeOutfit")
AddEventHandler("clothing:server:removeOutfit", function(outfitName, outfitId)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    MySQL.query('DELETE FROM player_outfits WHERE citizenid = ? AND outfitname = ? AND outfitId = ?', {
        Player.PlayerData.citizenid,
        outfitName,
        outfitId
    }, function()
        local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
        if result[1] ~= nil then
            TriggerClientEvent('clothing:client:reloadOutfits', src, result)
        else
            TriggerClientEvent('clothing:client:reloadOutfits', src, nil)
        end
    end)
end)

Core.Functions.CreateCallback('clothing:server:getOutfits', function(source, cb)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local anusVal = {}

    local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { Player.PlayerData.citizenid })
    if result[1] ~= nil then
        for k, v in pairs(result) do
            result[k].skin = json.decode(result[k].skin)
            anusVal[k] = v
        end
        cb(anusVal)
    end
    cb(anusVal)
end)