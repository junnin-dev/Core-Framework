local Core = exports['core']:GetCoreObject()

local Races = {}

RegisterNetEvent('streetraces:NewRace', function(RaceTable)
    local src = source
    local RaceId = math.random(1000, 9999)
    local xPlayer = Core.Functions.GetPlayer(src)
    if xPlayer.Functions.RemoveMoney('cash', RaceTable.amount, "streetrace-created") then
        Races[RaceId] = RaceTable
        Races[RaceId].creator = Core.Functions.GetIdentifier(src, 'license')
        Races[RaceId].joined[#Races[RaceId].joined+1] = Core.Functions.GetIdentifier(src, 'license')
        TriggerClientEvent('streetraces:SetRace', -1, Races)
        TriggerClientEvent('streetraces:SetRaceId', src, RaceId)
        TriggerClientEvent('Core:Notify', src, "You joind the race for €"..Races[RaceId].amount..",-", 'success')
    end
end)

RegisterNetEvent('streetraces:RaceWon', function(RaceId)
    local src = source
    local xPlayer = Core.Functions.GetPlayer(src)
    xPlayer.Functions.AddMoney('cash', Races[RaceId].pot, "race-won")
    TriggerClientEvent('Core:Notify', src, "You won the race and €"..Races[RaceId].pot..",- recieved", 'success')
    TriggerClientEvent('streetraces:SetRace', -1, Races)
    TriggerClientEvent('streetraces:RaceDone', -1, RaceId, GetPlayerName(src))
end)

RegisterNetEvent('streetraces:JoinRace', function(RaceId)
    local src = source
    local xPlayer = Core.Functions.GetPlayer(src)
    local zPlayer = Core.Functions.GetPlayer(Races[RaceId].creator)
    if zPlayer ~= nil then
        if xPlayer.PlayerData.money.cash >= Races[RaceId].amount then
            Races[RaceId].pot = Races[RaceId].pot + Races[RaceId].amount
            Races[RaceId].joined[#Races[RaceId].joined+1] = Core.Functions.GetIdentifier(src, 'license')
            if xPlayer.Functions.RemoveMoney('cash', Races[RaceId].amount, "streetrace-joined") then
                TriggerClientEvent('streetraces:SetRace', -1, Races)
                TriggerClientEvent('streetraces:SetRaceId', src, RaceId)
                TriggerClientEvent('Core:Notify', zPlayer.PlayerData.source, GetPlayerName(src).." Joined the race", 'primary')
            end
        else
            TriggerClientEvent('Core:Notify', src, "You dont have enough cash", 'error')
        end
    else
        TriggerClientEvent('Core:Notify', src, "The person wo made the race is offline!", 'error')
        Races[RaceId] = {}
    end
end)

Core.Commands.Add("createrace", "Start A Street Race", {{name="amount", help="The Stake Amount For The Race."}}, false, function(source, args)
    local src = source
    local amount = tonumber(args[1])
    if GetJoinedRace(Core.Functions.GetIdentifier(src, 'license')) == 0 then
        TriggerClientEvent('streetraces:CreateRace', src, amount)
    else
        TriggerClientEvent('Core:Notify', src, "You Are Already In A Race", 'error')
    end
end)

Core.Commands.Add("stoprace", "Stop The Race You Created", {}, false, function(source, _)
    CancelRace(source)
end)

Core.Commands.Add("quitrace", "Get Out Of A Race. (You Will NOT Get Your Money Back!)", {}, false, function(source, _)
    local src = source
    local RaceId = GetJoinedRace(Core.Functions.GetIdentifier(src, 'license'))
    if RaceId ~= 0 then
        if GetCreatedRace(Core.Functions.GetIdentifier(src, 'license')) ~= RaceId then
            RemoveFromRace(Core.Functions.GetIdentifier(src, 'license'))
            TriggerClientEvent('Core:Notify', src, "You Have Stepped Out Of The Race! And You Lost Your Money", 'error')
        else
            TriggerClientEvent('Core:Notify', src, "/stoprace To Stop The Race", 'error')
        end
    else
        TriggerClientEvent('Core:Notify', src, "You Are Not In A Race ", 'error')
    end
end)

Core.Commands.Add("startrace", "Start The Race", {}, false, function(source)
    local src = source
    local RaceId = GetCreatedRace(Core.Functions.GetIdentifier(src, 'license'))

    if RaceId ~= 0 then

        Races[RaceId].started = true
        TriggerClientEvent('streetraces:SetRace', -1, Races)
        TriggerClientEvent("streetraces:StartRace", -1, RaceId)
    else
        TriggerClientEvent('Core:Notify', src, "You Have Not Started A Race", 'error')

    end
end)

function CancelRace(source)
    local RaceId = GetCreatedRace(Core.Functions.GetIdentifier(source, 'license'))
    local Player = Core.Functions.GetPlayer(source)

    if RaceId ~= 0 then
        for key in pairs(Races) do
            if Races[key] ~= nil and Races[key].creator == Player.PlayerData.license then
                if not Races[key].started then
                    for _, iden in pairs(Races[key].joined) do
                        local xdPlayer = Core.Functions.GetPlayer(iden)
                            xdPlayer.Functions.AddMoney('cash', Races[key].amount, "race-cancelled")
                            TriggerClientEvent('Core:Notify', xdPlayer.PlayerData.source, "Race Has Stopped, You Got Back $"..Races[key].amount.."", 'error')
                            TriggerClientEvent('streetraces:StopRace', xdPlayer.PlayerData.source)
                            RemoveFromRace(iden)
                    end
                else
                    TriggerClientEvent('Core:Notify', Player.PlayerData.source, "The Race Has Already Started", 'error')
                end
                TriggerClientEvent('Core:Notify', source, "Race Stopped!", 'error')
                Races[key] = nil
            end
        end
        TriggerClientEvent('streetraces:SetRace', -1, Races)
    else
        TriggerClientEvent('Core:Notify', source, "You Have Not Started A Race!", 'error')
    end
end

function RemoveFromRace(identifier)
    for key in pairs(Races) do
        if Races[key] ~= nil and not Races[key].started then
            for i, iden in pairs(Races[key].joined) do
                if iden == identifier then
                    table.remove(Races[key].joined, i)
                end
            end
        end
    end
end

function GetJoinedRace(identifier)
    for key in pairs(Races) do
        if Races[key] ~= nil and not Races[key].started then
            for _, iden in pairs(Races[key].joined) do
                if iden == identifier then
                    return key
                end
            end
        end
    end
    return 0
end

function GetCreatedRace(identifier)
    for key in pairs(Races) do
        if Races[key] ~= nil and Races[key].creator == identifier and not Races[key].started then
            return key
        end
    end
    return 0
end
