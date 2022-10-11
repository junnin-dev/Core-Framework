local Core = exports['core']:GetCoreObject()
local PlayerGang = Core.Functions.GetPlayerData().gang
local shownGangMenu = false
local DynamicMenuItems = {}

-- UTIL
local function CloseMenuFullGang()
    exports['menu']:closeMenu()
    exports['core']:HideText()
    shownGangMenu = false
end

local function comma_valueGang(amount)
    local formatted = amount
    while true do
        local k
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

--//Events
AddEventHandler('onResourceStart', function(resource)--if you restart the resource
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerGang = Core.Functions.GetPlayerData().gang
    end
end)

RegisterNetEvent('Core:Client:OnPlayerLoaded', function()
    PlayerGang = Core.Functions.GetPlayerData().gang
end)

RegisterNetEvent('Core:Client:OnGangUpdate', function(InfoGang)
    PlayerGang = InfoGang
end)

RegisterNetEvent('gangmenu:client:Stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerGang.name)
end)

RegisterNetEvent('gangmenu:client:Warbobe', function()
    TriggerEvent('clothing:client:openOutfitMenu')
end)

local function AddGangMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports("AddGangMenuItem", AddGangMenuItem)

local function RemoveGangMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports("RemoveGangMenuItem", RemoveGangMenuItem)

