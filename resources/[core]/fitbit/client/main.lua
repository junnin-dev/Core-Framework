local Core = exports['core']:GetCoreObject()
local PlayerData = Core.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local hasFitbit = false
local cooldown = false
-- Functions
local function fitbitCheck(PlayerItems)
    for _, item in pairs(PlayerItems) do
        if item.name == "fitbit" then
            return true
        end
    end
end

local function openWatch()
    SendNUIMessage({
        action = "openWatch",
        watchData = {}
    })
    SetNuiFocus(true, true)
end

local function closeWatch()
    SetNuiFocus(false, false)
end

local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function activateCooldown()
    cooldown = true
    Wait(2*60*1000)
    cooldown = false
end
-- Events

AddStateBagChangeHandler('isLoggedIn', nil, function(_, _, value)
    isLoggedIn = value
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not isLoggedIn then return end
    PlayerData = Core.Functions.GetPlayerData()
    hasFitbit = fitbitCheck(PlayerData.items)
end)

RegisterNetEvent('Core:Client:OnPlayerLoaded', function()
    PlayerData = Core.Functions.GetPlayerData()
    hasFitbit = fitbitCheck(PlayerData.items)
end)

RegisterNetEvent('Core:Client:OnPlayerUnload', function()
    hasFitbit = false
    PlayerData = {}
end)

RegisterNetEvent('Core:Player:SetPlayerData', function(val)
    PlayerData = val
    hasFitbit = fitbitCheck(PlayerData.items)
end)

RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
    if not hasFitbit or cooldown then return end
    if PlayerData.metadata["fitbit"].food then
        if newHunger < PlayerData.metadata["fitbit"].food then
            TriggerEvent("chatMessage", Lang:t('info.fitbit'), "warning", Lang:t('warning.hunger_warning', {hunger = round(newHunger, 2)}))
            PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
        end
    end

    if PlayerData.metadata["fitbit"].thirst then
        if newThirst < PlayerData.metadata["fitbit"].thirst then
            TriggerEvent("chatMessage", Lang:t('info.fitbit'), "warning", Lang:t('warning.thirst_warning', {thirst = round(newThirst, 2)}))
            PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
        end
    end
    activateCooldown()
end)

RegisterNetEvent('fitbit:use', function()
    openWatch()
end)

-- NUI Callbacks

RegisterNUICallback('close', function(_, cb)
    closeWatch()
    cb('ok')
end)

RegisterNUICallback('setFoodWarning', function(data, cb)
    local foodValue = tonumber(data.value)
    TriggerServerEvent('fitbit:server:setValue', 'food', foodValue)
    Core.Functions.Notify(Lang:t('success.hunger_set', {hungervalue = foodValue}), 'success')
    cb('ok')
end)

RegisterNUICallback('setThirstWarning', function(data, cb)
    local thirstValue = tonumber(data.value)
    TriggerServerEvent('fitbit:server:setValue', 'thirst', thirstValue)
    Core.Functions.Notify(Lang:t('success.thirst_set', {thirstvalue = thirstValue}), 'success')
    cb('ok')
end)