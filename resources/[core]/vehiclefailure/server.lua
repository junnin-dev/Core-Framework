local Core = exports['core']:GetCoreObject()
Core.Commands.Add("fix", "Repair your vehicle (Admin Only)", {}, false, function(source)
    TriggerClientEvent('iens:repaira', source)
    TriggerClientEvent('vehiclemod:client:fixEverything', source)
end, "admin")

Core.Functions.CreateUseableItem("repairkit", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("vehiclefailure:client:RepairVehicle", source)
    end
end)

Core.Functions.CreateUseableItem("cleaningkit", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("vehiclefailure:client:CleanVehicle", source)
    end
end)

Core.Functions.CreateUseableItem("advancedrepairkit", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("vehiclefailure:client:RepairVehicleFull", source)
    end
end)

RegisterNetEvent('vehiclefailure:removeItem', function(item)
    local src = source
    local ply = Core.Functions.GetPlayer(src)
    ply.Functions.RemoveItem(item, 1)
end)

RegisterNetEvent('vehiclefailure:server:removewashingkit', function(veh)
    local src = source
    local ply = Core.Functions.GetPlayer(src)
    ply.Functions.RemoveItem("cleaningkit", 1)
    TriggerClientEvent('vehiclefailure:client:SyncWash', -1, veh)
end)