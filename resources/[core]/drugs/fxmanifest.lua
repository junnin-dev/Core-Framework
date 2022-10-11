fx_version 'cerulean'
game 'gta5'

description 'Drugs'
version '1.0.0'

shared_scripts{
    'config.lua',
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts{
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/deliveries.lua',
    'client/cornerselling.lua'
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/deliveries.lua',
    'server/cornerselling.lua'
}

lua54 'yes'
