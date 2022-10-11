local Core = exports['core']:GetCoreObject()

Core.Commands.Add("binds", "Abrir commandbinding menu", {}, false, function(source, _)
	TriggerClientEvent("commandbinding:client:openUI", source)
end)

RegisterNetEvent('commandbinding:server:setKeyMeta', function(keyMeta)
    local src = source
    local ply = Core.Functions.GetPlayer(src)

    ply.Functions.SetMetaData("commandbinds", keyMeta)
end)
