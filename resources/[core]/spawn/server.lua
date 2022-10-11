local Core = exports['core']:GetCoreObject()

Core.Functions.CreateCallback('spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid ~= nil then
        local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] ~= nil then
            print(json.encode(houses))
            cb(houses)
        else
            cb({})
        end
    else
        cb({})
    end
end)
