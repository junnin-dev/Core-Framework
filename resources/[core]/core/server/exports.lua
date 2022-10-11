local function SetMethod(methodName, handler)
    if type(methodName) ~= "string" then
        return false, "invalid_method_name"
    end

    Core.Functions[methodName] = handler

    TriggerEvent('Core:Server:UpdateObject')

    return true, "success"
end

Core.Functions.SetMethod = SetMethod
exports("SetMethod", SetMethod)

local function SetField(fieldName, data)
    if type(fieldName) ~= "string" then
        return false, "invalid_field_name"
    end

    Core[fieldName] = data

    TriggerEvent('Core:Server:UpdateObject')

    return true, "success"
end

Core.Functions.SetField = SetField
exports("SetField", SetField)

local function AddJob(jobName, job)
    if type(jobName) ~= "string" then
        return false, "invalid_job_name"
    end

    if Core.Shared.Jobs[jobName] then
        return false, "job_exists"
    end

    Core.Shared.Jobs[jobName] = job

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Jobs', jobName, job)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.AddJob = AddJob
exports('AddJob', AddJob)

local function AddJobs(jobs)
    local shouldContinue = true
    local message = "success"
    local errorItem = nil

    for key, value in pairs(jobs) do
        if type(key) ~= "string" then
            message = 'invalid_job_name'
            shouldContinue = false
            errorItem = jobs[key]
            break
        end

        if Core.Shared.Jobs[key] then
            message = 'job_exists'
            shouldContinue = false
            errorItem = jobs[key]
            break
        end

        Core.Shared.Jobs[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('Core:Client:OnSharedUpdateMultiple', -1, 'Jobs', jobs)
    TriggerEvent('Core:Server:UpdateObject')
    return true, message, nil
end

Core.Functions.AddJobs = AddJobs
exports('AddJobs', AddJobs)

local function RemoveJob(jobName)
    if type(jobName) ~= "string" then
        return false, "invalid_job_name"
    end

    if not Core.Shared.Jobs[jobName] then
        return false, "job_not_exists"
    end

    Core.Shared.Jobs[jobName] = nil

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Jobs', jobName, nil)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.RemoveJob = RemoveJob
exports('RemoveJob', RemoveJob)

local function UpdateJob(jobName, job)
    if type(jobName) ~= "string" then
        return false, "invalid_job_name"
    end

    if not Core.Shared.Jobs[jobName] then
        return false, "job_not_exists"
    end

    Core.Shared.Jobs[jobName] = job

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Jobs', jobName, job)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.UpdateJob = UpdateJob
exports('UpdateJob', UpdateJob)

local function AddItem(itemName, item)
    if type(itemName) ~= "string" then
        return false, "invalid_item_name"
    end

    if Core.Shared.Items[itemName] then
        return false, "item_exists"
    end

    Core.Shared.Items[itemName] = item

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Items', itemName, item)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.AddItem = AddItem
exports('AddItem', AddItem)

local function UpdateItem(itemName, item)
    if type(itemName) ~= "string" then
        return false, "invalid_item_name"
    end
    if not Core.Shared.Items[itemName] then
        return false, "item_not_exists"
    end
    Core.Shared.Items[itemName] = item
    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Items', itemName, item)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.UpdateItem = UpdateItem
exports('UpdateItem', UpdateItem)

local function AddItems(items)
    local shouldContinue = true
    local message = "success"
    local errorItem = nil

    for key, value in pairs(items) do
        if type(key) ~= "string" then
            message = "invalid_item_name"
            shouldContinue = false
            errorItem = items[key]
            break
        end

        if Core.Shared.Items[key] then
            message = "item_exists"
            shouldContinue = false
            errorItem = items[key]
            break
        end

        Core.Shared.Items[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('Core:Client:OnSharedUpdateMultiple', -1, 'Items', items)
    TriggerEvent('Core:Server:UpdateObject')
    return true, message, nil
end

Core.Functions.AddItems = AddItems
exports('AddItems', AddItems)

local function RemoveItem(itemName)
    if type(itemName) ~= "string" then
        return false, "invalid_item_name"
    end

    if not Core.Shared.Items[itemName] then
        return false, "item_not_exists"
    end

    Core.Shared.Items[itemName] = nil

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Items', itemName, nil)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.RemoveItem = RemoveItem
exports('RemoveItem', RemoveItem)

local function AddGang(gangName, gang)
    if type(gangName) ~= "string" then
        return false, "invalid_gang_name"
    end

    if Core.Shared.Gangs[gangName] then
        return false, "gang_exists"
    end

    Core.Shared.Gangs[gangName] = gang

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Gangs', gangName, gang)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.AddGang = AddGang
exports('AddGang', AddGang)

local function AddGangs(gangs)
    local shouldContinue = true
    local message = "success"
    local errorItem = nil

    for key, value in pairs(gangs) do
        if type(key) ~= "string" then
            message = "invalid_gang_name"
            shouldContinue = false
            errorItem = gangs[key]
            break
        end

        if Core.Shared.Gangs[key] then
            message = "gang_exists"
            shouldContinue = false
            errorItem = gangs[key]
            break
        end

        Core.Shared.Gangs[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('Core:Client:OnSharedUpdateMultiple', -1, 'Gangs', gangs)
    TriggerEvent('Core:Server:UpdateObject')
    return true, message, nil
end

Core.Functions.AddGangs = AddGangs
exports('AddGangs', AddGangs)

local function RemoveGang(gangName)
    if type(gangName) ~= "string" then
        return false, "invalid_gang_name"
    end

    if not Core.Shared.Gangs[gangName] then
        return false, "gang_not_exists"
    end

    Core.Shared.Gangs[gangName] = nil

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Gangs', gangName, nil)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.RemoveGang = RemoveGang
exports('RemoveGang', RemoveGang)

local function UpdateGang(gangName, gang)
    if type(gangName) ~= "string" then
        return false, "invalid_gang_name"
    end

    if not Core.Shared.Gangs[gangName] then
        return false, "gang_not_exists"
    end

    Core.Shared.Gangs[gangName] = gang

    TriggerClientEvent('Core:Client:OnSharedUpdate', -1, 'Gangs', gangName, gang)
    TriggerEvent('Core:Server:UpdateObject')
    return true, "success"
end

Core.Functions.UpdateGang = UpdateGang
exports('UpdateGang', UpdateGang)

local function GetCoreVersion(InvokingResource)
    local resourceVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
    if InvokingResource and InvokingResource ~= '' then
        print(("%s Chamado Core Version Check: %s"):format(InvokingResource or 'Unknown Resource', resourceVersion))
    end
    return resourceVersion
end

Core.Functions.GetCoreVersion = GetCoreVersion
exports('GetCoreVersion', GetCoreVersion)

local function ExploitBan(playerId, origin)
    local name = GetPlayerName(playerId)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        name,
        Core.Functions.GetIdentifier(playerId, 'license'),
        Core.Functions.GetIdentifier(playerId, 'discord'),
        Core.Functions.GetIdentifier(playerId, 'ip'),
        origin,
        2147483647,
        'Anti Cheat'
    })
    DropPlayer(playerId, Lang:t('info.exploit_banned', {discord = Core.Config.Server.Discord}))
    TriggerEvent("log:server:CreateLog", "anticheat", "Anti-Cheat", "red", name .. " foi banido para explorar " .. origin, true)
end

exports('ExploitBan', ExploitBan)
