--       ___          ___          ___
--      /\  \        /\  \        /\  \
--     /::\  \      /::\  \      /::\  \
--    /:/\:\  \    /:/\:\  \    /:/\ \  \
--   /::\~\:\__\  /:/  \:\  \  _\:\~\ \  \
--  /:/\:\ \:|__|/:/__/_\:\__\/\ \:\ \ \__\
--  \:\~\:\/:/  /\:\  /\ \/__/\:\ \:\ \/__/
--   \:\ \::/  /  \:\ \:\__\   \:\ \:\__\
--    \:\/:/  /    \:\/:/  /    \:\/:/  /
--     \::/__/      \::/  /      \::/  /
--      ‾‾           \/__/        \/__/

-- BGS_MetalDetector
-- Author: Snapopotamus
-- © 2024
-- A metal detector system for RedM servers.

---------------------------------------------------------------------------------------------

author "Snapopotamus"
fx_version "cerulean"
lua54 "yes"

games { "rdr3" }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
  'client/client.lua'
}

ui_page 'nui/index.html'

shared_scripts {
  'config.lua',
}

files {
	'nui/index.html',
	'nui/style.css',
	'nui/script.js',
	'nui/images/*',
	'nui/fonts/*'
}