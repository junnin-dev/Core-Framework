local Core = exports['core']:GetCoreObject()
local trunkBusy = {}

RegisterNetEvent('radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

Core.Functions.CreateCallback('trunk:server:getTrunkBusy', function(_, cb, plate)
    if trunkBusy[plate] then cb(true) return end
    cb(false)
end)

Core.Commands.Add("getintrunk", Lang:t("general.getintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('trunk:client:GetIn', source)
end)

Core.Commands.Add("putintrunk", Lang:t("general.putintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('trunk:server:KidnapTrunk', source)
end)