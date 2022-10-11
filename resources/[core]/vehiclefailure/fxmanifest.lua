fx_version 'cerulean'
game 'gta5'

description 'VehicleFailure'
version '1.0.0'

shared_scripts {
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

lua54 'yes'