function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- É possível interagir com entidades através de paredes, então isso deve ser baixo
Config.MaxDistance = 7.0

-- Ativar opções de depuração
Config.Debug = false

-- Valores suportados: true, false
Config.Standalone = false

-- Ativar contornos em torno da entidade que você está olhando
Config.EnableOutline = false

-- Se deve ter o alvo como uma alternância ou não
Config.Toggle = false

-- Desenhe um sprite no centro de uma poliónea para sugerir onde está localizado
Config.DrawSprite = false

-- A distância padrão para desenhar o sprite
Config.DrawDistance = 10.0

-- A cor do sprite no RGB, o primeiro valor é vermelho, o segundo valor é verde, o terceiro valor é azul e o último valor é alfa (opacidade).Aqui está um link para um seletor de cores para obter esses valores: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- A cor do sprite no RGB Quando o poliZona é direcionado, o primeiro valor é vermelho, o segundo valor é verde, o terceiro valor é azul e o último valor é alfa (opacidade).Aqui está um link para um seletor de cores para obter esses valores: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- A cor do contorno no RGB, o primeiro valor é vermelho, o segundo valor é verde, o terceiro valor é azul e o último valor é alfa (opacidade).Aqui está um link para um seletor de cores para obter esses valores: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Ativar opções padrão (alternando portas de veículos)
Config.EnableDefaultOptions = true

-- Desative o olho alvo enquanto estiver em um veículo
Config.DisableInVehicle = false

-- Chave para abrir o olho de destino, aqui você pode encontrar todos os nomes: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Controle para a detecção de pressionar as teclas no menu de contexto, é o botão direito do mouse por padrão, os controles são encontrados aqui https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- Tudo isso está vazio para você preencher, consulte os arquivos .md para obter ajuda para preenchê -los em

Config.CircleZones = {

}

Config.BoxZones = {

}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {

}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local Core = exports['core']:GetCoreObject()
		local PlayerData = Core.Functions.GetPlayerData()

		ItemCheck = Core.Functions.HasItem

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('Core:Client:OnPlayerLoaded', function()
			PlayerData = Core.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('Core:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('Core:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('Core:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('Core:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end