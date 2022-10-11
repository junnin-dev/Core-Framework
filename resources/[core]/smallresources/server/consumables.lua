local Core = exports['core']:GetCoreObject()

----------- / alcohol

Core.Functions.CreateUseableItem("vodka", function(source, item)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

Core.Functions.CreateUseableItem("beer", function(source, item)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

Core.Functions.CreateUseableItem("whiskey", function(source, item)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

----------- / Eat

Core.Functions.CreateUseableItem("sandwich", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

Core.Functions.CreateUseableItem("twerks_candy", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

Core.Functions.CreateUseableItem("snikkel_candy", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

Core.Functions.CreateUseableItem("tosti", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

----------- / Drink

Core.Functions.CreateUseableItem("water_bottle", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Drink", source, item.name)
end)

Core.Functions.CreateUseableItem("coffee", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Drink", source, item.name)
end)

Core.Functions.CreateUseableItem("kurkakola", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Drink", source, item.name)
end)

----------- / Drug

Core.Functions.CreateUseableItem("joint", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:UseJoint", source)
end)

Core.Functions.CreateUseableItem("cokebaggy", function(source)
    TriggerClientEvent("consumables:client:Cokebaggy", source)
end)

Core.Functions.CreateUseableItem("crack_baggy", function(source)
    TriggerClientEvent("consumables:client:Crackbaggy", source)
end)

Core.Functions.CreateUseableItem("xtcbaggy", function(source, _)
    TriggerClientEvent("consumables:client:EcstasyBaggy", source)
end)

Core.Functions.CreateUseableItem("oxy", function(source)
    TriggerClientEvent("consumables:client:oxy", source)
end)

Core.Functions.CreateUseableItem("meth", function(source)
    TriggerClientEvent("consumables:client:meth", source)
end)

----------- / Tools

Core.Functions.CreateUseableItem("armor", function(source)
    TriggerClientEvent("consumables:client:UseArmor", source)
end)

Core.Functions.CreateUseableItem("heavyarmor", function(source)
    TriggerClientEvent("consumables:client:UseHeavyArmor", source)
end)

Core.Commands.Add("resetarmor", "Redefine o colete (somente da polícia)", {}, false, function(source)
    local Player = Core.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("consumables:client:ResetArmor", source)
    else
        TriggerClientEvent('Core:Notify', source,  "Apenas para policial", "error")
    end
end)

Core.Functions.CreateUseableItem("binoculars", function(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

Core.Functions.CreateUseableItem("parachute", function(source, item)
    local Player = Core.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:UseParachute", source)
end)

Core.Commands.Add("resetparachute", "Redefina o pára -quedas", {}, false, function(source)
	TriggerClientEvent("consumables:client:ResetParachute", source)
end)

RegisterNetEvent('smallpenis:server:AddParachute', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.AddItem("parachute", 1)
end)

----------- / Firework

Core.Functions.CreateUseableItem("firework1", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework")
end)

Core.Functions.CreateUseableItem("firework2", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework_v2")
end)

Core.Functions.CreateUseableItem("firework3", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_xmas_firework")
end)

Core.Functions.CreateUseableItem("firework4", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "scr_indep_fireworks")
end)

----------- / Lockpicking

Core.Functions.CreateUseableItem("lockpick", function(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

Core.Functions.CreateUseableItem("advancedlockpick", function(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

----------- / Unused

-- Core.Functions.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = Core.Functions.GetPlayer(source)
-- 	   if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
--     TriggerClientEvent("consumables:client:UseRedSmoke", source)
-- end)

-- Eventos para adicionar e remover itens específicos para corrigir alguns exploits

RegisterNetEvent('consumables:server:resetArmor', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.AddItem('heavyarmor', 1)
end)

RegisterNetEvent('consumables:server:useHeavyArmor', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('heavyarmor', 1)
end)

RegisterNetEvent('consumables:server:useArmor', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('armor', 1)
end)

RegisterNetEvent('consumables:server:useMeth', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('meth', 1)
end)

RegisterNetEvent('consumables:server:useOxy', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('oxy', 1)
end)

RegisterNetEvent('consumables:server:useXTCBaggy', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('xtcbaggy', 1)
end)

RegisterNetEvent('consumables:server:useCrackBaggy', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('crack_baggy', 1)
end)

RegisterNetEvent('consumables:server:useCokeBaggy', function()
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('cokebaggy', 1)
end)

RegisterNetEvent('consumables:server:drinkAlcohol', function(item)
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    local foundItem = nil

    for k in pairs(ConsumablesAlcohol) do
        if k == item then
            foundItem = k
            break
        end
    end

    if not foundItem then return end

    Player.Functions.RemoveItem(foundItem, 1)
end)

RegisterNetEvent('consumables:server:UseFirework', function(item)
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    local foundItem = nil

    for i = 1, #ConsumablesFireworks do
        if ConsumablesFireworks[i] == item then
            foundItem = ConsumablesFireworks[i]
            break
        end
    end

    if not foundItem then return end

    Player.Functions.RemoveItem(foundItem, 1)
end)

RegisterNetEvent('consumables:server:addThirst', function(amount)
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.SetMetaData('thirst', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata.hunger, amount)
end)

RegisterNetEvent('consumables:server:addHunger', function(amount)
    local Player = Core.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.SetMetaData('hunger', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, amount, Player.PlayerData.metadata.thirst)
end)
