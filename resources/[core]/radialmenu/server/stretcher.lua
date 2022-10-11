RegisterNetEvent('radialmenu:server:RemoveStretcher', function(pos, stretcherObject)
    TriggerClientEvent('radialmenu:client:RemoveStretcherFromArea', -1, pos, stretcherObject)
end)

RegisterNetEvent('radialmenu:Stretcher:BusyCheck', function(id, type)
    TriggerClientEvent('radialmenu:Stretcher:client:BusyCheck', id, source, type)
end)

RegisterNetEvent('radialmenu:server:BusyResult', function(isBusy, otherId, type)
    TriggerClientEvent('radialmenu:client:Result', otherId, isBusy, type)
end)