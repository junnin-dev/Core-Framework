Core.Players = {}
Core.Player = {}

function Core.Player.Login(source, citizenid, newData)
    if source and source ~= '' then
        if citizenid then
            local license = Core.Functions.GetIdentifier(source, 'license')
            local PlayerData = MySQL.prepare.await('SELECT * FROM players where citizenid = ?', { citizenid })
            if PlayerData and license == PlayerData.license then
                PlayerData.money = json.decode(PlayerData.money)
                PlayerData.job = json.decode(PlayerData.job)
                PlayerData.position = json.decode(PlayerData.position)
                PlayerData.metadata = json.decode(PlayerData.metadata)
                PlayerData.charinfo = json.decode(PlayerData.charinfo)
                if PlayerData.gang then
                    PlayerData.gang = json.decode(PlayerData.gang)
                else
                    PlayerData.gang = {}
                end
                Core.Player.CheckPlayerData(source, PlayerData)
            else
                DropPlayer(source, Lang:t("info.exploit_dropped"))
                TriggerEvent('log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'white', GetPlayerName(source) .. ' Foi descartado para a participação de personagens', false)
            end
        else
            Core.Player.CheckPlayerData(source, newData)
        end
        return true
    else
        Core.ShowError(GetCurrentResourceName(), 'ERROR Core.PLAYER.LOGIN - NO SOURCE GIVEN!')
        return false
    end
end

function Core.Player.GetOfflinePlayer(citizenid)
    if citizenid then
        local PlayerData = MySQL.Sync.prepare('SELECT * FROM players where citizenid = ?', {citizenid})
        if PlayerData then
            PlayerData.money = json.decode(PlayerData.money)
            PlayerData.job = json.decode(PlayerData.job)
            PlayerData.position = json.decode(PlayerData.position)
            PlayerData.metadata = json.decode(PlayerData.metadata)
            PlayerData.charinfo = json.decode(PlayerData.charinfo)
            if PlayerData.gang then
                PlayerData.gang = json.decode(PlayerData.gang)
            else
                PlayerData.gang = {}
            end

            return Core.Player.CheckPlayerData(nil, PlayerData)
        end
    end
    return nil
end

function Core.Player.CheckPlayerData(source, PlayerData)
    PlayerData = PlayerData or {}
    local Offline = true
    if source then
        PlayerData.source = source
        PlayerData.license = PlayerData.license or Core.Functions.GetIdentifier(source, 'license')
        PlayerData.name = GetPlayerName(source)
        Offline = false
    end

    PlayerData.citizenid = PlayerData.citizenid or Core.Player.CreateCitizenId()
    PlayerData.cid = PlayerData.cid or 1
    PlayerData.money = PlayerData.money or {}
    PlayerData.optin = PlayerData.optin or true
    for moneytype, startamount in pairs(Core.Config.Money.MoneyTypes) do
        PlayerData.money[moneytype] = PlayerData.money[moneytype] or startamount
    end

    PlayerData.charinfo = PlayerData.charinfo or {}
    PlayerData.charinfo.firstname = PlayerData.charinfo.firstname or 'Firstname'
    PlayerData.charinfo.lastname = PlayerData.charinfo.lastname or 'Lastname'
    PlayerData.charinfo.birthdate = PlayerData.charinfo.birthdate or '00-00-0000'
    PlayerData.charinfo.gender = PlayerData.charinfo.gender or 0
    PlayerData.charinfo.backstory = PlayerData.charinfo.backstory or 'placeholder backstory'
    PlayerData.charinfo.nationality = PlayerData.charinfo.nationality or 'USA'
    PlayerData.charinfo.phone = PlayerData.charinfo.phone or Core.Functions.CreatePhoneNumber()
    PlayerData.charinfo.account = PlayerData.charinfo.account or Core.Functions.CreateAccountNumber()
    PlayerData.metadata = PlayerData.metadata or {}
    PlayerData.metadata['hunger'] = PlayerData.metadata['hunger'] or 100
    PlayerData.metadata['thirst'] = PlayerData.metadata['thirst'] or 100
    PlayerData.metadata['stress'] = PlayerData.metadata['stress'] or 0
    PlayerData.metadata['isdead'] = PlayerData.metadata['isdead'] or false
    PlayerData.metadata['inlaststand'] = PlayerData.metadata['inlaststand'] or false
    PlayerData.metadata['armor'] = PlayerData.metadata['armor'] or 0
    PlayerData.metadata['ishandcuffed'] = PlayerData.metadata['ishandcuffed'] or false
    PlayerData.metadata['tracker'] = PlayerData.metadata['tracker'] or false
    PlayerData.metadata['injail'] = PlayerData.metadata['injail'] or 0
    PlayerData.metadata['jailitems'] = PlayerData.metadata['jailitems'] or {}
    PlayerData.metadata['status'] = PlayerData.metadata['status'] or {}
    PlayerData.metadata['phone'] = PlayerData.metadata['phone'] or {}
    PlayerData.metadata['fitbit'] = PlayerData.metadata['fitbit'] or {}
    PlayerData.metadata['commandbinds'] = PlayerData.metadata['commandbinds'] or {}
    PlayerData.metadata['bloodtype'] = PlayerData.metadata['bloodtype'] or Core.Config.Player.Bloodtypes[math.random(1, #Core.Config.Player.Bloodtypes)]
    PlayerData.metadata['dealerrep'] = PlayerData.metadata['dealerrep'] or 0
    PlayerData.metadata['craftingrep'] = PlayerData.metadata['craftingrep'] or 0
    PlayerData.metadata['attachmentcraftingrep'] = PlayerData.metadata['attachmentcraftingrep'] or 0
    PlayerData.metadata['currentapartment'] = PlayerData.metadata['currentapartment'] or nil
    PlayerData.metadata['jobrep'] = PlayerData.metadata['jobrep'] or {}
    PlayerData.metadata['jobrep']['tow'] = PlayerData.metadata['jobrep']['tow'] or 0
    PlayerData.metadata['jobrep']['trucker'] = PlayerData.metadata['jobrep']['trucker'] or 0
    PlayerData.metadata['jobrep']['taxi'] = PlayerData.metadata['jobrep']['taxi'] or 0
    PlayerData.metadata['jobrep']['hotdog'] = PlayerData.metadata['jobrep']['hotdog'] or 0
    PlayerData.metadata['callsign'] = PlayerData.metadata['callsign'] or 'NO CALLSIGN'
    PlayerData.metadata['fingerprint'] = PlayerData.metadata['fingerprint'] or Core.Player.CreateFingerId()
    PlayerData.metadata['walletid'] = PlayerData.metadata['walletid'] or Core.Player.CreateWalletId()
    PlayerData.metadata['criminalrecord'] = PlayerData.metadata['criminalrecord'] or {
        ['hasRecord'] = false,
        ['date'] = nil
    }
    PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
        ['driver'] = true,
        ['business'] = false,
        ['weapon'] = false
    }
    PlayerData.metadata['inside'] = PlayerData.metadata['inside'] or {
        house = nil,
        apartment = {
            apartmentType = nil,
            apartmentId = nil,
        }
    }
    PlayerData.metadata['phonedata'] = PlayerData.metadata['phonedata'] or {
        SerialNumber = Core.Player.CreateSerialNumber(),
        InstalledApps = {},
    }

    if PlayerData.job and PlayerData.job.name and not Core.Shared.Jobs[PlayerData.job.name] then PlayerData.job = nil end
    PlayerData.job = PlayerData.job or {}
    PlayerData.job.name = PlayerData.job.name or 'unemployed'
    PlayerData.job.label = PlayerData.job.label or 'Civilian'
    PlayerData.job.payment = PlayerData.job.payment or 10
    PlayerData.job.type = PlayerData.job.type or 'none'
    if Core.Shared.ForceJobDefaultDutyAtLogin or PlayerData.job.onduty == nil then
        PlayerData.job.onduty = Core.Shared.Jobs[PlayerData.job.name].defaultDuty
    end
    PlayerData.job.isboss = PlayerData.job.isboss or false
    PlayerData.job.grade = PlayerData.job.grade or {}
    PlayerData.job.grade.name = PlayerData.job.grade.name or 'Freelancer'
    PlayerData.job.grade.level = PlayerData.job.grade.level or 0

    if PlayerData.gang and PlayerData.gang.name and not Core.Shared.Gangs[PlayerData.gang.name] then PlayerData.gang = nil end
    PlayerData.gang = PlayerData.gang or {}
    PlayerData.gang.name = PlayerData.gang.name or 'none'
    PlayerData.gang.label = PlayerData.gang.label or 'No Gang Affiliaton'
    PlayerData.gang.isboss = PlayerData.gang.isboss or false
    PlayerData.gang.grade = PlayerData.gang.grade or {}
    PlayerData.gang.grade.name = PlayerData.gang.grade.name or 'none'
    PlayerData.gang.grade.level = PlayerData.gang.grade.level or 0
    PlayerData.position = PlayerData.position or JNConfig.DefaultSpawn
    PlayerData.items = GetResourceState('inventory') ~= 'missing' and exports['inventory']:LoadInventory(PlayerData.source, PlayerData.citizenid) or {}
    return Core.Player.CreatePlayer(PlayerData, Offline)
end


function Core.Player.Logout(source)
    TriggerClientEvent('Core:Client:OnPlayerUnload', source)
    TriggerEvent('Core:Server:OnPlayerUnload', source)
    TriggerClientEvent('Core:Player:UpdatePlayerData', source)
    Wait(200)
    Core.Players[source] = nil
end


function Core.Player.CreatePlayer(PlayerData, Offline)
    local self = {}
    self.Functions = {}
    self.PlayerData = PlayerData
    self.Offline = Offline

    function self.Functions.UpdatePlayerData()
        if self.Offline then return end
        TriggerEvent('Core:Player:SetPlayerData', self.PlayerData)
        TriggerClientEvent('Core:Player:SetPlayerData', self.PlayerData.source, self.PlayerData)
    end

    function self.Functions.SetJob(job, grade)
        job = job:lower()
        grade = tostring(grade) or '0'
        if not Core.Shared.Jobs[job] then return false end
        self.PlayerData.job.name = job
        self.PlayerData.job.label = Core.Shared.Jobs[job].label
        self.PlayerData.job.onduty = Core.Shared.Jobs[job].defaultDuty
        self.PlayerData.job.type = Core.Shared.Jobs[job].type or 'none'
        if Core.Shared.Jobs[job].grades[grade] then
            local jobgrade = Core.Shared.Jobs[job].grades[grade]
            self.PlayerData.job.grade = {}
            self.PlayerData.job.grade.name = jobgrade.name
            self.PlayerData.job.grade.level = tonumber(grade)
            self.PlayerData.job.payment = jobgrade.payment or 30
            self.PlayerData.job.isboss = jobgrade.isboss or false
        else
            self.PlayerData.job.grade = {}
            self.PlayerData.job.grade.name = 'No Grades'
            self.PlayerData.job.grade.level = 0
            self.PlayerData.job.payment = 30
            self.PlayerData.job.isboss = false
        end

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            TriggerEvent('Core:Server:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
            TriggerClientEvent('Core:Client:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
        end

        return true
    end

    function self.Functions.SetGang(gang, grade)
        gang = gang:lower()
        grade = tostring(grade) or '0'
        if not Core.Shared.Gangs[gang] then return false end
        self.PlayerData.gang.name = gang
        self.PlayerData.gang.label = Core.Shared.Gangs[gang].label
        if Core.Shared.Gangs[gang].grades[grade] then
            local ganggrade = Core.Shared.Gangs[gang].grades[grade]
            self.PlayerData.gang.grade = {}
            self.PlayerData.gang.grade.name = ganggrade.name
            self.PlayerData.gang.grade.level = tonumber(grade)
            self.PlayerData.gang.isboss = ganggrade.isboss or false
        else
            self.PlayerData.gang.grade = {}
            self.PlayerData.gang.grade.name = 'No Grades'
            self.PlayerData.gang.grade.level = 0
            self.PlayerData.gang.isboss = false
        end

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            TriggerEvent('Core:Server:OnGangUpdate', self.PlayerData.source, self.PlayerData.gang)
            TriggerClientEvent('Core:Client:OnGangUpdate', self.PlayerData.source, self.PlayerData.gang)
        end

        return true
    end

    function self.Functions.SetJobDuty(onDuty)
        self.PlayerData.job.onduty = not not onDuty
        self.Functions.UpdatePlayerData()
    end

    function self.Functions.SetPlayerData(key, val)
        if not key or type(key) ~= 'string' then return end
        self.PlayerData[key] = val
        self.Functions.UpdatePlayerData()
    end

    function self.Functions.SetMetaData(meta, val)
        if not meta or type(meta) ~= 'string' then return end
        if meta == 'hunger' or meta == 'thirst' then
            val = val > 100 and 100 or val
        end
        self.PlayerData.metadata[meta] = val
        self.Functions.UpdatePlayerData()
    end

    function self.Functions.GetMetaData(meta)
        if not meta or type(meta) ~= 'string' then return end
        return self.PlayerData.metadata[meta]
    end

    function self.Functions.AddJobReputation(amount)
        if not amount then return end
        amount = tonumber(amount)
        self.PlayerData.metadata['jobrep'][self.PlayerData.job.name] = self.PlayerData.metadata['jobrep'][self.PlayerData.job.name] + amount
        self.Functions.UpdatePlayerData()
    end

    function self.Functions.AddMoney(moneytype, amount, reason)
        reason = reason or 'unknown'
        moneytype = moneytype:lower()
        amount = tonumber(amount)
        if amount < 0 then return end
        if not self.PlayerData.money[moneytype] then return false end
        self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] + amount

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            if amount > 100000 then
                TriggerEvent('log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
            else
                TriggerEvent('log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
            end
            TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, false)
            TriggerClientEvent('Core:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, "add", reason)
            TriggerEvent('Core:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, "add", reason)
        end

        return true
    end

    function self.Functions.RemoveMoney(moneytype, amount, reason)
        reason = reason or 'unknown'
        moneytype = moneytype:lower()
        amount = tonumber(amount)
        if amount < 0 then return end
        if not self.PlayerData.money[moneytype] then return false end
        for _, mtype in pairs(Core.Config.Money.DontAllowMinus) do
            if mtype == moneytype then
                if (self.PlayerData.money[moneytype] - amount) < 0 then
                    return false
                end
            end
        end
        self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] - amount

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            if amount > 100000 then
                TriggerEvent('log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
            else
                TriggerEvent('log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
            end
            TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, true)
            if moneytype == 'bank' then
                TriggerClientEvent('phoneclient:RemoveBankMoney', self.PlayerData.source, amount)
            end
            TriggerClientEvent('Core:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, "remove", reason)
            TriggerEvent('Core:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, "remove", reason)
        end

        return true
    end

    function self.Functions.SetMoney(moneytype, amount, reason)
        reason = reason or 'unknown'
        moneytype = moneytype:lower()
        amount = tonumber(amount)
        if amount < 0 then return false end
        if not self.PlayerData.money[moneytype] then return false end
        local difference = amount - self.PlayerData.money[moneytype]
        self.PlayerData.money[moneytype] = amount

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            TriggerEvent('log:server:CreateLog', 'playermoney', 'SetMoney', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') set, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
            TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, math.abs(difference), difference < 0)
            TriggerClientEvent('Core:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, "set", reason)
            TriggerEvent('Core:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, "set", reason)
        end

        return true
    end

    function self.Functions.GetMoney(moneytype)
        if not moneytype then return false end
        moneytype = moneytype:lower()
        return self.PlayerData.money[moneytype]
    end

    function self.Functions.SetCreditCard(cardNumber)
        self.PlayerData.charinfo.card = cardNumber
        self.Functions.UpdatePlayerData()
    end

    function self.Functions.GetCardSlot(cardNumber, cardType)
        local item = tostring(cardType):lower()
        local slots = exports['inventory']:GetSlotsByItem(self.PlayerData.items, item)
        for _, slot in pairs(slots) do
            if slot then
                if self.PlayerData.items[slot].info.cardNumber == cardNumber then
                    return slot
                end
            end
        end
        return nil
    end

    function self.Functions.Save()
        if self.Offline then
            Core.Player.SaveOffline(self.PlayerData)
        else
            Core.Player.Save(self.PlayerData.source)
        end
    end

    function self.Functions.Logout()
        if self.Offline then return end
        Core.Player.Logout(self.PlayerData.source)
    end

    function self.Functions.AddMethod(methodName, handler)
        self.Functions[methodName] = handler
    end

    function self.Functions.AddField(fieldName, data)
        self[fieldName] = data
    end

    if self.Offline then
        return self
    else
        Core.Players[self.PlayerData.source] = self
        Core.Player.Save(self.PlayerData.source)

        TriggerEvent('Core:Server:PlayerLoaded', self)
        self.Functions.UpdatePlayerData()
    end
end

function Core.Functions.AddPlayerMethod(ids, methodName, handler)
    local idType = type(ids)
    if idType == "number" then
        if ids == -1 then
            for _, v in pairs(Core.Players) do
                v.Functions.AddMethod(methodName, handler)
            end
        else
            if not Core.Players[ids] then return end

            Core.Players[ids].Functions.AddMethod(methodName, handler)
        end
    elseif idType == "table" and table.type(ids) == "array" then
        for i = 1, #ids do
            Core.Functions.AddPlayerMethod(ids[i], methodName, handler)
        end
    end
end

function Core.Functions.AddPlayerField(ids, fieldName, data)
    local idType = type(ids)
    if idType == "number" then
        if ids == -1 then
            for _, v in pairs(Core.Players) do
                v.Functions.AddField(fieldName, data)
            end
        else
            if not Core.Players[ids] then return end

            Core.Players[ids].Functions.AddField(fieldName, data)
        end
    elseif idType == "table" and table.type(ids) == "array" then
        for i = 1, #ids do
            Core.Functions.AddPlayerField(ids[i], fieldName, data)
        end
    end
end


function Core.Player.Save(source)
    local ped = GetPlayerPed(source)
    local pcoords = GetEntityCoords(ped)
    local PlayerData = Core.Players[source].PlayerData
    if PlayerData then
        MySQL.insert('INSERT INTO players (citizenid, cid, license, name, money, charinfo, job, gang, position, metadata) VALUES (:citizenid, :cid, :license, :name, :money, :charinfo, :job, :gang, :position, :metadata) ON DUPLICATE KEY UPDATE cid = :cid, name = :name, money = :money, charinfo = :charinfo, job = :job, gang = :gang, position = :position, metadata = :metadata', {
            citizenid = PlayerData.citizenid,
            cid = tonumber(PlayerData.cid),
            license = PlayerData.license,
            name = PlayerData.name,
            money = json.encode(PlayerData.money),
            charinfo = json.encode(PlayerData.charinfo),
            job = json.encode(PlayerData.job),
            gang = json.encode(PlayerData.gang),
            position = json.encode(pcoords),
            metadata = json.encode(PlayerData.metadata)
        })
        if GetResourceState('inventory') ~= 'missing' then exports['inventory']:SaveInventory(source) end
        Core.ShowSuccess(GetCurrentResourceName(), PlayerData.name .. ' Jogador salvo!')
    else
        Core.ShowError(GetCurrentResourceName(), 'ERROR Core.PLAYER.SAVE - PLAYERDATA IS EMPTY!')
    end
end

function Core.Player.SaveOffline(PlayerData)
    if PlayerData then
        MySQL.Async.insert('INSERT INTO players (citizenid, cid, license, name, money, charinfo, job, gang, position, metadata) VALUES (:citizenid, :cid, :license, :name, :money, :charinfo, :job, :gang, :position, :metadata) ON DUPLICATE KEY UPDATE cid = :cid, name = :name, money = :money, charinfo = :charinfo, job = :job, gang = :gang, position = :position, metadata = :metadata', {
            citizenid = PlayerData.citizenid,
            cid = tonumber(PlayerData.cid),
            license = PlayerData.license,
            name = PlayerData.name,
            money = json.encode(PlayerData.money),
            charinfo = json.encode(PlayerData.charinfo),
            job = json.encode(PlayerData.job),
            gang = json.encode(PlayerData.gang),
            position = json.encode(PlayerData.position),
            metadata = json.encode(PlayerData.metadata)
        })
        if GetResourceState('inventory') ~= 'missing' then exports['inventory']:SaveInventory(PlayerData, true) end
        Core.ShowSuccess(GetCurrentResourceName(), PlayerData.name .. ' Jogador offline salvo!')
    else
        Core.ShowError(GetCurrentResourceName(), 'ERROR Core.PLAYER.SAVEOFFLINE - PLAYERDATA IS EMPTY!')
    end
end


local playertables = {
    { table = 'players' },
    { table = 'apartments' },
    { table = 'bank_accounts' },
    { table = 'crypto_transactions' },
    { table = 'phone_invoices' },
    { table = 'phone_messages' },
    { table = 'playerskins' },
    { table = 'player_contacts' },
    { table = 'player_houses' },
    { table = 'player_mails' },
    { table = 'player_outfits' },
    { table = 'player_vehicles' }
}

function Core.Player.DeleteCharacter(source, citizenid)
    local license = Core.Functions.GetIdentifier(source, 'license')
    local result = MySQL.scalar.await('SELECT license FROM players where citizenid = ?', { citizenid })
    if license == result then
        local query = "DELETE FROM %s WHERE citizenid = ?"
        local tableCount = #playertables
        local queries = table.create(tableCount, 0)

        for i = 1, tableCount do
            local v = playertables[i]
            queries[i] = {query = query:format(v.table), values = { citizenid }}
        end

        MySQL.transaction(queries, function(result2)
            if result2 then
                TriggerEvent('log:server:CreateLog', 'joinleave', 'Character Deleted', 'red', '**' .. GetPlayerName(source) .. '** ' .. license .. ' deleted **' .. citizenid .. '**..')
            end
        end)
    else
        DropPlayer(source, Lang:t("info.exploit_dropped"))
        TriggerEvent('log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'white', GetPlayerName(source) .. ' Foi descartado para explorar a exclusão de personagens', true)
    end
end

function Core.Player.ForceDeleteCharacter(citizenid)
    local result = MySQL.scalar.await('SELECT license FROM players where citizenid = ?', { citizenid })
    if result then
        local query = "DELETE FROM %s WHERE citizenid = ?"
        local tableCount = #playertables
        local queries = table.create(tableCount, 0)
        local Player = Core.Functions.GetPlayerByCitizenId(citizenid)

        if Player then
            DropPlayer(Player.PlayerData.source, "Um administrador excluiu o personagem que você está usando atualmente")
        end
        for i = 1, tableCount do
            local v = playertables[i]
            queries[i] = {query = query:format(v.table), values = { citizenid }}
        end

        MySQL.transaction(queries, function(result2)
            if result2 then
                TriggerEvent('log:server:CreateLog', 'joinleave', 'Força de personagem excluída', 'red', 'Character **' .. citizenid .. '** foi excluído')
            end
        end)
    end
end


function Core.Player.SaveInventory(source)
    if GetResourceState('inventory') == 'missing' then return end
    exports['inventory']:SaveInventory(source, false)
end

function Core.Player.SaveOfflineInventory(PlayerData)
    if GetResourceState('inventory') == 'missing' then return end
    exports['inventory']:SaveInventory(PlayerData, true)
end

function Core.Player.GetTotalWeight(items)
    if GetResourceState('inventory') == 'missing' then return end
    return exports['inventory']:GetTotalWeight(items)
end

function Core.Player.GetSlotsByItem(items, itemName)
    if GetResourceState('inventory') == 'missing' then return end
    return exports['inventory']:GetSlotsByItem(items, itemName)
end

function Core.Player.GetFirstSlotByItem(items, itemName)
    if GetResourceState('inventory') == 'missing' then return end
    return exports['inventory']:GetFirstSlotByItem(items, itemName)
end


function Core.Player.CreateCitizenId()
    local UniqueFound = false
    local CitizenId = nil
    while not UniqueFound do
        CitizenId = tostring(Core.Shared.RandomStr(3) .. Core.Shared.RandomInt(5)):upper()
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE citizenid = ?', { CitizenId })
        if result == 0 then
            UniqueFound = true
        end
    end
    return CitizenId
end

function Core.Functions.CreateAccountNumber()
    local UniqueFound = false
    local AccountNumber = nil
    while not UniqueFound do
        AccountNumber = 'US0' .. math.random(1, 9) .. 'Core' .. math.random(1111, 9999) .. math.random(1111, 9999) .. math.random(11, 99)
        local query = '%' .. AccountNumber .. '%'
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE charinfo LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return AccountNumber
end

function Core.Functions.CreatePhoneNumber()
    local UniqueFound = false
    local PhoneNumber = nil
    while not UniqueFound do
        PhoneNumber = math.random(100,999) .. math.random(1000000,9999999)
        local query = '%' .. PhoneNumber .. '%'
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE charinfo LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return PhoneNumber
end

function Core.Player.CreateFingerId()
    local UniqueFound = false
    local FingerId = nil
    while not UniqueFound do
        FingerId = tostring(Core.Shared.RandomStr(2) .. Core.Shared.RandomInt(3) .. Core.Shared.RandomStr(1) .. Core.Shared.RandomInt(2) .. Core.Shared.RandomStr(3) .. Core.Shared.RandomInt(4))
        local query = '%' .. FingerId .. '%'
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM `players` WHERE `metadata` LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return FingerId
end

function Core.Player.CreateWalletId()
    local UniqueFound = false
    local WalletId = nil
    while not UniqueFound do
        WalletId = 'CORE-' .. math.random(11111111, 99999999)
        local query = '%' .. WalletId .. '%'
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE metadata LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return WalletId
end

function Core.Player.CreateSerialNumber()
    local UniqueFound = false
    local SerialNumber = nil
    while not UniqueFound do
        SerialNumber = math.random(11111111, 99999999)
        local query = '%' .. SerialNumber .. '%'
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE metadata LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return SerialNumber
end

PaycheckInterval()
