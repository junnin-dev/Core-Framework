local Core = exports['core']:GetCoreObject()

local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            Core.Functions.GetIdentifier(id, 'license'),
            Core.Functions.GetIdentifier(id, 'discord'),
            Core.Functions.GetIdentifier(id, 'ip'),
            reason,
            2147483647,
            'pawnshop'
        })
    TriggerEvent('log:server:CreateLog', 'pawnshop', 'Player Banido', 'red',
        string.format('%s was banned by %s for %s', GetPlayerName(id), 'pawnshop', reason), true)
    DropPlayer(id, 'You were permanently banned by the server for: Exploiting')
end

RegisterNetEvent('pawnshop:server:sellPawnItems', function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * itemPrice)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    for _, value in pairs(Config.PawnLocation) do
        dist = #(playerCoords - value.coords)
        if #(playerCoords - value.coords) < 2 then
            dist = #(playerCoords - value.coords)
            break
        end
    end
    if dist > 5 then exploitBan(src, 'sellPawnItems Exploiting') return end
    if Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        if Config.BankMoney then
            Player.Functions.AddMoney('bank', totalPrice)
        else
            Player.Functions.AddMoney('cash', totalPrice)
        end
        TriggerClientEvent('Core:Notify', src, Lang:t('success.sold', { value = tonumber(itemAmount), value2 = Core.Shared.Items[itemName].label, value3 = totalPrice }),'success')
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[itemName], 'remove')
    else
        TriggerClientEvent('Core:Notify', src, Lang:t('error.no_items'), 'error')
    end
    TriggerClientEvent('pawnshop:client:openMenu', src)
end)

RegisterNetEvent('pawnshop:server:meltItemRemove', function(itemName, itemAmount, item)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(itemName, itemAmount) then
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[itemName], 'remove')
        local meltTime = (tonumber(itemAmount) * item.time)
        TriggerClientEvent('pawnshop:client:startMelting', src, item, tonumber(itemAmount), (meltTime * 60000 / 1000))
        TriggerClientEvent('Core:Notify', src, Lang:t('info.melt_wait', { value = meltTime }), 'primary')
    else
        TriggerClientEvent('Core:Notify', src, Lang:t('error.no_items'), 'error')
    end
end)

RegisterNetEvent('pawnshop:server:pickupMelted', function(item)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    for _, value in pairs(Config.PawnLocation) do
        dist = #(playerCoords - value.coords)
        if #(playerCoords - value.coords) < 2 then
            dist = #(playerCoords - value.coords)
            break
        end
    end
    if dist > 5 then exploitBan(src, 'pickupMelted Exploiting') return end
    for _, v in pairs(item.items) do
        local meltedAmount = v.amount
        for _, m in pairs(v.item.reward) do
            local rewardAmount = m.amount
            if Player.Functions.AddItem(m.item, (meltedAmount * rewardAmount)) then
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[m.item], 'add')
                TriggerClientEvent('Core:Notify', src, Lang:t('success.items_received',{ value = (meltedAmount * rewardAmount), value2 = Core.Shared.Items[m.item].label }), 'success')
            else
                TriggerClientEvent('pawnshop:client:openMenu', src)
                return
            end
        end
    end
    TriggerClientEvent('pawnshop:client:resetPickup', src)
    TriggerClientEvent('pawnshop:client:openMenu', src)
end)

Core.Functions.CreateCallback('pawnshop:server:getInv', function(source, cb)
    local Player = Core.Functions.GetPlayer(source)
    local inventory = Player.PlayerData.items
    return cb(inventory)
end)
