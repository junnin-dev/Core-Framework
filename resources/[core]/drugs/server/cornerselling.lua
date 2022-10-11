local function getAvailableDrugs(source)
    local AvailableDrugs = {}
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return nil end

    for i = 1, #Config.CornerSellingDrugsList do
        local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

        if item then
            AvailableDrugs[#AvailableDrugs + 1] = {
                item = item.name,
                amount = item.amount,
                label = Core.Shared.Items[item.name]["label"]
            }
        end
    end
    return table.type(AvailableDrugs) ~= "empty" and AvailableDrugs or nil
end

Core.Functions.CreateCallback('drugs:server:cornerselling:getAvailableDrugs', function(source, cb)
    cb(getAvailableDrugs(source))
end)

RegisterNetEvent('drugs:server:giveStealItems', function(drugType, amount)
    local availableDrugs = getAvailableDrugs(source)
    local Player = Core.Functions.GetPlayer(source)

    if not availableDrugs or not Player then return end

    Player.Functions.AddItem(availableDrugs[drugType].item, amount)
end)

RegisterNetEvent('drugs:server:sellCornerDrugs', function(drugType, amount, price)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local availableDrugs = getAvailableDrugs(src)

    if not availableDrugs or not Player then return end

    local item = availableDrugs[drugType].item

    local hasItem = Player.Functions.GetItemByName(item)
    if hasItem.amount >= amount then
        TriggerClientEvent('Core:Notify', src, Lang:t("success.offer_accepted"), 'success')
        Player.Functions.RemoveItem(item, amount)
        Player.Functions.AddMoney('cash', price, "sold-cornerdrugs")
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], "remove")
        TriggerClientEvent('drugs:client:refreshAvailableDrugs', src, getAvailableDrugs(src))
    else
        TriggerClientEvent('drugs:client:cornerselling', src)
    end
end)

RegisterNetEvent('drugs:server:robCornerDrugs', function(drugType, amount)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local availableDrugs = getAvailableDrugs(src)

    if not availableDrugs or not Player then return end

    local item = availableDrugs[drugType].item

    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], "remove")
    TriggerClientEvent('drugs:client:refreshAvailableDrugs', src, getAvailableDrugs(src))
end)
