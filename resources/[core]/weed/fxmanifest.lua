fx_version 'cerulean'
game 'gta5'

description 'Weed'
version '1.0.0'

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

client_script 'client/main.lua'

lua54 'yes'