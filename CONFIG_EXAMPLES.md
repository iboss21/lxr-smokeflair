# Configuration Examples

This file contains example configurations for different server setups.

## Table of Contents
- [LXRCore Setup (Recommended)](#lxrcore-setup-recommended)
- [RSGCore Setup](#rsgcore-setup)
- [QBCore Setup](#qbcore-setup)
- [ESX Setup](#esx-setup)
- [VORP Setup](#vorp-setup)
- [Standalone Setup](#standalone-setup)
- [Custom Notification Systems](#custom-notification-systems)
- [Performance Optimized Setup](#performance-optimized-setup)
- [Roleplay Focused Setup](#roleplay-focused-setup)

---

## LXRCore Setup (Recommended)

**Perfect for The Land of Wolves RP servers running LXRCore**

```lua
-- Framework
Config.Framework = 'lxr-core'

-- Notification System
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

-- Interaction System
Config.InteractionType = 'co_interactions'
Config.CustomInteractionResource = 'co_interactions'

-- Gameplay Settings
Config.maxSmokes = 15
Config.maxSmokePerPlayer = 5
```

---

## RSGCore Setup

**For servers using RSGCore framework**

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
Config.InteractionType = 'ox_target'

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## QBCore Setup

**For servers using QBCore framework**

```lua
-- Framework
Config.Framework = 'qb-core'

-- Notification System
Config.NotifyType = 'qb-notify'

-- HUD System
Config.HudType = 'qb-hud'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'qb-progressbar'

-- Interaction System
Config.InteractionType = 'qb-target'

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## ESX Setup

**For servers using ESX framework**

```lua
-- Framework
Config.Framework = 'esx'

-- Notification System
Config.NotifyType = 'ox_lib'

-- HUD System
Config.HudType = 'esx_hud'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'ox_lib'

-- Interaction System
Config.InteractionType = 'ox_target'

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## VORP Setup

**For servers using VORP framework**

```lua
-- Framework
Config.Framework = 'vorp'

-- Notification System
Config.NotifyType = 'mythic_notify'

-- HUD System
Config.HudType = 'none'

-- Progressbar System
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000
Config.ProgressbarType = 'mythic_progbar'

-- Interaction System
Config.InteractionType = 'none'

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## Standalone Setup

**No framework required**

```lua
-- Framework
Config.Framework = 'standalone'

-- Notification System
Config.NotifyType = 'default'

-- HUD System
Config.HudType = 'none'

-- Progressbar System
Config.UseProgressbar = false

-- Interaction System
Config.InteractionType = 'none'

-- Gameplay Settings
Config.maxSmokes = 10
Config.maxSmokePerPlayer = 3
```

---

## Custom Notification Systems

### Using bln_notify
```lua
Config.NotifyType = 'bln_notify'
Config.CustomNotifyResource = 'bln_notify'
```

### Using ox_lib
```lua
Config.NotifyType = 'ox_lib'
```

### Using Custom Resource
```lua
Config.NotifyType = 'custom'
Config.CustomNotifyResource = 'your_custom_notify'
```

### Using Multiple Systems (Fallback)
If you want to try bln_notify first, then fallback to ox_lib:
1. Set `Config.NotifyType = 'bln_notify'`
2. Make sure bln_notify is installed
3. If it fails, the system will use default chat notifications

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
