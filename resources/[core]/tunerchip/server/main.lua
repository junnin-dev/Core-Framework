local Core = exports['core']:GetCoreObject()
local tunedVehicles = {}

Core.Functions.CreateUseableItem("tunerlaptop", function(source)
    TriggerClientEvent('tunerchip:client:openChip', source)
end)

RegisterNetEvent('tunerchip:server:TuneStatus', function(plate, bool)
    if bool then
        tunedVehicles[plate] = bool
    else
        tunedVehicles[plate] = nil
    end
end)

Core.Functions.CreateCallback('tunerchip:server:HasChip', function(source, cb)
    local src = source
    local Ply = Core.Functions.GetPlayer(src)
    local Chip = Ply.Functions.GetItemByName('tunerlaptop')

    if Chip ~= nil then
        cb(true)
    else
        DropPlayer(src, Lang:t("text.this_is_not_the_idea_is_it"))
        cb(true)
    end
end)

Core.Functions.CreateCallback('tunerchip:server:GetStatus', function(_, cb, plate)
    cb(tunedVehicles[plate])
end)

Core.Functions.CreateUseableItem("nitrous", function(source)
    TriggerClientEvent('smallresource:client:LoadNitrous', source)
end)

RegisterNetEvent('nitrous:server:LoadNitrous', function(Plate)
    TriggerClientEvent('nitrous:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('nitrous:server:SyncFlames', function(netId)
    TriggerClientEvent('nitrous:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('nitrous:server:UnloadNitrous', function(Plate)
    TriggerClientEvent('nitrous:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('nitrous:server:UpdateNitroLevel', function(Plate, level)
    TriggerClientEvent('nitrous:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('nitrous:server:StopSync', function(plate)
    TriggerClientEvent('nitrous:client:StopSync', -1, plate)
end)

RegisterNetEvent('nitrous:server:removeItem', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('nitrous', 1)
end)