RegisterNetEvent('gangmenu:client:OpenMenu', function()
    shownGangMenu = true
    local gangMenu = {
        {
            header = "Gang Management  - " .. string.upper(PlayerGang.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
        {
            header = "Manage Gang Members",
            icon = "fa-solid fa-list",
            txt = "Recrutar ou disparar membros de gangues",
            params = {
                event = "gangmenu:client:ManageGang",
            }
        },
        {
            header = "Recruit Members",
            icon = "fa-solid fa-hand-holding",
            txt = "Contratar membros de gangues",
            params = {
                event = "gangmenu:client:HireMembers",
            }
        },
        {
            header = "Storage Access",
            icon = "fa-solid fa-box-open",
            txt = "Aberto de gangues",
            params = {
                event = "gangmenu:client:Stash",
            }
        },
        {
            header = "Outfits",
            txt = "Trocar de roupa",
            icon = "fa-solid fa-shirt",
            params = {
                event = "gangmenu:client:Warbobe",
            }
        },
        {
            header = "Money Management",
            icon = "fa-solid fa-sack-dollar",
            txt = "Verifique seu equilíbrio de gangue",
            params = {
                event = "gangmenu:client:SocietyMenu",
            }
        },
    }

    for _, v in pairs(DynamicMenuItems) do
        gangMenu[#gangMenu + 1] = v
    end

    gangMenu[#gangMenu + 1] = {
        header = "Exit",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "menu:closeMenu",
        }
    }

    exports['menu']:openMenu(gangMenu)
end)

RegisterNetEvent('gangmenu:client:ManageGang', function()
    local GangMembersMenu = {
        {
            header = "Gerenciar membros de gangues- " .. string.upper(PlayerGang.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
    }
    Core.Functions.TriggerCallback('gangmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            GangMembersMenu[#GangMembersMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = "fa-solid fa-circle-user",
                params = {
                    event = "gangmenu:lient:ManageMember",
                    args = {
                        player = v,
                        work = PlayerGang
                    }
                }
            }
        end
        GangMembersMenu[#GangMembersMenu + 1] = {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "gangmenu:client:OpenMenu",
            }
        }
        exports['menu']:openMenu(GangMembersMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('gangmenu:lient:ManageMember', function(data)
    local MemberMenu = {
        {
            header = "Manage " .. data.player.name .. " - " .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    for k, v in pairs(Core.Shared.Gangs[data.work.name].grades) do
        MemberMenu[#MemberMenu + 1] = {
            header = v.name,
            txt = "Grade: " .. k,
            params = {
                isServer = true,
                event = "gangmenu:server:GradeUpdate",
                icon = "fa-solid fa-file-pen",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    MemberMenu[#MemberMenu + 1] = {
        header = "Fire",
        icon = "fa-solid fa-user-large-slash",
        params = {
            isServer = true,
            event = "gangmenu:server:FireMember",
            args = data.player.empSource
        }
    }
    MemberMenu[#MemberMenu + 1] = {
        header = "Return",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "gangmenu:client:ManageGang",
        }
    }
    exports['menu']:openMenu(MemberMenu)
end)

RegisterNetEvent('gangmenu:client:HireMembers', function()
    local HireMembersMenu = {
        {
            header = "Hire Gang Members - " .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    Core.Functions.TriggerCallback('gangmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMembersMenu[#HireMembersMenu + 1] = {
                    header = v.name,
                    txt = "Citizen ID: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                    icon = "fa-solid fa-user-check",
                    params = {
                        isServer = true,
                        event = "gangmenu:server:HireMember",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMembersMenu[#HireMembersMenu + 1] = {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "gangmenu:client:OpenMenu",
            }
        }
        exports['menu']:openMenu(HireMembersMenu)
    end)
end)

RegisterNetEvent('gangmenu:client:SocietyMenu', function()
    Core.Functions.TriggerCallback('gangmenu:server:GetAccount', function(cb)
        local SocietyMenu = {
            {
                header = "Balance: $" .. comma_valueGang(cb) .. " - " .. string.upper(PlayerGang.label),
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info",
            },
            {
                header = "Deposit",
                icon = "fa-solid fa-money-bill-transfer",
                txt = "Depositar dinheiro",
                params = {
                    event = "gangmenu:client:SocietyDeposit",
                    args = comma_valueGang(cb)
                }
            },
            {
                header = "Withdraw",
                icon = "fa-solid fa-money-bill-transfer",
                txt = "Retirar dinheiro",
                params = {
                    event = "gangmenu:client:SocietyWithdraw",
                    args = comma_valueGang(cb)
                }
            },
            {
                header = "Return",
                icon = "fa-solid fa-angle-left",
                params = {
                    event = "gangmenu:client:OpenMenu",
                }
            },
        }
        exports['menu']:openMenu(SocietyMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('gangmenu:client:SocietyDeposit', function(saldoattuale)
    local deposit = exports['input']:ShowInput({
        header = "Deposit Money <br> Available Balance: $" .. saldoattuale,
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount'
            }
        }
    })
    if deposit then
        if not deposit.amount then return end
        TriggerServerEvent("gangmenu:server:depositMoney", tonumber(deposit.amount))
    end
end)

RegisterNetEvent('gangmenu:client:SocietyWithdraw', function(saldoattuale)
    local withdraw = exports['input']:ShowInput({
        header = "Withdraw Money <br> Available Balance: $" .. saldoattuale,
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$'
            }
        }
    })
    if withdraw then
        if not withdraw.amount then return end
        TriggerServerEvent("gangmenu:server:withdrawMoney", tonumber(withdraw.amount))
    end
end)

-- MAIN THREAD

CreateThread(function()
    if Config.UseTarget then
        for gang, zones in pairs(Config.GangMenuZones) do
            for index, data in ipairs(zones) do
                exports['target']:AddBoxZone(gang.."-GangMenu"..index, data.coords, data.length, data.width, {
                    name = gang.."-GangMenu"..index,
                    heading = data.heading,
                    -- debugPoly = true,
                    minZ = data.minZ,
                    maxZ = data.maxZ,
                }, {
                    options = {
                        {
                            type = "client",
                            event = "gangmenu:client:OpenMenu",
                            icon = "fas fa-sign-in-alt",
                            label = "Gang Menu",
                            canInteract = function() return gang == PlayerGang.name and PlayerGang.isboss end,
                        },
                    },
                    distance = 2.5
                })
            end
        end
    else
        while true do
            local wait = 2500
            local pos = GetEntityCoords(PlayerPedId())
            local inRangeGang = false
            local nearGangmenu = false
            if PlayerGang then
                wait = 0
                for k, menus in pairs(Config.GangMenus) do
                    for _, coords in ipairs(menus) do
                        if k == PlayerGang.name and PlayerGang.isboss then
                            if #(pos - coords) < 5.0 then
                                inRangeGang = true
                                if #(pos - coords) <= 1.5 then
                                    nearGangmenu = true
                                    if not shownGangMenu then
                                        exports['core']:DrawText('[E] Abrir Gang Management', 'left')
                                    end

                                    if IsControlJustReleased(0, 38) then
                                        exports['core']:HideText()
                                        TriggerEvent("gangmenu:client:OpenMenu")
                                    end
                                end

                                if not nearGangmenu and shownGangMenu then
                                    CloseMenuFullGang()
                                    shownGangMenu = false
                                end
                            end
                        end
                    end
                end
                if not inRangeGang then
                    Wait(1500)
                    if shownGangMenu then
                        CloseMenuFullGang()
                        shownGangMenu = false
                    end
                end
            end
            Wait(wait)
        end
    end
end)
