fx_version 'cerulean'
game 'gta5'

description 'Doorlock system for the JUNNIN Framework'
version '2.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    'configs/*.lua',
    '@core/shared/locale.lua',
    'locales/en.lua'
}

server_script 'server/main.lua'
client_script 'client/main.lua'

files {
	'html/*.html',
	'html/*.js',
	'html/*.css',
	'html/sounds/*.ogg',
}

lua54 'yes'