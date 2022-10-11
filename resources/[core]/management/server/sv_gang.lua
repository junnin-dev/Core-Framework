local Core = exports['core']:GetCoreObject()
local GangAccounts = {}

function GetGangAccount(account)
	return GangAccounts[account] or 0
end

function AddGangMoney(account, amount)
	if not GangAccounts[account] then
		GangAccounts[account] = 0
	end

	GangAccounts[account] = GangAccounts[account] + amount
	MySQL.insert('INSERT INTO management_funds (job_name, amount, type) VALUES (:job_name, :amount, :type) ON DUPLICATE KEY UPDATE amount = :amount',
		{
			['job_name'] = account,
			['amount'] = GangAccounts[account],
			['type'] = 'gang'
		})
end

function RemoveGangMoney(account, amount)
	local isRemoved = false
	if amount > 0 then
		if not GangAccounts[account] then
			GangAccounts[account] = 0
		end

		if GangAccounts[account] >= amount then
			GangAccounts[account] = GangAccounts[account] - amount
			isRemoved = true
		end

		MySQL.update('UPDATE management_funds SET amount = ? WHERE job_name = ? and type = "gang"', { GangAccounts[account], account })
	end
	return isRemoved
end

MySQL.ready(function ()
	local gangmenu = MySQL.query.await('SELECT job_name,amount FROM management_funds WHERE type = "gang"', {})
	if not gangmenu then return end

	for _,v in ipairs(gangmenu) do
		GangAccounts[v.job_name] = v.amount
	end
end)

RegisterNetEvent("gangmenu:server:withdrawMoney", function(amount)
	local src = source
	local Player = Core.Functions.GetPlayer(src)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'withdrawMoney Exploiting') return end

	local gang = Player.PlayerData.gang.name
	if RemoveGangMoney(gang, amount) then
		Player.Functions.AddMoney("cash", amount, 'Gang menu withdraw')
		TriggerEvent('log:server:CreateLog', 'gangmenu', 'Retirar dinheiro', 'yellow', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' retirou -se com sucesso $' .. amount .. ' (' .. gang .. ')', false)
		TriggerClientEvent('Core:Notify', src, "Você se retirou: $" ..amount, "success")
	else
		TriggerClientEvent('Core:Notify', src, "Você não tem dinheiro suficiente na conta!", "error")
	end

	TriggerClientEvent('gangmenu:client:OpenMenu', src)
end)

RegisterNetEvent("gangmenu:server:depositMoney", function(amount)
	local src = source
	local Player = Core.Functions.GetPlayer(src)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'depositMoney Exploiting') return end

	if Player.Functions.RemoveMoney("cash", amount) then
		local gang = Player.PlayerData.gang.name
		AddGangMoney(gang, amount)
		TriggerEvent('log:server:CreateLog', 'gangmenu', 'Depositar dinheiro', 'yellow', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' successfully deposited $' .. amount .. ' (' .. gang .. ')', false)
		TriggerClientEvent('Core:Notify', src, "Você depositou: $" ..amount, "success")
	else
		TriggerClientEvent('Core:Notify', src, "Você não tem dinheiro suficiente para adicionar!", "error")
	end

	TriggerClientEvent('gangmenu:client:OpenMenu', src)
end)

Core.Functions.CreateCallback('gangmenu:server:GetAccount', function(_, cb, GangName)
	local gangmoney = GetGangAccount(GangName)
	cb(gangmoney)
end)

-- Get Employees
Core.Functions.CreateCallback('gangmenu:server:GetEmployees', function(source, cb, gangname)
	local src = source
	local Player = Core.Functions.GetPlayer(src)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'GetEmployees Exploiting') return end

	local employees = {}
	local players = MySQL.query.await("SELECT * FROM `players` WHERE `gang` LIKE '%".. gangname .."%'", {})
	if players[1] ~= nil then
		for _, value in pairs(players) do
			local isOnline = Core.Functions.GetPlayerByCitizenId(value.citizenid)

			if isOnline then
				employees[#employees+1] = {
				empSource = isOnline.PlayerData.citizenid,
				grade = isOnline.PlayerData.gang.grade,
				isboss = isOnline.PlayerData.gang.isboss,
				name = '🟢' .. isOnline.PlayerData.charinfo.firstname .. ' ' .. isOnline.PlayerData.charinfo.lastname
				}
			else
				employees[#employees+1] = {
				empSource = value.citizenid,
				grade =  json.decode(value.gang).grade,
				isboss = json.decode(value.gang).isboss,
				name = '❌' ..  json.decode(value.charinfo).firstname .. ' ' .. json.decode(value.charinfo).lastname
				}
			end
		end
	end
	cb(employees)
end)

