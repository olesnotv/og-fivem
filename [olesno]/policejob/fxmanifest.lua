game 'gta5'
fx_version 'cerulean'

author 'olesno'
description 'LSPD Job for Fivem made by Olesno'
version '09.25'

client_scripts {
    'client/*.lua',
}

-- server_scripts {
--     'server/*.lua',
-- }

shared_script 'config.lua'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}