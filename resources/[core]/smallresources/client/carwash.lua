local Core = exports['core']:GetCoreObject()
local washingVehicle = false

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('carwash:client:washCar', function()
    local PlayerPed = PlayerPedId()
    local PedVehicle = GetVehiclePedIsIn(PlayerPed, false)
    washingVehicle = true
    Core.Functions.Progressbar("search_cabin", "Veículo está sendo lavado ..", math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(PedVehicle, 0.0)
        SetVehicleUndriveable(PedVehicle, false)
        WashDecalsFromVehicle(PedVehicle, 1.0)
        washingVehicle = false
    end, function() -- Cancel
        Core.Functions.Notify("Lavar cancelado ..", "error")
        washingVehicle = false
    end)
end)

CreateThread(function()
    local sleep
    while true do
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        local PedVehicle = GetVehiclePedIsIn(PlayerPed, false)
        local Driver = GetPedInVehicleSeat(PedVehicle, -1)
        local dirtLevel = GetVehicleDirtLevel(PedVehicle)
        sleep = 1000
        if IsPedInAnyVehicle(PlayerPed, false) then
            for k in pairs(Config.CarWash) do
                local dist = #(PlayerPos - vector3(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"]))
                if dist <= 7.5 and Driver == PlayerPed then
                    sleep = 0
                    if not washingVehicle then
                        DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], '~g~E~w~ - Washing car ($'..Config.DefaultPrice..')')
                        if IsControlJustPressed(0, 38) then
                            if dirtLevel > Config.DirtLevel then
                                TriggerServerEvent('carwash:server:washCar')
                            else
                                Core.Functions.Notify("O veículo não está sujo", 'error')
                            end
                        end
                    else
                        DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], 'The car wash is not available ..')
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    for k in pairs(Config.CarWash) do
        local carWash = AddBlipForCoord(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"])
        SetBlipSprite (carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale  (carWash, 0.75)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.CarWash[k]["label"])
        EndTextCommandSetBlipName(carWash)
    end
end)
