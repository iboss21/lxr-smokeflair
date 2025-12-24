--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                                                                  ║
    ║           The Land of Wolves RP - Smoke Flair System            ║
    ║                   www.wolves.land                                ║
    ║                                                                  ║
    ║          Customized for LXRCore Framework Support                ║
    ║                                                                  ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config = {}

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                   FRAMEWORK CONFIGURATION                        ║
    ╚══════════════════════════════════════════════════════════════════╝
    
    Primary support: LXRCore (https://github.com/lxrcore) for RedM
    Fallback support: RSGCore, VORP, RedEM:RP (All RedM frameworks)
--]]

Config.Framework = 'lxr-core' -- Options: 'lxr-core', 'rsg-core', 'vorp', 'redem', 'standalone'

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                   NOTIFICATION SYSTEM (RedM)                      ║
    ╚══════════════════════════════════════════════════════════════════╝
    
    RedM-specific notification systems
--]]

Config.NotifyType = 'bln_notify' -- Options: 'bln_notify', 'lxr-notify', 'rsg-notify', 'vorp_notify', 'redem_notify', 'redemrp_notification', 'custom', 'default'
Config.CustomNotifyResource = 'bln_notify' -- If NotifyType is 'custom', specify the resource name

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                      HUD SYSTEM (RedM)                            ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config.HudType = 'bln_hud' -- Options: 'bln_hud', 'lxr-hud', 'rsg-hud', 'vorp_hud', 'redem_hud', 'custom', 'none'
Config.CustomHudResource = 'bln_hud' -- If HudType is 'custom', specify the resource name

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                   PROGRESSBAR SYSTEM (RedM)                       ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config.ProgressbarType = 'lxr-progressbar' -- Options: 'lxr-progressbar', 'rsg-progressbar', 'vorp_progressbar', 'redem_progressbar', 'progressBars', 'custom', 'none'
Config.CustomProgressbarResource = 'lxr-progressbar'

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                   INTERACTION SYSTEM (RedM)                       ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config.InteractionType = 'rco' -- Options: 'rco' (RedM Context Options), 'rsg-target', 'vorp_menu', 'redem_menu', 'warmenu', 'custom', 'none'
Config.CustomInteractionResource = 'rco'

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                      GAMEPLAY SETTINGS                            ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config.maxSmokes = 15 -- Maximum number of simultaneous smokes allowed in the world
Config.maxSmokePerPlayer = 5 -- Maximum number of smokes a single player can create

Config.UseProgressbar = true -- Enable/disable progressbar when using smoke
Config.ProgressbarDuration = 5000 -- Duration in milliseconds (5 seconds)

Config.Animation = {
    dict = 'amb_camp@world_camp_jack_plant@idle_a',
    name = 'idle_a',
    duration = 10000, -- duration in milliseconds
    freezePlayer = true, -- Freeze player during animation
}

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                      DISCORD WEBHOOK LOGGING                      ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config.DiscordWebhook = {
    enabled = false, -- Set to true to enable Discord logging
    webhook = '', -- Your Discord webhook URL here
    botName = 'The Land of Wolves RP - Smoke Flair',
    botAvatar = 'https://i.imgur.com/your-avatar.png', -- Optional: Custom avatar URL
    color = 3447003, -- Embed color (default: blue) - Use decimal color codes
    logDeploy = true, -- Log when smoke is deployed
    logRemove = false, -- Log when smoke expires (can be spammy)
    includeSteamID = true, -- Include Steam ID in logs
    includeDiscordID = true, -- Include Discord ID in logs
    includeCoordinates = true, -- Include coordinates in logs
}

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                      SMOKE ITEMS CONFIGURATION                    ║
    ╚══════════════════════════════════════════════════════════════════╝
    
    Customizable smoke items with RGB colors
    Add as many as you want - don't forget to add them to your database!
--]]

