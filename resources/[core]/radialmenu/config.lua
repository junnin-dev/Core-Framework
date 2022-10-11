Config = {}
Config.Keybind = 'F1'
Config.Toggle = false
Config.UseWhilstWalking = false
Config.EnableExtraMenu = true
Config.Fliptime = 15000

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Citizen',
        icon = 'user',
        items = {
            {
                id = 'givenum',
                title = 'Dê detalhes de contato',
                icon = 'address-book',
                type = 'client',
                event = 'phoneclient:GiveContactDetails',
                shouldClose = true
            }, {
                id = 'getintrunk',
                title = 'Entrar no Porta-Malas',
                icon = 'car',
                type = 'client',
                event = 'trunk:client:GetIn',
                shouldClose = true
            }, {
                id = 'cornerselling',
                title = 'Vendendo canto',
                icon = 'cannabis',
                type = 'client',
                event = 'drugs:client:cornerselling',
                shouldClose = true
            }, {
                id = 'togglehotdogsell',
                title = 'Vendas de cachorro -quente',
                icon = 'hotdog',
                type = 'client',
                event = 'hotdogjob:client:ToggleSell',
                shouldClose = true
            }, {
                id = 'interactions',
                title = 'Interação',
                icon = 'triangle-exclamation',
                items = {
                    {
                        id = 'handcuff',
                        title = 'Manguito',
                        icon = 'user-lock',
                        type = 'client',
                        event = 'police:client:CuffPlayerSoft',
                        shouldClose = true
                    }, {
                        id = 'playerinvehicle',
                        title = 'Coloque em veículo',
                        icon = 'car-side',
                        type = 'client',
                        event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true
                    }, {
                        id = 'playeroutvehicle',
                        title = 'Retirar o veículo',
                        icon = 'car-side',
                        type = 'client',
                        event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true
                    }, {
                        id = 'stealplayer',
                        title = 'Roubar',
                        icon = 'mask',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort',
                        title = 'Sequestrar',
                        icon = 'user-group',
                        type = 'client',
                        event = 'police:client:KidnapPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort2',
                        title = 'Escolta',
                        icon = 'user-group',
                        type = 'client',
                        event = 'police:client:EscortPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort554',
                        title = 'Refém',
                        icon = 'child',
                        type = 'client',
                        event = 'A5:Client:TakeHostage',
                        shouldClose = true
                    }
                }
            }
        }
    },
    [2] = {
        id = 'general',
        title = 'Em geral',
        icon = 'rectangle-list',
        items = {
            {
                id = 'house',
                title = 'Interação da casa',
                icon = 'house',
                items = {
                    {
                        id = 'givehousekey',
                        title = 'Dê as chaves da casa',
                        icon = 'key',
                        type = 'client',
                        event = 'houses:client:giveHouseKey',
                        shouldClose = true
                    }, {
                        id = 'removehousekey',
                        title = 'Remova as chaves da casa',
                        icon = 'key',
                        type = 'client',
                        event = 'houses:client:removeHouseKey',
                        shouldClose = true
                    }, {
                        id = 'togglelock',
                        title = 'Alterne a porta',
                        icon = 'door-closed',
                        type = 'client',
                        event = 'houses:client:toggleDoorlock',
                        shouldClose = true
                    }, {
                        id = 'decoratehouse',
                        title = 'Decorar casa',
                        icon = 'box',
                        type = 'client',
                        event = 'houses:client:decorate',
                        shouldClose = true
                    }, {
                        id = 'houseLocations',
                        title = 'Locais de interação',
                        icon = 'house',
                        items = {
                            {
                                id = 'setstash',
                                title = 'Defina o estoque',
                                icon = 'box-open',
                                type = 'client',
                                event = 'houses:client:setLocation',
                                shouldClose = true
                            }, {
                                id = 'setoutift',
                                title = 'Set Wardrobe',
                                icon = 'shirt',
                                type = 'client',
                                event = 'houses:client:setLocation',
                                shouldClose = true
                            }, {
                                id = 'setlogout',
                                title = 'Defina logout',
                                icon = 'door-open',
                                type = 'client',
                                event = 'houses:client:setLocation',
                                shouldClose = true
                            }
                        }
                    }
                }
            }, {
                id = 'clothesmenu',
                title = 'Clothing',
                icon = 'shirt',
                items = {
                    {
                        id = 'Hair',
                        title = 'Cabelo',
                        icon = 'user',
                        type = 'client',
                        event = 'radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Ear',
                        title = 'Peça de ouvido',
                        icon = 'ear-deaf',
                        type = 'client',
                        event = 'radialmenu:ToggleProps',
                        shouldClose = true
                    }, {
                        id = 'Neck',
                        title = 'Pescoço',
                        icon = 'user-tie',
                        type = 'client',
                        event = 'radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Top',
                        title = 'Topo',
                        icon = 'shirt',
                        type = 'client',
                        event = 'radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shirt',
                        title = 'Camisa',
                        icon = 'shirt',
                        type = 'client',
                        event = 'radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Pants',
                        title = 'Calça',
                        icon = 'user',
                        type = 'client',
                        event = 'radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shoes',
                        title = 'Sapato',
                        icon = 'shoe-prints',
                        type = 'client',
                        event = 'radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'meer',
                        title = 'Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'Hat',
                                title = 'Chapéu',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Glasses',
                                title = 'Óculos',
                                icon = 'glasses',
                                type = 'client',
                                event = 'radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Visor',
                                title = 'Visor',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Mask',
                                title = 'mascarar',
                                icon = 'masks-theater',
                                type = 'client',
                                event = 'radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Vest',
                                title = 'Colete',
                                icon = 'vest',
                                type = 'client',
                                event = 'radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bag',
                                title = 'Mochila',
                                icon = 'bag-shopping',
                                type = 'client',
                                event = 'radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bracelet',
                                title = 'Pulseira',
                                icon = 'user',
                                type = 'client',
                                event = 'radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Watch',
                                title = 'Ver',
                                icon = 'stopwatch',
                                type = 'client',
                                event = 'radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Gloves',
                                title = 'Luvas',
                                icon = 'mitten',
                                type = 'client',
                                event = 'radialmenu:ToggleClothing',
                                shouldClose = true
                            }
                        }
                    }
                }
            }
        }
    },
}

