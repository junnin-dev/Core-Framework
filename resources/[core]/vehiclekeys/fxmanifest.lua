fx_version 'cerulean'
game 'gta5'

description 'VehicleKeys'
version '1.0.0'

shared_scripts {
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}
client_script 'client/main.lua'
server_script 'server/main.lua'

lua54 'yes'
