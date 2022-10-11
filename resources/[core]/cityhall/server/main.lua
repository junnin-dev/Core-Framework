local Core = exports['core']:GetCoreObject()
local availableJobs = {
    ["trucker"] = "Trucker",
    ["taxi"] = "Taxi",
    ["tow"] = "Tow Truck",
    ["reporter"] = "News Reporter",
    ["garbage"] = "Garbage Collector",
    ["bus"] = "Bus Driver",
    ["hotdog"] = "Hot Dog Stand"
}

-- Functions

local function giveStarterItems()
    local Player = Core.Functions.GetPlayer(source)
    if not Player then return end
    for _, v in pairs(Core.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, 1, nil, info)
    end
end

-- Callbacks

Core.Functions.CreateCallback('cityhall:server:receiveJobs', function(_, cb)
    cb(availableJobs)
end)

-- Events

RegisterNetEvent('cityhall:server:requestId', function(item, hall)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    local itemInfo = Config.Cityhalls[hall].licenses[item]
    if not Player.Functions.RemoveMoney("cash", itemInfo.cost) then return TriggerClientEvent('Core:Notify', src, ('Você não tem dinheiro suficiente para você, você precisa %s dinheiro'):format(itemInfo.cost), 'error') end
    local info = {}
    if item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    else
        return DropPlayer(src, 'Attempted exploit abuse')
    end
    if not Player.Functions.AddItem(item, 1, nil, info) then return end
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], 'add')
end)

RegisterNetEvent('cityhall:server:sendDriverTest', function(instructors)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    for i = 1, #instructors do
        local citizenid = instructors[i]
        local SchoolPlayer = Core.Functions.GetPlayerByCitizenId(citizenid)
        if SchoolPlayer then
            TriggerClientEvent("cityhall:client:sendDriverEmail", SchoolPlayer.PlayerData.source, Player.PlayerData.charinfo)
        else
            local mailData = {
                sender = "Township",
                subject = "Driving lessons request",
                message = "Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>".. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. "<br />Phone Number: <strong>"..Player.PlayerData.charinfo.phone.."</strong><br><br>Kind regards,<br>Township Los Santos",
                button = {}
            }
            TriggerEvent("phoneserver:sendNewMailToOffline", citizenid, mailData)
        end
    end
    TriggerClientEvent('Core:Notify', src, "Um email foi enviado para as escolas de direção e você será contatado automaticamente", "success", 5000)
end)

RegisterNetEvent('cityhall:server:ApplyJob', function(job, cityhallCoords)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return end
    local ped = GetPlayerPed(src)
    local pedCoords = GetEntityCoords(ped)
    local JobInfo = Core.Shared.Jobs[job]
    if #(pedCoords - cityhallCoords) >= 20.0 or not availableJobs[job] then
        return DropPlayer(source, "Attempted exploit abuse")
    end
    Player.Functions.SetJob(job, 0)
    TriggerClientEvent('Core:Notify', src, Lang:t('info.new_job', {job = JobInfo.label}))
end)

RegisterNetEvent('cityhall:server:getIDs', giveStarterItems)

-- Commands

Core.Commands.Add("drivinglicense", "Dê uma carteira de motorista a alguém", {{"id", "ID of a person"}}, true, function(source, args)
    local Player = Core.Functions.GetPlayer(source)
    local SearchedPlayer = Core.Functions.GetPlayer(tonumber(args[1]))
    if SearchedPlayer then
        if not SearchedPlayer.PlayerData.metadata["licences"]["driver"] then
            for i = 1, #Config.DrivingSchools do
                for id = 1, #Config.DrivingSchools[i].instructors do
                    if Config.DrivingSchools[i].instructors[id] == Player.PlayerData.citizenid then
                        SearchedPlayer.PlayerData.metadata["licences"]["driver"] = true
                        SearchedPlayer.Functions.SetMetaData("licences", SearchedPlayer.PlayerData.metadata["licences"])
                        TriggerClientEvent('Core:Notify', SearchedPlayer.PlayerData.source, "Você passou!Pegue sua carteira de motorista na prefeitura", "success", 5000)
                        TriggerClientEvent('Core:Notify', source, ("Jogador com ID %s recebeu acesso a uma carteira de motorista"):format(SearchedPlayer.PlayerData.source), "success", 5000)
                        break
                    end
                end
            end
        else
            TriggerClientEvent('Core:Notify', source, "Não posso dar permissão para uma carteira de motorista, essa pessoa já tem permissão", "error")
        end
    else
        TriggerClientEvent('Core:Notify', source, "Jogador não online", "error")
    end
end)
