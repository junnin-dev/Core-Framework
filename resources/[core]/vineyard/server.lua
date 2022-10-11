local Core = exports['core']:GetCoreObject()

RegisterNetEvent('vineyard:server:getGrapes', function()
    local Player = Core.Functions.GetPlayer(source)
    local amount = math.random(Config.GrapeAmount.min, Config.GrapeAmount.max)
    Player.Functions.AddItem("grape", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['grape'], "add")
end)

Core.Functions.CreateCallback('vineyard:server:loadIngredients', function(source, cb)
	local src = source
	local Player = Core.Functions.GetPlayer(src)
    local grape = Player.Functions.GetItemByName('grapejuice')
	if Player.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 23 then
                Player.Functions.RemoveItem("grapejuice", 23, false)
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['grapejuice'], "remove")
                cb(true)
            else
                TriggerClientEvent('Core:Notify', source, Lang:t("error.invalid_items"), 'error')
                cb(false)
            end
        else
            TriggerClientEvent('Core:Notify', source, Lang:t("error.invalid_items"), 'error')
            cb(false)
        end
	else
		TriggerClientEvent('Core:Notify', source, Lang:t("error.no_items"), "error")
        cb(false)
	end
end)

Core.Functions.CreateCallback('vineyard:server:grapeJuice', function(source, cb)
	local src = source
	local Player = Core.Functions.GetPlayer(src)
    local grape = Player.Functions.GetItemByName('grape')
	if Player.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 16 then
                Player.Functions.RemoveItem("grape", 16, false)
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['grape'], "remove")
                cb(true)
            else
                TriggerClientEvent('Core:Notify', source, Lang:t("error.invalid_items"), 'error')
                cb(false)
            end
        else
            TriggerClientEvent('Core:Notify', source, Lang:t("error.invalid_items"), 'error')
            cb(false)
        end
	else
		TriggerClientEvent('Core:Notify', source, Lang:t("error.no_items"), "error")
        cb(false)
	end
end)

RegisterNetEvent('vineyard:server:receiveWine', function()
	local Player = Core.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.WineAmount.min, Config.WineAmount.max)
	Player.Functions.AddItem("wine", amount, false)
	TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['wine'], "add")
end)

RegisterNetEvent('vineyard:server:receiveGrapeJuice', function()
	local Player = Core.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.GrapeJuiceAmount.min, Config.GrapeJuiceAmount.max)
	Player.Functions.AddItem("grapejuice", amount, false)
	TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['grapejuice'], "add")
end)