Config.VehicleDoors = {
    id = 'vehicledoors',
    title = 'Portas de veículo',
    icon = 'car-side',
    items = {
        {
            id = 'door0',
            title = 'Porta do motorista',
            icon = 'car-side',
            type = 'client',
            event = 'radialmenu:client:openDoor',
            shouldClose = false
        }, {
            id = 'door4',
            title = 'Capuz',
            icon = 'car',
            type = 'client',
            event = 'radialmenu:client:openDoor',
            shouldClose = false
        }, {
            id = 'door1',
            title = 'Passageiros da porta',
            icon = 'car-side',
            type = 'client',
            event = 'radialmenu:client:openDoor',
            shouldClose = false
        }, {
            id = 'door3',
            title = 'Traseira direita',
            icon = 'car-side',
            type = 'client',
            event = 'radialmenu:client:openDoor',
            shouldClose = false
        }, {
            id = 'door5',
            title = 'Porta-malas',
            icon = 'car',
            type = 'client',
            event = 'radialmenu:client:openDoor',
            shouldClose = false
        }, {
            id = 'door2',
            title = 'Traseira esquerda',
            icon = 'car-side',
            type = 'client',
            event = 'radialmenu:client:openDoor',
            shouldClose = false
        }
    }
}

Config.VehicleExtras = {
    id = 'vehicleextras',
    title = 'Extras do Veiculo',
    icon = 'plus',
    items = {
        {
            id = 'extra1',
            title = 'Extra 1',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra2',
            title = 'Extra 2',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra3',
            title = 'Extra 3',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra4',
            title = 'Extra 4',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra5',
            title = 'Extra 5',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra6',
            title = 'Extra 6',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra7',
            title = 'Extra 7',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra8',
            title = 'Extra 8',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra9',
            title = 'Extra 9',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra10',
            title = 'Extra 10',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra11',
            title = 'Extra 11',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra12',
            title = 'Extra 12',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }, {
            id = 'extra13',
            title = 'Extra 13',
            icon = 'box-open',
            type = 'client',
            event = 'radialmenu:client:setExtra',
            shouldClose = false
        }
    }
}

Config.VehicleSeats = {
    id = 'vehicleseats',
    title = 'Assentos do veículo',
    icon = 'chair',
    items = {}
}

