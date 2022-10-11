local Core = exports['core']:GetCoreObject()

Core.Functions.CreateCallback('scoreboard:server:GetConfig', function(_, cb)
    cb(Config.IllegalActions)
end)

Core.Functions.CreateCallback('scoreboard:server:GetScoreboardData', function(_, cb)
    local totalPlayers = 0
    local policeCount = 0
    local players = {}

    for _, v in pairs(Core.Functions.GetJNPlayers()) do
        if v then
            totalPlayers += 1

            if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
                policeCount += 1
            end

            players[v.PlayerData.source] = {}
            players[v.PlayerData.source].optin = Core.Functions.IsOptin(v.PlayerData.source)
        end
    end
    cb(totalPlayers, policeCount, players)
end)

RegisterNetEvent('scoreboard:server:SetActivityBusy', function(activity, bool)
    Config.IllegalActions[activity].busy = bool
    TriggerClientEvent('scoreboard:client:SetActivityBusy', -1, activity, bool)
end)