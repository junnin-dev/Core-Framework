fx_version 'cerulean'
game 'gta5'

description 'HUD'
version '2.1.0'

shared_scripts {
	'@core/shared/locale.lua',
	'locales/pt.lua',
	'config.lua',
	'uiconfig.lua'
}

client_script 'client.lua'
server_script 'server.lua'
lua54 'yes'
use_fxv2_oal 'yes'

ui_page 'html/index.html'

files {
	'html/*',
}