Config.JobInteractions = {
    ["ambulance"] = {
        {
            id = 'statuscheck',
            title = 'Verifique o estado de saúde',
            icon = 'heart-pulse',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true
        },{
            id = 'revivep',
            title = 'Reviver',
            icon = 'user-doctor',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },{
            id = 'treatwounds',
            title = 'Curar feridas',
            icon = 'bandage',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true
        }, {
            id = 'emergencybutton2',
            title = 'Botão de emergência',
            icon = 'bell',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true
        }, {
            id = 'escort',
            title = 'Escolta',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'stretcheroptions',
            title = 'Stretcher',
            icon = 'bed-pulse',
            items = {
                {
                    id = 'spawnstretcher',
                    title = 'Maca de desova',
                    icon = 'plus',
                    type = 'client',
                    event = 'radialmenu:client:TakeStretcher',
                    shouldClose = false
                }, {
                    id = 'despawnstretcher',
                    title = 'Remova a maca',
                    icon = 'minus',
                    type = 'client',
                    event = 'radialmenu:client:RemoveStretcher',
                    shouldClose = false
                }
            }
        }
    },
    ["taxi"] = {
        {
            id = 'togglemeter',
            title = 'Mostrar/ocultar medidor',
            icon = 'eye-slash',
            type = 'client',
            event = 'taxi:client:toggleMeter',
            shouldClose = false
        }, {
            id = 'togglemouse',
            title = 'start/stop Meter',
            icon = 'hourglass-start',
            type = 'client',
            event = 'taxi:client:enableMeter',
            shouldClose = true
        }, {
            id = 'npc_mission',
            title = 'Missão NPC',
            icon = 'taxi',
            type = 'client',
            event = 'taxi:client:DoTaxiNpc',
            shouldClose = true
        }
    },
    ["tow"] = {
        {
            id = 'togglenpc',
            title = 'Alternar npc',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }, {
            id = 'towvehicle',
            title = 'Veículo de reboque',
            icon = 'truck-pickup',
            type = 'client',
            event = 'tow:client:TowVehicle',
            shouldClose = true
        }
    },
    ["mechanic"] = {
        {
            id = 'towvehicle',
            title = 'Veículo de reboque',
            icon = 'truck-pickup',
            type = 'client',
            event = 'tow:client:TowVehicle',
            shouldClose = true
        }
    },
    ["police"] = {
        {
            id = 'emergencybutton',
            title = 'Botão de emergência',
            icon = 'bell',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true
        }, {
            id = 'checkvehstatus',
            title = 'Verifique o status da sintonia',
            icon = 'circle-info',
            type = 'client',
            event = 'tunerchip:client:TuneStatus',
            shouldClose = true
        }, {
            id = 'resethouse',
            title = 'Reset Lock House',
            icon = 'key',
            type = 'client',
            event = 'houses:client:ResetHouse',
            shouldClose = true
        }, {
            id = 'takedriverlicense',
            title = 'Revogar a carteira de motorista',
            icon = 'id-card',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true
        }, {
            id = 'policeinteraction',
            title = 'Police Actions',
            icon = 'list-check',
            items = {
                {
                    id = 'statuscheck',
                    title = 'Verifique o estado de saúde',
                    icon = 'heart-pulse',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'checkstatus',
                    title = 'Verifique o status',
                    icon = 'question',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Escolta',
                    icon = 'user-group',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                }, {
                    id = 'searchplayer',
                    title = 'Procurar',
                    icon = 'magnifying-glass',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true
                }, {
                    id = 'jailplayer',
                    title = 'Cadeia',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                }
            }
        }, {
            id = 'policeobjects',
            title = 'Objects',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'cone',
                    icon = 'triangle-exclamation',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Portão',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Sinal de limite de velocidade',
                    icon = 'sign-hanging',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Tent',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Iluminação',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike Strips',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Remover object',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["hotdog"] = {
        {
            id = 'togglesell',
            title = 'Alternar a venda',
            icon = 'hotdog',
            type = 'client',
            event = 'hotdogjob:client:ToggleSell',
            shouldClose = true
        }
    }
}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Pegue sua camisa off/on",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("gloves") end,
        Sprite = "gloves",
        Desc = "Pegue suas luvas off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("visor") end,
        Sprite = "visor",
        Desc = "Alterar variação do chapéu",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Abre ou fecha sua bolsa",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Pegue seus sapatos off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Pegue seu colete off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("hair") end,
        Sprite = "hair",
        Desc = "Coloque seu cabelo up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Pegue seu chapéu off/on",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Pegue seus óculos off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Pegue seu acessório de ouvido off/on",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Pegue seu acessório de pescoço off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Pegue seu relógio off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Pegue sua pulseira off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Pegue sua máscara off/on",
        Button = 6,
        Name = "Mask"
    }
}

local bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Pegue suas calças off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Pegue sua camisa off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["reset"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Nada para reiniciar', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Reverte tudo de volta ao normal",
        Name = "reset",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Pegue sua bolsa off/on",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}
