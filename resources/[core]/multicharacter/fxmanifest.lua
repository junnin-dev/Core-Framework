fx_version 'cerulean'
game 'gta5'

description 'Multicharacter'
version '1.0.0'

shared_scripts {
    '@core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    '@apartments/config.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    "html/vue.js",
    "html/swal2.js",
    'html/profanity.js'
}

dependencies {
    'core',
    'spawn'
}

lua54 'yes'
