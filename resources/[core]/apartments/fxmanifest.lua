fx_version 'cerulean'
game 'gta5'

description 'Apartments'
version '2.1.0'

shared_scripts {
    'config.lua',
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua',
    'client/gui.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
}

dependencies {
    'core',
    'interior',
    'clothing',
    'weathersync'
}

lua54 'yes'
