local Core = exports['core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, 'Você foi Kickado por tar AFK')
end)

Core.Functions.CreateCallback('afkkick:server:GetPermissions', function(source, cb)
    cb(Core.Functions.GetPermission(source))
end)
