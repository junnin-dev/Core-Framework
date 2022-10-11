fx_version 'cerulean'
game 'gta5'

description 'Vineyard'
version '1.1.0'

shared_scripts {
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

server_script 'server.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client.lua'
}

dependencies {
    'core',
    'PolyZone'
}

lua54 'yes'