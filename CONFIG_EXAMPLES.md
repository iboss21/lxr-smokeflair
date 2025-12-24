# Configuration Examples for RedM

This file contains example configurations for different RedM server setups.

**IMPORTANT**: This resource is designed for RedM ONLY. All configurations use RedM-specific resources.

## Table of Contents
- [LXRCore Setup (Recommended)](#lxrcore-setup-recommended)
- [RSGCore Setup](#rsgcore-setup)
- [VORP Setup](#vorp-setup)
- [RedEM Setup](#redem-setup)
- [Standalone Setup](#standalone-setup)
- [Discord Webhook Configuration](#discord-webhook-configuration)
- [Custom Notification Systems](#custom-notification-systems)
- [Performance Optimized Setup](#performance-optimized-setup)
- [Roleplay Focused Setup](#roleplay-focused-setup)

---

## LXRCore Setup (Recommended)

**Perfect for The Land of Wolves RP servers running LXRCore on RedM**

```lua
-- Framework
Config.Framework = 'lxr-core'

-- Notification System (bln_notify recommended)
Config.NotifyType = 'bln_notify'
Config.CustomNotifyResource = 'bln_notify'

-- HUD System
Config.HudType = 'bln_hud'
Config.CustomHudResource = 'bln_hud'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'lxr-progressbar'
Config.CustomProgressbarResource = 'lxr-progressbar'

-- Interaction System (RCO = RedM Context Options)
Config.InteractionType = 'rco'
Config.CustomInteractionResource = 'rco'

-- Discord Webhook
Config.DiscordWebhook = {
    enabled = true,
    webhook = 'YOUR_WEBHOOK_URL_HERE',
    botName = 'The Land of Wolves RP - Smoke Flair',
    logDeploy = true,
    includeSteamID = true,
    includeDiscordID = true,
    includeCoordinates = true,
}

-- Gameplay Settings
Config.maxSmokes = 15
Config.maxSmokePerPlayer = 5
```

---

## RSGCore Setup

**For RedM servers using RSGCore framework**

```lua
-- Framework
Config.Framework = 'rsg-core'

-- Notification System
Config.NotifyType = 'rsg-notify'

-- HUD System
Config.HudType = 'rsg-hud'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'rsg-progressbar'

-- Interaction System
Config.InteractionType = 'rsg-target'

-- Discord Webhook (optional)
Config.DiscordWebhook.enabled = false

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## VORP Setup

**For RedM servers using VORP framework**

```lua
-- Framework
Config.Framework = 'vorp'

-- Notification System
Config.NotifyType = 'vorp_notify'

-- HUD System
Config.HudType = 'vorp_hud'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'vorp_progressbar'

-- Interaction System
Config.InteractionType = 'vorp_menu'

-- Discord Webhook (optional)
Config.DiscordWebhook.enabled = false

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## RedEM Setup

**For RedM servers using RedEM:RP framework**

```lua
-- Framework
Config.Framework = 'redem'

-- Notification System
Config.NotifyType = 'redem_notify'  -- or 'redemrp_notification'

-- HUD System
Config.HudType = 'redem_hud'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'redem_progressbar'

-- Interaction System
Config.InteractionType = 'redem_menu'  -- or 'warmenu'

-- Discord Webhook (optional)
Config.DiscordWebhook.enabled = false

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## Standalone Setup

**No framework required - Pure RedM**

```lua
-- Framework
Config.Framework = 'standalone'

-- Notification System
Config.NotifyType = 'default'  -- Uses native RedM chat

-- HUD System
Config.HudType = 'none'

-- Progressbar System
Config.UseProgressbar = false  -- No progressbar

-- Interaction System
Config.InteractionType = 'none'

-- Discord Webhook (optional but recommended for standalone)
Config.DiscordWebhook = {
    enabled = true,
    webhook = 'YOUR_WEBHOOK_URL_HERE',
    logDeploy = true,
}

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## Discord Webhook Configuration

### Full Configuration Example
```lua
Config.DiscordWebhook = {
    enabled = true,                             -- Enable Discord logging
    webhook = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN',
    botName = 'The Land of Wolves RP - Smoke Flair',
    botAvatar = 'https://i.imgur.com/your-logo.png',  -- Optional custom avatar
    color = 3447003,                            -- Blue (use decimal color codes)
    logDeploy = true,                           -- Log when smoke is deployed
    logRemove = false,                          -- Don't log when smoke expires (reduces spam)
    includeSteamID = true,                      -- Include player Steam ID
    includeDiscordID = true,                    -- Include Discord mention
    includeCoordinates = true,                  -- Include deployment coordinates
}
```

### Discord Color Codes (Decimal)
```lua
-- Red
color = 15158332,  -- #E74C3C

-- Green
color = 3066993,   -- #2ECC71

-- Blue
color = 3447003,   -- #3498DB

-- Yellow
color = 16776960,  -- #FFFF00

-- Orange
color = 15105570,  -- #E67E22

-- Purple
color = 10181046,  -- #9B59B6

-- The Land of Wolves (Custom)
color = 8421504,   -- #808080 (Grey/Wolf color)
```

### How to Create Discord Webhook
1. Open your Discord server
2. Go to Server Settings → Integrations
3. Click "Webhooks" → "New Webhook"
4. Choose the channel for logs
5. Name it "Smoke Flair Logs"
6. Copy the webhook URL
7. Paste it in config.lua

### Example Discord Message
When enabled, you'll see logs like this in Discord:
```
🎆 Smoke Flare Deployed
JohnDoe has deployed a smoke flare

Item: Big Red Smoke Flare
Duration: 60 seconds
Steam ID: steam:110000XXXXXXXX
Discord: @JohnDoe
Coordinates: X: 1234.56, Y: -567.89, Z: 123.45

The Land of Wolves RP - Smoke Flair System
Today at 12:34 PM
```

---

## Custom Notification Systems (RedM)

### Using bln_notify (Recommended)
```lua
Config.NotifyType = 'bln_notify'
Config.CustomNotifyResource = 'bln_notify'
```
**GitHub**: https://github.com/blnStudio/bln_notify

Features: Modern UI, multiple types, RedM-specific

### Using RSG Notify
```lua
Config.NotifyType = 'rsg-notify'
```
For RSGCore framework

### Using VORP Notify
```lua
Config.NotifyType = 'vorp_notify'
```
For VORP framework

### Using RedEM Notify
```lua
Config.NotifyType = 'redem_notify'
-- OR
Config.NotifyType = 'redemrp_notification'
```
For RedEM:RP framework

### Using Custom RedM Resource
```lua
Config.NotifyType = 'custom'
Config.CustomNotifyResource = 'your_custom_redm_notify'
```

### Using Default (Native RedM Chat)
```lua
Config.NotifyType = 'default'
```
Simple chat-based notifications as fallback

---

## Performance Optimized Setup

**For servers with many players or lower specs**

```lua
-- Gameplay Settings
Config.maxSmokes = 8                    -- Reduced world limit
Config.maxSmokePerPlayer = 2            -- Reduced per-player limit

-- Progressbar (faster deployment)
Config.UseProgressbar = true
Config.ProgressbarDuration = 3000       -- 3 seconds instead of 5

-- Animation (shorter duration)
Config.Animation = {
    dict = 'amb_camp@world_camp_jack_plant@idle_a',
    name = 'idle_a',
    duration = 5000,                    -- 5 seconds instead of 10
    freezePlayer = true,
}
```

**Also reduce smoke duration in Config.Items:**
```lua
big_red_smoke = {
    label = "Big Red Smoke Flare",
    duration = 40,                      -- 40 seconds instead of 60
    scale = 3.0,                        -- Smaller scale
    color = { r = 255, g = 0, b = 0 },
    -- ... rest of config
},
```

---

## Roleplay Focused Setup

**For immersive roleplay servers**

```lua
-- Gameplay Settings
Config.maxSmokes = 20                   -- Allow more for events
Config.maxSmokePerPlayer = 8            -- Players can carry more

-- Progressbar (realistic deployment time)
Config.UseProgressbar = true
Config.ProgressbarDuration = 8000       -- 8 seconds for realism

-- Animation (longer, more immersive)
Config.Animation = {
    dict = 'amb_camp@world_camp_jack_plant@idle_a',
    name = 'idle_a',
    duration = 12000,                   -- 12 seconds
    freezePlayer = true,                -- Prevent abuse
}
```

**Custom translations for immersion:**
```lua
Config.Translations = {
    smokeUsed = "You carefully light the smoke flare and place it on the ground.",
    smokeDeploying = "Setting up the signal flare...",
    maxSmokesReached = "There are too many smoke signals in the area already.",
    maxPlayerSmokesReached = "You can't carry any more flares right now.",
    noSmokeItem = "You don't have a smoke flare.",
    cancelled = "You stopped setting up the flare.",
}
```

---

## Event Server Setup

**For servers hosting events with smoke signals**

```lua
-- Gameplay Settings
Config.maxSmokes = 50                   -- Many smokes for large events
Config.maxSmokePerPlayer = 15           -- Each player can deploy many

-- Quick deployment for events
Config.UseProgressbar = false           -- Instant deployment
Config.Animation.duration = 3000        -- Quick animation
Config.Animation.freezePlayer = false   -- Allow movement

-- Longer lasting smokes for events
-- In Config.Items, increase duration:
big_red_smoke = {
    duration = 120,                     -- 2 minutes for better visibility
    scale = 5.0,                        -- Larger for events
    -- ... rest of config
},
```

---

## Mixed System Setup

**If you have multiple systems for different purposes**

```lua
-- Framework
Config.Framework = 'lxr-core'

-- Use bln_notify for most notifications
Config.NotifyType = 'bln_notify'

-- But use ox_lib progressbar if you don't have lxr-progressbar
Config.ProgressbarType = 'ox_lib'

-- Use co_interactions if available
Config.InteractionType = 'co_interactions'
```

---

## Custom Color Examples

### Faction-Specific Colors

```lua
-- Law Enforcement (Blue)
law_smoke = {
    label = "Law Enforcement Signal",
    duration = 60,
    scale = 4.0,
    color = { r = 0, g = 0, b = 200 },
    model = `s_dynamitehusk01x`,
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},

-- Medical (Red/White)
medical_smoke = {
    label = "Medical Emergency Signal",
    duration = 60,
    scale = 4.0,
    color = { r = 255, g = 50, b = 50 },
    model = `s_dynamitehusk01x`,
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},

-- Military (Dark Green)
military_smoke = {
    label = "Military Signal",
    duration = 60,
    scale = 4.0,
    color = { r = 0, g = 100, b = 0 },
    model = `s_dynamitehusk01x`,
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},
```

### Rare/Special Colors

```lua
-- Rainbow (cycles through colors - pick one)
rainbow_smoke = {
    label = "Rare Rainbow Smoke",
    duration = 90,
    scale = 5.0,
    color = { r = 255, g = 0, b = 255 }, -- Bright magenta
    model = `s_dynamitehusk01x`,
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},

-- Toxic Green
toxic_smoke = {
    label = "Toxic Smoke",
    duration = 60,
    scale = 4.0,
    color = { r = 0, g = 255, b = 50 },
    model = `s_dynamitehusk01x`,
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},
```

---

## Testing Configuration

After changing your configuration:

1. **Restart the resource:**
   ```
   restart lxr-smokeflair
   ```

2. **Test notifications:**
   - Give yourself a smoke item
   - Use it and verify the notification appears

3. **Test progressbar:**
   - Make sure the progressbar shows if enabled
   - Verify the duration matches your config

4. **Test smoke effects:**
   - Check that smoke appears with correct color
   - Verify duration matches config
   - Test that other players can see it

5. **Test limits:**
   - Deploy multiple smokes to test world limit
   - Test per-player limit with multiple items

---

## Need Help?

- Check the main README.md for troubleshooting
- Visit www.wolves.land for support
- Join our Discord community
- Report issues on GitHub

---

**The Land of Wolves RP | www.wolves.land**
