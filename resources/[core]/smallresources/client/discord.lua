local Core = exports['core']:GetCoreObject()

CreateThread(function()
    while true do
        SetDiscordAppId()
        SetDiscordRichPresenceAsset('logo_name')
        SetDiscordRichPresenceAssetText('This is a lage icon with text')
        SetDiscordRichPresenceAssetSmall('logo_name')
        SetDiscordRichPresenceAssetSmallText('This is a lsmall icon with text')

        Core.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetRichPresence('Players: '..result..'/64')
        end)
        SetDiscordRichPresenceAction(0, "First Button!", "fivem://connect/localhost:30120")
        SetDiscordRichPresenceAction(1, "Second Button!", "fivem://connect/localhost:30120")

        Wait(60000)
    end
end)
