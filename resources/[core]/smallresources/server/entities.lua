AddEventHandler("entityCreating", function(handle)
    local entityModel = GetEntityModel(handle)

    if Config.BlacklistedVehs[entityModel] or Config.BlacklistedPeds[entityModel] then
        CancelEvent()
    end
end)