-- Grade Change
RegisterNetEvent('gangmenu:server:GradeUpdate', function(data)
	local src = source
	local Player = Core.Functions.GetPlayer(src)
	local Employee = Core.Functions.GetPlayerByCitizenId(data.cid)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'GradeUpdate Exploiting') return end
	if data.grade > Player.PlayerData.gang.grade.level then TriggerClientEvent('Core:Notify', src, "Você não pode promover para esta classificação!", "error") return end

	if Employee then
		if Employee.Functions.SetGang(Player.PlayerData.gang.name, data.grade) then
			TriggerClientEvent('Core:Notify', src, "Promovido com sucesso!", "success")
			TriggerClientEvent('Core:Notify', Employee.PlayerData.source, "Você foi promovido a " ..data.gradename..".", "success")
		else
			TriggerClientEvent('Core:Notify', src, "Grau não existe.", "error")
		end
	else
		TriggerClientEvent('Core:Notify', src, "Civil não está na cidade.", "error")
	end
	TriggerClientEvent('gangmenu:client:OpenMenu', src)
end)

-- Fire Member
RegisterNetEvent('gangmenu:server:FireMember', function(target)
	local src = source
	local Player = Core.Functions.GetPlayer(src)
	local Employee = Core.Functions.GetPlayerByCitizenId(target)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'FireEmployee explorando') return end

	if Employee then
		if target ~= Player.PlayerData.citizenid then
			if Employee.PlayerData.gang.grade.level > Player.PlayerData.gang.grade.level then TriggerClientEvent('Core:Notify', src, "Você não pode demitir esse cidadão!", "error") return end
			if Employee.Functions.SetGang("none", '0') then
				TriggerEvent("log:server:CreateLog", "gangmenu", "Gang Fire", "orange", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.PlayerData.charinfo.firstname .. " " .. Employee.PlayerData.charinfo.lastname .. " (" .. Player.PlayerData.gang.name .. ")", false)
				TriggerClientEvent('Core:Notify', src, "Membro de gangue demitido!", "success")
				TriggerClientEvent('Core:Notify', Employee.PlayerData.source , "Você foi expulso da gangue!", "error")
			else
				TriggerClientEvent('Core:Notify', src, "Erro.", "error")
			end
		else
			TriggerClientEvent('Core:Notify', src, "Você não pode sair da gangue!", "error")
		end
	else
		local player = MySQL.query.await('SELECT * FROM players WHERE citizenid = ? LIMIT 1', {target})
		if player[1] ~= nil then
			Employee = player[1]
			Employee.gang = json.decode(Employee.gang)
			if Employee.gang.grade.level > Player.PlayerData.job.grade.level then TriggerClientEvent('Core:Notify', src, "Você não pode demitir esse cidadão!", "error") return end
			local gang = {}
			gang.name = "none"
			gang.label = "No Affiliation"
			gang.payment = 0
			gang.onduty = true
			gang.isboss = false
			gang.grade = {}
			gang.grade.name = nil
			gang.grade.level = 0
			MySQL.update('UPDATE players SET gang = ? WHERE citizenid = ?', {json.encode(gang), target})
			TriggerClientEvent('Core:Notify', src, "Membro de gangue demitido!", "success")
			TriggerEvent("log:server:CreateLog", "gangmenu", "Gang Fire", "orange", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.PlayerData.charinfo.firstname .. " " .. Employee.PlayerData.charinfo.lastname .. " (" .. Player.PlayerData.gang.name .. ")", false)
		else
			TriggerClientEvent('Core:Notify', src, "Civil não está na cidade.", "error")
		end
	end
	TriggerClientEvent('gangmenu:client:OpenMenu', src)
end)

-- Recruit Player
RegisterNetEvent('gangmenu:server:HireMember', function(recruit)
	local src = source
	local Player = Core.Functions.GetPlayer(src)
	local Target = Core.Functions.GetPlayer(recruit)

	if not Player.PlayerData.gang.isboss then ExploitBan(src, 'HireEmployee Exploiting') return end

	if Target and Target.Functions.SetGang(Player.PlayerData.gang.name, 0) then
		TriggerClientEvent('Core:Notify', src, "Você contratou " .. (Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname) .. " come " .. Player.PlayerData.gang.label .. "", "success")
		TriggerClientEvent('Core:Notify', Target.PlayerData.source , "Você foi contratado como " .. Player.PlayerData.gang.label .. "", "success")
		TriggerEvent('log:server:CreateLog', 'gangmenu', 'Recruit', 'yellow', (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname).. ' successfully recruited ' .. Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname .. ' (' .. Player.PlayerData.gang.name .. ')', false)
	end
	TriggerClientEvent('gangmenu:client:OpenMenu', src)
end)

-- Get closest player sv
Core.Functions.CreateCallback('gangmenu:getplayers', function(source, cb)
	local src = source
	local players = {}
	local PlayerPed = GetPlayerPed(src)
	local pCoords = GetEntityCoords(PlayerPed)
	for _, v in pairs(Core.Functions.GetPlayers()) do
		local targetped = GetPlayerPed(v)
		local tCoords = GetEntityCoords(targetped)
		local dist = #(pCoords - tCoords)
		if PlayerPed ~= targetped and dist < 10 then
			local ped = Core.Functions.GetPlayer(v)
			players[#players+1] = {
			id = v,
			coords = GetEntityCoords(targetped),
			name = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname,
			citizenid = ped.PlayerData.citizenid,
			sources = GetPlayerPed(ped.PlayerData.source),
			sourceplayer = ped.PlayerData.source
			}
		end
	end
		table.sort(players, function(a, b)
			return a.name < b.name
		end)
	cb(players)
end)
