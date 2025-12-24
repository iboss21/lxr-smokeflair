--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                                                                  ║
    ║           The Land of Wolves RP - Smoke Flair System            ║
    ║                   www.wolves.land                                ║
    ║                                                                  ║
    ║          Customized for LXRCore Framework Support                ║
    ║          https://github.com/lxrcore                              ║
    ║                                                                  ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

fx_version 'cerulean'
game 'rdr3'
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
lua54 'yes'

name "LXR Smoke Flair"
version "2.0.0"
description "Enhanced color smoke flare system for The Land of Wolves RP - Fully customizable with LXRCore Framework support"
author "The Land of Wolves RP | www.wolves.land"
repository "https://github.com/lxrcore"

client_scripts {
    'utils.lua',
    'client.lua',
}

server_scripts {
    'utils.lua',
    'server.lua',
}

shared_scripts {
    'config.lua',
}

files {
    'README.md',
}

-- Optional dependencies for enhanced functionality
-- Uncomment based on your server setup
-- dependencies {
--     'lxr-core',        -- Primary framework support
--     'bln_notify',      -- Notification system
--     'bln_hud',         -- HUD system
--     'co_interactions', -- Interaction system
-- }
