local Core = exports['core']:GetCoreObject()

Core.Functions.CreateUseableItem("radio", function(source)
    TriggerClientEvent('radio:use', source)
end)

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local Player = Core.Functions.GetPlayer(source)
        return config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty
    end)
end