Config.Items = {
    -- ═══════════════ BIG SMOKE FLARES ═══════════════
    big_red_smoke = {
        label = "Big Red Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 0, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_blue_smoke = {
        label = "Big Blue Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 0, g = 0, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_green_smoke = {
        label = "Big Green Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 0, g = 255, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_yellow_smoke = {
        label = "Big Yellow Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 255, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_orange_smoke = {
        label = "Big Orange Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 165, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_cyan_smoke = {
        label = "Big Cyan Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 0, g = 255, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_violet_smoke = {
        label = "Big Violet Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 238, g = 130, b = 238 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_purple_smoke = {
        label = "Big Purple Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 128, g = 0, b = 128 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_white_smoke = {
        label = "Big White Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 255, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_black_smoke = {
        label = "Big Black Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 20, g = 20, b = 20 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_pink_smoke = {
        label = "Big Pink Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 105, b = 180 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_gold_smoke = {
        label = "Big Gold Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 215, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_silver_smoke = {
        label = "Big Silver Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 192, g = 192, b = 192 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_lime_smoke = {
        label = "Big Lime Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 50, g = 205, b = 50 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    big_magenta_smoke = {
        label = "Big Magenta Smoke Flare",
        duration = 60,
        scale = 4.0,
        color = { r = 255, g = 0, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    
    -- ═══════════════ SMALL SMOKE FLARES ═══════════════
    small_red_smoke = {
        label = "Small Red Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 0, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_blue_smoke = {
        label = "Small Blue Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 0, g = 0, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_green_smoke = {
        label = "Small Green Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 0, g = 255, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_yellow_smoke = {
        label = "Small Yellow Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 255, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_orange_smoke = {
        label = "Small Orange Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 165, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_cyan_smoke = {
        label = "Small Cyan Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 0, g = 255, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_violet_smoke = {
        label = "Small Violet Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 238, g = 130, b = 238 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_purple_smoke = {
        label = "Small Purple Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 128, g = 0, b = 128 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_white_smoke = {
        label = "Small White Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 255, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_black_smoke = {
        label = "Small Black Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 20, g = 20, b = 20 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_pink_smoke = {
        label = "Small Pink Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 105, b = 180 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_gold_smoke = {
        label = "Small Gold Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 215, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_silver_smoke = {
        label = "Small Silver Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 192, g = 192, b = 192 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_lime_smoke = {
        label = "Small Lime Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 50, g = 205, b = 50 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    small_magenta_smoke = {
        label = "Small Magenta Smoke Flare",
        duration = 30,
        scale = 1.0,
        color = { r = 255, g = 0, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    
    -- ═══════════════ MEDIUM SMOKE FLARES ═══════════════
    medium_red_smoke = {
        label = "Medium Red Smoke Flare",
        duration = 45,
        scale = 2.5,
        color = { r = 255, g = 0, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    medium_blue_smoke = {
        label = "Medium Blue Smoke Flare",
        duration = 45,
        scale = 2.5,
        color = { r = 0, g = 0, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    medium_green_smoke = {
        label = "Medium Green Smoke Flare",
        duration = 45,
        scale = 2.5,
        color = { r = 0, g = 255, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    medium_yellow_smoke = {
        label = "Medium Yellow Smoke Flare",
        duration = 45,
        scale = 2.5,
        color = { r = 255, g = 255, b = 0 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
    medium_white_smoke = {
        label = "Medium White Smoke Flare",
        duration = 45,
        scale = 2.5,
        color = { r = 255, g = 255, b = 255 },
        model = `s_dynamitehusk01x`,
        rotation = { x = -90.0, y = 0.0, z = 0.0 },
        offset = { x = 0.1, y = 0.5, z = 0.0 },
    },
}

--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                      TRANSLATIONS                                 ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Config.Translations = {
    smokeUsed = "You have deployed a smoke flare.",
    smokeDeploying = "Deploying smoke flare...",
    maxSmokesReached = "Maximum number of smoke flares in the world reached.",
    maxPlayerSmokesReached = "You have reached your personal smoke flare limit.",
    noSmokeItem = "You do not have this item.",
    cancelled = "Action cancelled.",
}
