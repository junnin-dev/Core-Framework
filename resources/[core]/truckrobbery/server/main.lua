local Core = exports['core']:GetCoreObject()
local ActivePolice = 2  		--<< needed policemen to activate the mission
local cashA = 250 				--<<how much minimum you can get from a robbery
local cashB = 450				--<< how much maximum you can get from a robbery
local ActivationCost = 500		--<< how much is the activation of the mission (clean from the bank)
local ResetTimer = 2700 * 1000  --<< timer every how many missions you can do, default is 600 seconds
local ActiveMission = 0

RegisterServerEvent('AttackTransport:akceptujto', function()
	local copsOnDuty = 0
	local _source = source
	local xPlayer = Core.Functions.GetPlayer(_source)
	local accountMoney = xPlayer.PlayerData.money["bank"]
	if ActiveMission == 0 then
		if accountMoney < ActivationCost then
		TriggerClientEvent('Core:Notify', _source, "Você precisa $"..ActivationCost.." no banco para aceitar a missão")
		else
			for _, v in pairs(Core.Functions.GetPlayers()) do
				local Player = Core.Functions.GetPlayer(v)
				if Player ~= nil then
					if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
						copsOnDuty = copsOnDuty + 1
					end
				end
			end
			if copsOnDuty >= ActivePolice then
				TriggerClientEvent("AttackTransport:Pozwolwykonac", _source)
				xPlayer.Functions.RemoveMoney('bank', ActivationCost, "armored-truck")

				OdpalTimer()
			else
				TriggerClientEvent('Core:Notify', _source, 'Precisa pelo menos '..ActivePolice.. ' SASP para ativar a missão.')
			end
		end
	else
		TriggerClientEvent('Core:Notify', _source, 'Alguém já está realizando esta missão')
	end
end)

RegisterServerEvent('armoredtruckheist:server:callCops', function(streetLabel, coords)
    TriggerClientEvent("armoredtruckheist:client:robberyCall", -1, streetLabel, coords)
end)

function OdpalTimer()
	ActiveMission = 1
	Wait(ResetTimer)
	ActiveMission = 0
	TriggerClientEvent('AttackTransport:CleanUp', -1)
end

RegisterServerEvent('AttackTransport:zawiadompsy', function(x ,y, z)
    TriggerClientEvent('AttackTransport:InfoForLspd', -1, x, y, z)
end)

RegisterServerEvent('AttackTransport:graczZrobilnapad', function()
	local _source = source
	local xPlayer = Core.Functions.GetPlayer(_source)
	local bags = math.random(1,3)
	local info = {
		worth = math.random(cashA, cashB)
	}
	xPlayer.Functions.AddItem('markedbills', bags, false, info)
	TriggerClientEvent('inventory:client:ItemBox', _source, Core.Shared.Items['markedbills'], "add")

	local chance = math.random(1, 100)
	TriggerClientEvent('Core:Notify', _source, 'Você pegou '..bags..' sacos de dinheiro da van')

	if chance >= 95 then
		xPlayer.Functions.AddItem('security_card_01', 1)
		TriggerClientEvent('inventory:client:ItemBox', _source, Core.Shared.Items['security_card_01'], "add")
	end
	Wait(2500)
end)
