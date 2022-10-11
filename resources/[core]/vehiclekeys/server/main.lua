-----------------------
----   Variables   ----
-----------------------
local Core = exports['core']:GetCoreObject()
local VehicleList = {}

-----------------------
----   Threads     ----
-----------------------

-----------------------
---- Server Events ----
-----------------------

-- Event to give keys. receiver can either be a single id, or a table of ids.
-- Must already have keys to the vehicle, trigger the event from the server, or pass forcegive paramter as true.
RegisterNetEvent('vehiclekeys:server:GiveVehicleKeys', function(receiver, plate)
    local giver = source

    if HasKeys(giver, plate) then
        TriggerClientEvent('Core:Notify', giver, Lang:t("notify.vgkeys"), 'success')
        if type(receiver) == 'table' then
            for _,r in ipairs(receiver) do
                GiveKeys(receiver[r], plate)
            end
        else
            GiveKeys(receiver, plate)
        end
    else
        TriggerClientEvent('Core:Notify', giver, Lang:t("notify.ydhk"), "error")
    end
end)

RegisterNetEvent('vehiclekeys:server:AcquireVehicleKeys', function(plate)
    local src = source
    GiveKeys(src, plate)
end)

RegisterNetEvent('vehiclekeys:server:breakLockpick', function(itemName)
    local Player = Core.Functions.GetPlayer(source)
    if not Player then return end
    if not (itemName == "lockpick" or itemName == "advancedlockpick") then return end
    if Player.Functions.RemoveItem(itemName, 1) then
            TriggerClientEvent("inventory:client:ItemBox", source, Core.Shared.Items[itemName], "remove")
    end
end)

RegisterNetEvent('vehiclekeys:server:setVehLockState', function(vehNetId, state)
    SetVehicleDoorsLocked(NetworkGetEntityFromNetworkId(vehNetId), state)
end)

Core.Functions.CreateCallback('vehiclekeys:server:GetVehicleKeys', function(source, cb)
    local citizenid = Core.Functions.GetPlayer(source).PlayerData.citizenid
    local keysList = {}
    for plate, citizenids in pairs (VehicleList) do
        if citizenids[citizenid] then
            keysList[plate] = true
        end
    end
    cb(keysList)
end)

-----------------------
----   Functions   ----
-----------------------

function GiveKeys(id, plate)
    local citizenid = Core.Functions.GetPlayer(id).PlayerData.citizenid

    if not VehicleList[plate] then VehicleList[plate] = {} end
    VehicleList[plate][citizenid] = true
    
    TriggerClientEvent('Core:Notify', id, Lang:t("notify.vgetkeys"))
    TriggerClientEvent('vehiclekeys:client:AddKeys', id, plate)
end

function RemoveKeys(id, plate)
    local citizenid = Core.Functions.GetPlayer(id).PlayerData.citizenid

    if VehicleList[plate] and VehicleList[plate][citizenid] then
        VehicleList[plate][citizenid] = nil
    end

    TriggerClientEvent('vehiclekeys:client:RemoveKeys', id, plate)
end

function HasKeys(id, plate)
    local citizenid = Core.Functions.GetPlayer(id).PlayerData.citizenid
    if VehicleList[plate] and VehicleList[plate][citizenid] then
        return true
    end
    return false
end

Core.Commands.Add("givekeys", Lang:t("addcom.givekeys"), {{name = Lang:t("addcom.givekeys_id"), help = Lang:t("addcom.givekeys_id_help")}}, false, function(source, args)
	local src = source
    TriggerClientEvent('vehiclekeys:client:GiveKeys', src, tonumber(args[1]))
end)

Core.Commands.Add("addkeys", Lang:t("addcom.addkeys"), {{name = Lang:t("addcom.addkeys_id"), help = Lang:t("addcom.addkeys_id_help")}, {name = Lang:t("addcom.addkeys_plate"), help = Lang:t("addcom.addkeys_plate_help")}}, true, function(source, args)
	local src = source
    if not args[1] or not args[2] then
        TriggerClientEvent('Core:Notify', src, Lang:t("notify.fpid"))
        return
    end
    GiveKeys(tonumber(args[1]), args[2])
end, 'admin')

Core.Commands.Add("removekeys", Lang:t("addcom.rkeys"), {{name = Lang:t("addcom.rkeys_id"), help = Lang:t("addcom.rkeys_id_help")}, {name = Lang:t("addcom.rkeys_plate"), help = Lang:t("addcom.rkeys_plate_help")}}, true, function(source, args)
	local src = source
    if not args[1] or not args[2] then
        TriggerClientEvent('Core:Notify', src, Lang:t("notify.fpid"))
        return
    end
    RemoveKeys(tonumber(args[1]), args[2])
end, 'admin')
