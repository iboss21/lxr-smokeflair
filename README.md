# 🐺 The Land of Wolves RP - Smoke Flair System

<div align="center">

![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)
![Framework](https://img.shields.io/badge/framework-LXRCore-green.svg)
![Game](https://img.shields.io/badge/game-RedM-red.svg)
[![Website](https://img.shields.io/badge/website-wolves.land-orange.svg)](https://www.wolves.land)

**An advanced, fully customizable colored smoke flare system for RedM**

Designed specifically for The Land of Wolves RP with primary support for [LXRCore Framework](https://github.com/lxrcore)

</div>

---

## 📋 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Configuration](#️-configuration)
- [Framework Support](#-framework-support)
- [Notification Systems](#-notification-systems)
- [HUD & Progressbar Systems](#-hud--progressbar-systems)
- [Interaction Systems](#-interaction-systems)
- [Item Database](#-item-database)
- [Customization](#-customization)
- [Troubleshooting](#-troubleshooting)
- [Support](#-support)

---

## ✨ Features

### Core Features
- 🎨 **35+ Colored Smoke Flares** - Extensive color palette including red, blue, green, yellow, orange, cyan, violet, purple, white, black, pink, gold, silver, lime, and magenta
- 📏 **Multiple Sizes** - Small (30s), Medium (45s), and Big (60s) smoke flares
- 🎮 **Full RGB Customization** - Create any color you want with RGB values
- 🔄 **Synchronized Multiplayer** - Smoke flares visible to all players
- 🎭 **Custom Animations** - Configurable deployment animations with player freeze option
- ⚙️ **100% Configurable** - Every aspect can be customized via `config.lua`

### Framework Integration
- 🚀 **Primary Support: LXRCore** - Built and optimized for [LXRCore Framework](https://github.com/lxrcore)
- 🔌 **Multi-Framework Compatible** - RSGCore, QBCore, QBX, ESX, VORP, RedEM:RP, or Standalone
- 🔄 **Easy Framework Switching** - Change framework with a single config option

### Advanced Systems
- 📢 **Multiple Notification Systems** - bln_notify, ox_lib, lxr-notify, rsg-notify, qb-notify, mythic_notify, or custom
- 📊 **Multiple HUD Systems** - bln_hud, lxr-hud, rsg-hud, qb-hud, esx_hud, or custom
- ⏳ **Multiple Progressbar Systems** - lxr-progressbar, ox_lib, rsg-progressbar, qb-progressbar, mythic_progbar, or custom
- 🎯 **Multiple Interaction Systems** - co_interactions, ox_target, qb-target, rp-interact, lxr-target, or custom

### Gameplay Features
- 🎮 **Progressbar Support** - Optional progressbar when deploying smoke flares
- 🚫 **Smart Limits** - Configurable world and per-player smoke limits
- 🔄 **Auto-Sync** - New players automatically see existing smoke flares
- 🧹 **Clean Resource Stop** - Automatic cleanup when resource stops
- 🎨 **Custom Models** - Use any prop model for the smoke flare object

---

## 📦 Requirements

### Minimum Requirements
- RedM Server (Latest artifacts recommended)
- Lua 5.4 Support

### Framework Requirements (Choose One)
- **LXRCore** (Recommended) - https://github.com/lxrcore
- RSGCore, QBCore, QBX, ESX, VORP, RedEM:RP
- Or run in Standalone mode

### Optional (Enhances Functionality)
- **Notification System**: bln_notify (recommended), ox_lib, or others
- **HUD System**: bln_hud (recommended) or others
- **Progressbar System**: lxr-progressbar (recommended), ox_lib, or others
- **Interaction System**: co_interactions (recommended), ox_target, or others

---

## 🚀 Installation

### Step 1: Download & Extract
1. Download the latest release
2. Extract `lxr-smokeflair` to your server's resources folder
3. Rename folder to `lxr-smokeflair` (if needed)

### Step 2: Add to Server Configuration
Add to your `server.cfg`:
```cfg
ensure lxr-smokeflair
```

### Step 3: Configure Framework
Open `config.lua` and set your framework:
```lua
Config.Framework = 'lxr-core' -- Options: 'lxr-core', 'rsg-core', 'qb-core', 'qbx', 'esx', 'vorp', 'redem', 'standalone'
```

### Step 4: Configure Systems (Optional)
Configure your preferred systems in `config.lua`:
```lua
Config.NotifyType = 'bln_notify'
Config.HudType = 'bln_hud'
Config.ProgressbarType = 'lxr-progressbar'
Config.InteractionType = 'co_interactions'
```

### Step 5: Add Items to Database
See [Item Database](#-item-database) section below for SQL queries

### Step 6: Add Item Icons (Optional)
Copy the provided icons to your inventory system:
- `big_smoke.png` - Use for big smoke flares
- `small_smoke.png` - Use for small smoke flares
- Or create your own custom icons!

### Step 7: Restart Server
```
restart lxr-smokeflair
```

---

## ⚙️ Configuration

### Framework Selection
```lua
Config.Framework = 'lxr-core'
```
**Options**: `lxr-core`, `rsg-core`, `qb-core`, `qbx`, `esx`, `vorp`, `redem`, `standalone`

### Notification System
```lua
Config.NotifyType = 'bln_notify'
Config.CustomNotifyResource = 'bln_notify' -- For custom notifications
```
**Options**: `bln_notify`, `ox_lib`, `lxr-notify`, `rsg-notify`, `qb-notify`, `mythic_notify`, `custom`, `default`

### HUD System
```lua
Config.HudType = 'bln_hud'
Config.CustomHudResource = 'bln_hud'
```
**Options**: `bln_hud`, `lxr-hud`, `rsg-hud`, `qb-hud`, `esx_hud`, `custom`, `none`

### Progressbar System
```lua
Config.UseProgressbar = true
Config.ProgressbarDuration = 5000 -- 5 seconds
Config.ProgressbarType = 'lxr-progressbar'
```
**Options**: `lxr-progressbar`, `ox_lib`, `rsg-progressbar`, `qb-progressbar`, `mythic_progbar`, `custom`, `none`

### Interaction System
```lua
Config.InteractionType = 'co_interactions'
Config.CustomInteractionResource = 'co_interactions'
```
**Options**: `co_interactions`, `ox_target`, `qb-target`, `rp-interact`, `lxr-target`, `custom`, `none`

### Gameplay Settings
```lua
Config.maxSmokes = 15              -- Maximum smokes in the world
Config.maxSmokePerPlayer = 5       -- Maximum per player

Config.Animation = {
    dict = 'amb_camp@world_camp_jack_plant@idle_a',
    name = 'idle_a',
    duration = 10000,              -- 10 seconds
    freezePlayer = true,           -- Freeze during animation
}
```

### Adding Custom Smoke Colors
Add new smoke flares in `Config.Items`:
```lua
big_custom_smoke = {
    label = "Big Custom Smoke Flare",
    duration = 60,                 -- Duration in seconds
    scale = 4.0,                   -- Size of smoke effect
    color = { r = 255, g = 0, b = 0 }, -- RGB color
    model = `s_dynamitehusk01x`,   -- Object model
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},
```

### Translation Customization
```lua
Config.Translations = {
    smokeUsed = "You have deployed a smoke flare.",
    smokeDeploying = "Deploying smoke flare...",
    maxSmokesReached = "Maximum number of smoke flares in the world reached.",
    maxPlayerSmokesReached = "You have reached your personal smoke flare limit.",
    noSmokeItem = "You do not have this item.",
    cancelled = "Action cancelled.",
}
```

---

## 🎯 Framework Support

### LXRCore (Primary Framework)
```lua
Config.Framework = 'lxr-core'
```
Full integration with LXRCore including:
- Character selection synchronization
- Inventory management
- Item registration
- Player data handling

### RSGCore
```lua
Config.Framework = 'rsg-core'
```
Complete compatibility with RSGCore

### QBCore / QBX
```lua
Config.Framework = 'qb-core'  -- or 'qbx'
```
Full QBCore and QBX framework support

### ESX
```lua
Config.Framework = 'esx'
```
Full ESX framework support

### VORP
```lua
Config.Framework = 'vorp'
```
Complete VORP framework integration

### RedEM:RP
```lua
Config.Framework = 'redem'
```
Full RedEM:RP framework support

### Standalone
```lua
Config.Framework = 'standalone'
```
Run without any framework dependency

---

## 📢 Notification Systems

### bln_notify (Recommended)
```lua
Config.NotifyType = 'bln_notify'
```
Beautiful, modern notifications with customizable styles

### ox_lib
```lua
Config.NotifyType = 'ox_lib'
```
Clean and simple ox_lib notifications

### LXR/RSG/QB Notifications
```lua
Config.NotifyType = 'lxr-notify'  -- or 'rsg-notify', 'qb-notify'
```
Framework-specific notification systems

### Custom Notification System
```lua
Config.NotifyType = 'custom'
Config.CustomNotifyResource = 'your_notify_resource'
```
Use any custom notification resource

### Default (Chat-based)
```lua
Config.NotifyType = 'default'
```
Simple chat-based notifications as fallback

---

## 📊 HUD & Progressbar Systems

### Supported HUD Systems
- **bln_hud** (Recommended) - Modern, customizable HUD
- **lxr-hud** - LXRCore HUD system
- **rsg-hud** - RSGCore HUD system
- **qb-hud** - QBCore HUD system
- **esx_hud** - ESX HUD system
- **custom** - Your own HUD resource
- **none** - Disable HUD integration

### Supported Progressbar Systems
- **lxr-progressbar** (Recommended) - LXRCore progressbar
- **ox_lib** - ox_lib progress circles
- **rsg-progressbar** - RSGCore progressbar
- **qb-progressbar** - QBCore progressbar
- **mythic_progbar** - Mythic progressbar
- **custom** - Your own progressbar resource
- **none** - Disable progressbar (instant deployment)

---

## 🎯 Interaction Systems

### Supported Interaction Systems
- **co_interactions** (Recommended) - Context-based interactions
- **ox_target** - ox_target targeting system
- **qb-target** - QBCore target system
- **rp-interact** - RP interaction system
- **lxr-target** - LXRCore target system
- **custom** - Your own interaction resource
- **none** - No interaction system integration

---

## 🗄️ Item Database

### Available Items (35+ Smoke Flares)

#### Big Smoke Flares (60 seconds)
- `big_red_smoke`, `big_blue_smoke`, `big_green_smoke`
- `big_yellow_smoke`, `big_orange_smoke`, `big_cyan_smoke`
- `big_violet_smoke`, `big_purple_smoke`, `big_white_smoke`
- `big_black_smoke`, `big_pink_smoke`, `big_gold_smoke`
- `big_silver_smoke`, `big_lime_smoke`, `big_magenta_smoke`

#### Medium Smoke Flares (45 seconds)
- `medium_red_smoke`, `medium_blue_smoke`, `medium_green_smoke`
- `medium_yellow_smoke`, `medium_white_smoke`

#### Small Smoke Flares (30 seconds)
- `small_red_smoke`, `small_blue_smoke`, `small_green_smoke`
- `small_yellow_smoke`, `small_orange_smoke`, `small_cyan_smoke`
- `small_violet_smoke`, `small_purple_smoke`, `small_white_smoke`
- `small_black_smoke`, `small_pink_smoke`, `small_gold_smoke`
- `small_silver_smoke`, `small_lime_smoke`, `small_magenta_smoke`

### SQL Examples

#### For LXRCore / RSGCore / QBCore
```sql
-- Example: Add big red smoke
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('big_red_smoke', 'Big Red Smoke Flare', 1, 0, 1);

-- Example: Add small blue smoke
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('small_blue_smoke', 'Small Blue Smoke Flare', 1, 0, 1);
```

#### For ESX
```sql
INSERT INTO `items` (`name`, `label`, `weight`) VALUES
('big_red_smoke', 'Big Red Smoke Flare', 1);
```

#### For VORP
```sql
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES
('big_red_smoke', 'Big Red Smoke Flare', 10, 1, 'item_standard', 1);
```

---

## 🎨 Customization

### Creating Custom Colors
You can create unlimited custom smoke colors using RGB values:

```lua
big_custom_smoke = {
    label = "Big Custom Color Smoke Flare",
    duration = 60,
    scale = 4.0,
    color = { r = 123, g = 45, b = 67 }, -- Your custom RGB values (0-255)
    model = `s_dynamitehusk01x`,
    rotation = { x = -90.0, y = 0.0, z = 0.0 },
    offset = { x = 0.1, y = 0.5, z = 0.0 },
},
```

### Custom Animations
Change the deployment animation:

```lua
Config.Animation = {
    dict = 'your_animation_dict',
    name = 'your_animation_name',
    duration = 8000,
    freezePlayer = true,
}
```

### Custom Models
Use different prop models for the smoke flare object:

```lua
model = `your_model_hash`,
```

### Size Variations
Adjust smoke size and duration:

```lua
duration = 90,  -- 90 seconds
scale = 6.0,    -- Extra large smoke
```

---

## 🔧 Troubleshooting

### Smoke Flares Not Working
1. Verify framework is configured correctly in `config.lua`
2. Check that items are added to your database
3. Ensure resource is started: `ensure lxr-smokeflair`
4. Check server console for errors

### Notifications Not Showing
1. Verify `Config.NotifyType` matches your notification resource
2. Check that notification resource is started
3. Try `Config.NotifyType = 'default'` for chat-based fallback

### Progressbar Not Working
1. Verify `Config.ProgressbarType` matches your progressbar resource
2. Check that progressbar resource is started
3. Set `Config.UseProgressbar = false` to disable

### Items Not Usable
1. Verify items are added to your database correctly
2. Check framework configuration
3. Ensure item names match exactly (case-sensitive)
4. Restart both inventory and smoke flair resources

### Smoke Not Visible to Other Players
1. Check server console for synchronization errors
2. Verify network settings
3. Ensure `TriggerClientEvent` is not blocked by anticheat

### Framework Not Detected
1. Verify framework resource is started before lxr-smokeflair
2. Check framework export names match
3. Try `Config.Framework = 'standalone'` as test

---

## 💡 Advanced Configuration Tips

### Performance Optimization
- Lower `Config.maxSmokes` for servers with many players
- Reduce smoke `duration` for better performance
- Use smaller `scale` values when possible

### Realistic Roleplay Setup
- Set `Config.UseProgressbar = true` for realistic deployment time
- Enable `Config.Animation.freezePlayer` to prevent movement abuse
- Lower `Config.maxSmokePerPlayer` for balance

### Event/Signal Flares
- Use different colors for different signals (red = emergency, green = safe, etc.)
- Create large smoke flares for long-distance visibility
- Add rare/expensive flares with unique colors

---

## 🐛 Known Issues

Currently no known issues. Report bugs on our GitHub or Discord.

---

## 📝 Changelog

### Version 2.0.0 (Current)
- Complete rebranding as The Land of Wolves RP
- Added LXRCore as primary framework
- Added support for 7+ frameworks
- Added 20+ new smoke colors
- Added medium-sized smoke flares
- Added configurable notification systems (8+ options)
- Added configurable HUD systems (6+ options)
- Added configurable progressbar systems (6+ options)
- Added configurable interaction systems (6+ options)
- Enhanced configuration structure (100x better)
- Removed jo_libs dependency
- Added standalone utility system
- Improved code organization
- Enhanced documentation
- Added troubleshooting guide

### Version 1.0.0
- Initial release by Morojgovany
- Basic smoke system with jo_libs

---

## 🤝 Support

### The Land of Wolves RP
- **Website**: [www.wolves.land](https://www.wolves.land)
- **Discord**: Join our community
- **GitHub**: [LXRCore](https://github.com/lxrcore)

### Contributing
We welcome contributions! Feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Share your custom configurations

---

## 📜 License

This resource is provided as-is for The Land of Wolves RP community.

Original concept by Morojgovany - Enhanced and rebranded for The Land of Wolves RP.

---

## 🙏 Credits

- **Original Author**: Morojgovany
- **Enhanced By**: The Land of Wolves RP Team
- **Framework**: LXRCore Development Team
- **Community**: All our testers and contributors

---

<div align="center">

**Made with ❤️ for The Land of Wolves RP Community**

🐺 **www.wolves.land** 🐺

</div>
