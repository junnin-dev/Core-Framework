fx_version 'cerulean'
game 'gta5'

description 'Traphouse'
version '2.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}
client_script {
    'client/*.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
}

server_script 'server/*.lua'

files {
    'html/*'
}

lua54 'yes'