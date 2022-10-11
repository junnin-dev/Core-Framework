local Core = exports['core']:GetCoreObject()

Core.Commands.Add("newscam", "Pegue uma câmera de notícias", {}, false, function(source, _)
    local Player = Core.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Cam:ToggleCam", source)
    end
end)

Core.Commands.Add("newsmic", "Pegue um microfone de notícias", {}, false, function(source, _)
    local Player = Core.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Mic:ToggleMic", source)
    end
end)

Core.Commands.Add("newsbmic", "Pegue um microfone de boom", {}, false, function(source, _)
    local Player = Core.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Mic:ToggleBMic", source)
    end
end)
