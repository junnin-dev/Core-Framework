local Core = exports['core']:GetCoreObject()
local currentDivingArea = math.random(1, #Config.CoralLocations)
local availableCoral = {}

-- Functions

local function getItemPrice(amount, price)
    for k, v in pairs(Config.PriceModifiers) do
        local modifier = #Config.PriceModifiers == k and amount >= v.minAmount or amount >= v.minAmount and amount <= v.maxAmount
        if modifier then
            price /= 100 * math.random(v.minPercentage, v.maxPercentage)
            price = math.ceil(price)
        end
    end
    return price
end

local function hasCoral(src)
    local Player = Core.Functions.GetPlayer(src)
    availableCoral = {}
    for _, v in pairs(Config.CoralTypes) do
        local item = Player.Functions.GetItemByName(v.item)
        if item then availableCoral[#availableCoral+1] = v end
    end
    return next(availableCoral)
end

-- Events

RegisterNetEvent('diving:server:CallCops', function(coords)
    for _, Player in pairs(Core.Functions.GetJNPlayers()) do
        if Player then
            if Player.PlayerData.job.type == "leo" and Player.PlayerData.job.onduty then
                local msg = Lang:t("info.cop_msg")
                TriggerClientEvent('diving:client:CallCops', Player.PlayerData.source, coords, msg)
                local alertData = {
                    title = Lang:t("info.cop_title"),
                    coords = coords,
                    description = msg
                }
                TriggerClientEvent("phoneclient:addPoliceAlert", -1, alertData)
            end
        end
    end
end)

RegisterNetEvent('diving:server:SellCoral', function()
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    if hasCoral(src) then
        for _, v in pairs(availableCoral) do
            local item = Player.Functions.GetItemByName(v.item)
            local price = item.amount * v.price
            local reward = getItemPrice(item.amount, price)
            Player.Functions.RemoveItem(item.name, item.amount)
            Player.Functions.AddMoney('cash', math.ceil(reward / item.amount), "sold-coral")
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item.name], "remove")
        end
    else
        TriggerClientEvent('Core:Notify', src, Lang:t("error.no_coral"), 'error')
    end
end)

RegisterNetEvent('diving:server:TakeCoral', function(area, coral, bool)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    local coralType = math.random(1, #Config.CoralTypes)
    local amount = math.random(1, Config.CoralTypes[coralType].maxAmount)
    local ItemData = Core.Shared.Items[Config.CoralTypes[coralType].item]
    if amount > 1 then
        for _ = 1, amount, 1 do
            Player.Functions.AddItem(ItemData["name"], 1)
            TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "add")
            Wait(250)
        end
    else
        Player.Functions.AddItem(ItemData["name"], amount)
        TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "add")
    end
    if (Config.CoralLocations[area].TotalCoral - 1) == 0 then
        for _, v in pairs(Config.CoralLocations[currentDivingArea].coords.Coral) do
            v.PickedUp = false
        end
        Config.CoralLocations[currentDivingArea].TotalCoral = Config.CoralLocations[currentDivingArea].DefaultCoral
        local newLocation = math.random(1, #Config.CoralLocations)
        while newLocation == currentDivingArea do
            Wait(0)
            newLocation = math.random(1, #Config.CoralLocations)
        end
        currentDivingArea = newLocation
        TriggerClientEvent('diving:client:NewLocations', -1)
    else
        Config.CoralLocations[area].coords.Coral[coral].PickedUp = bool
        Config.CoralLocations[area].TotalCoral = Config.CoralLocations[area].TotalCoral - 1
    end
    TriggerClientEvent('diving:client:UpdateCoral', -1, area, coral, bool)
end)

RegisterNetEvent('diving:server:removeItemAfterFill', function()
   local src = source
   local Player = Core.Functions.GetPlayer(src)
   Player.Functions.RemoveItem("diving_fill", 1)
   TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items["diving_fill"], "remove")
end)

-- Callbacks

Core.Functions.CreateCallback('diving:server:GetDivingConfig', function(_, cb)
    cb(Config.CoralLocations, currentDivingArea)
end)

-- Items

Core.Functions.CreateUseableItem("diving_gear", function(source)
    TriggerClientEvent("diving:client:UseGear", source)
end)

Core.Functions.CreateUseableItem("diving_fill", function(source)
    TriggerClientEvent("diving:client:setoxygenlevel", source)
end)
