local Core = exports['core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['testwebhook'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['playermoney'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['playerinventory'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['robbing'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['cuffing'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['drop'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['trunk'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['stash'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['glovebox'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['banking'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['vehicleshop'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['vehicleupgrades'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['shops'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['dealers'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['storerobbery'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['bankrobbery'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['powerplants'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['death'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['joinleave'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['ooc'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['report'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['me'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['pmelding'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['112'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['bans'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['anticheat'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['weather'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['moneysafes'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['bennys'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['bossmenu'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['robbery'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['casino'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['traphouse'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['911'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['palert'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
    ['house'] = 'https://discordapp.com/api/webhooks/1029087685786206258/RYEGPQYWhdhCk7GB5a_Dt-lhNZHlBaD9yIOfbNGSk8jmc-ZIOFtTP8vmbcHDCfvIPsuD',
}

local Colors = {
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Core Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'JN Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'JN Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

Core.Commands.Add('testwebhook', 'Teste seu webhook do Discord para logs (somente Deus)', {}, false, function()
    TriggerEvent('log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Configuração do webhook com sucesso')
end, 'god')
