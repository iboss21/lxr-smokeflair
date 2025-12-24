--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                                                                  ║
    ║           The Land of Wolves RP - Utility Functions             ║
    ║                                                                  ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

Utils = {}

-- ═══════════════════════════════════════════════════════════════════
--                      NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════════════

function Utils.Notify(source, message, type, duration)
    local notifyType = Config.NotifyType
    duration = duration or 5000
    type = type or 'info'
    
    -- Map type to bln_notify types
    local blnType = type
    if type == 'success' then
        blnType = 'success'
    elseif type == 'error' then
        blnType = 'error'
    elseif type == 'warning' then
        blnType = 'warning'
    else
        blnType = 'info'
    end
    
    if IsDuplicityVersion() then -- Server side
        if notifyType == 'bln_notify' then
            TriggerClientEvent('bln_notify:sendNotification', source, 'Smoke Flair', message, blnType, duration)
        elseif notifyType == 'lxr-notify' or notifyType == 'rsg-notify' then
            TriggerClientEvent('lxr-notify:ShowNotification', source, message, type, duration)
        elseif notifyType == 'vorp_notify' then
            TriggerClientEvent('vorp:Tip', source, message, duration)
        elseif notifyType == 'redem_notify' then
            TriggerClientEvent('redem_roleplay:Tip', source, message, duration)
        elseif notifyType == 'redemrp_notification' then
            TriggerClientEvent('redemrp_notification:start', source, message, duration, type)
        elseif notifyType == 'custom' then
            local customResource = Config.CustomNotifyResource
            if customResource == 'bln_notify' then
                TriggerClientEvent('bln_notify:sendNotification', source, 'Smoke Flair', message, blnType, duration)
            else
                TriggerClientEvent(customResource .. ':notify', source, message, type, duration)
            end
        else
            -- Default notification (Native RedM)
            TriggerClientEvent('chat:addMessage', source, {
                args = { '[Smoke Flair]', message }
            })
        end
    else -- Client side
        if notifyType == 'bln_notify' then
            exports['bln_notify']:notify('Smoke Flair', message, blnType, duration)
        elseif notifyType == 'lxr-notify' or notifyType == 'rsg-notify' then
            exports['rsg-notify']:ShowNotification(message, type, duration)
        elseif notifyType == 'vorp_notify' then
            TriggerEvent('vorp:Tip', message, duration)
        elseif notifyType == 'redem_notify' then
            TriggerEvent('redem_roleplay:Tip', message, duration)
        elseif notifyType == 'redemrp_notification' then
            exports['redemrp_notification']:start(message, duration, type)
        elseif notifyType == 'custom' then
            local customResource = Config.CustomNotifyResource
            if customResource == 'bln_notify' then
                exports['bln_notify']:notify('Smoke Flair', message, blnType, duration)
            else
                exports[customResource]:notify(message, type, duration)
            end
        else
            -- Default notification (Native RedM)
            TriggerEvent('chat:addMessage', {
                args = { '[Smoke Flair]', message }
            })
        end
    end
end

-- ═══════════════════════════════════════════════════════════════════
--                      PROGRESSBAR SYSTEM
-- ═══════════════════════════════════════════════════════════════════

function Utils.Progressbar(message, duration)
    if not Config.UseProgressbar then
        Wait(duration)
        return true
    end
    
    local progressType = Config.ProgressbarType
    local finished = false
    
    if progressType == 'lxr-progressbar' or progressType == 'rsg-progressbar' then
        exports['rsg-progressbar']:Progress({
            name = "smoke_deploy",
            duration = duration,
            label = message,
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function(cancelled)
            finished = not cancelled
        end)
        while not finished do
            Wait(100)
        end
    elseif progressType == 'vorp_progressbar' then
        exports['vorp_progressbar']:Progress({
            duration = duration,
            label = message,
        }, function(isDone)
            finished = isDone
        end)
        while not finished do
            Wait(100)
        end
    elseif progressType == 'redem_progressbar' then
        exports['redem_progressbar']:Progress({
            duration = duration,
            label = message,
        }, function(isDone)
            finished = isDone
        end)
        while not finished do
            Wait(100)
        end
    elseif progressType == 'progressBars' then
        exports['progressBars']:startUI(duration, message)
        Wait(duration)
        finished = true
    elseif progressType == 'custom' then
        local customResource = Config.CustomProgressbarResource
        if GetResourceState(customResource) == 'started' then
            exports[customResource]:Progress({
                name = "smoke_deploy",
                duration = duration,
                label = message,
                useWhileDead = false,
                canCancel = true,
            }, function(cancelled)
                finished = not cancelled
            end)
            while not finished do
                Wait(100)
            end
        else
            Wait(duration)
            finished = true
        end
    else
        Wait(duration)
        finished = true
    end
    
    return finished
end

-- ═══════════════════════════════════════════════════════════════════
--                      FRAMEWORK SYSTEM
-- ═══════════════════════════════════════════════════════════════════

if IsDuplicityVersion() then -- Server side only
    
    Utils.Framework = nil
    
    function Utils.GetFramework()
        if Utils.Framework then
            return Utils.Framework
        end
        
        local framework = Config.Framework
        
        if framework == 'lxr-core' then
            Utils.Framework = exports['lxr-core']:GetCoreObject()
        elseif framework == 'rsg-core' then
            Utils.Framework = exports['rsg-core']:GetCoreObject()
        elseif framework == 'vorp' then
            Utils.Framework = {}
            Utils.Framework.VorpCore = exports.vorp_core:GetCore()
        elseif framework == 'redem' then
            Utils.Framework = exports['redem_roleplay']:RedEM()
        end
        
        return Utils.Framework
    end
    
    function Utils.GetPlayer(source)
        local framework = Config.Framework
        local fw = Utils.GetFramework()
        
        if not fw then return nil end
        
        if framework == 'lxr-core' or framework == 'rsg-core' then
            return fw.Functions.GetPlayer(source)
        elseif framework == 'vorp' then
            return fw.VorpCore.getUser(source)
        elseif framework == 'redem' then
            return fw.GetPlayer(source)
        end
        
        return nil
    end
    
    function Utils.HasItem(source, item, amount)
        local framework = Config.Framework
        local Player = Utils.GetPlayer(source)
        
        if not Player then return false end
        
        amount = amount or 1
        
        if framework == 'lxr-core' or framework == 'rsg-core' then
            local hasItem = Player.Functions.GetItemByName(item)
            if hasItem and hasItem.amount >= amount then
                return true
            end
        elseif framework == 'vorp' then
            local hasItem = Player.getInventoryItem(item)
            if hasItem and hasItem.count >= amount then
                return true
            end
        elseif framework == 'redem' then
            local hasItem = Player.getInventoryItem(item)
            if hasItem and hasItem.count >= amount then
                return true
            end
        end
        
        return false
    end
    
    function Utils.RemoveItem(source, item, amount, metadata)
        local framework = Config.Framework
        local Player = Utils.GetPlayer(source)
        
        if not Player then return false end
        
        amount = amount or 1
        
        if framework == 'lxr-core' or framework == 'rsg-core' then
            return Player.Functions.RemoveItem(item, amount, false, metadata)
        elseif framework == 'vorp' then
            Player.removeInventoryItem(item, amount)
            return true
        elseif framework == 'redem' then
            Player.removeInventoryItem(item, amount)
            return true
        end
        
        return false
    end
    
    function Utils.RegisterUsableItem(item, callback)
        local framework = Config.Framework
        local fw = Utils.GetFramework()
        
        if not fw then return end
        
        if framework == 'lxr-core' or framework == 'rsg-core' then
            fw.Functions.CreateUseableItem(item, callback)
        elseif framework == 'vorp' then
            fw.VorpCore.RegisterUsableItem(item, callback)
        elseif framework == 'redem' then
            fw.RegisterUsableItem(item, callback)
        end
    end
    
    -- ═══════════════════════════════════════════════════════════════════
    --                      DISCORD WEBHOOK LOGGING
    -- ═══════════════════════════════════════════════════════════════════
    
    function Utils.SendToDiscord(title, message, color, fields)
        if not Config.DiscordWebhook.enabled or Config.DiscordWebhook.webhook == '' then
            return
        end
        
        local embed = {
            {
                ["color"] = color or Config.DiscordWebhook.color,
                ["title"] = title,
                ["description"] = message,
                ["fields"] = fields or {},
                ["footer"] = {
                    ["text"] = "The Land of Wolves RP - Smoke Flair System",
                    ["icon_url"] = Config.DiscordWebhook.botAvatar or ""
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
        
        PerformHttpRequest(Config.DiscordWebhook.webhook, function(err, text, headers) end, 'POST', json.encode({
            username = Config.DiscordWebhook.botName,
            avatar_url = Config.DiscordWebhook.botAvatar,
            embeds = embed
        }), { ['Content-Type'] = 'application/json' })
    end
    
    function Utils.GetPlayerIdentifiers(source)
        local identifiers = {
            steam = "",
            discord = "",
            license = "",
            ip = ""
        }
        
        for k, v in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                identifiers.steam = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                identifiers.discord = "<@" .. string.sub(v, 9) .. ">"
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                identifiers.license = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                identifiers.ip = v
            end
        end
        
        return identifiers
    end
    
    function Utils.LogSmokeDeployment(source, itemName, itemData, coords)
        if not Config.DiscordWebhook.enabled or not Config.DiscordWebhook.logDeploy then
            return
        end
        
        local playerName = GetPlayerName(source)
        local identifiers = Utils.GetPlayerIdentifiers(source)
        
        local fields = {
            {
                ["name"] = "Player",
                ["value"] = playerName,
                ["inline"] = true
            },
            {
                ["name"] = "Item",
                ["value"] = itemData.label or itemName,
                ["inline"] = true
            },
            {
                ["name"] = "Duration",
                ["value"] = itemData.duration .. " seconds",
                ["inline"] = true
            }
        }
        
        if Config.DiscordWebhook.includeSteamID and identifiers.steam ~= "" then
            table.insert(fields, {
                ["name"] = "Steam ID",
                ["value"] = identifiers.steam,
                ["inline"] = true
            })
        end
        
        if Config.DiscordWebhook.includeDiscordID and identifiers.discord ~= "" then
            table.insert(fields, {
                ["name"] = "Discord",
                ["value"] = identifiers.discord,
                ["inline"] = true
            })
        end
        
        if Config.DiscordWebhook.includeCoordinates then
            table.insert(fields, {
                ["name"] = "Coordinates",
                ["value"] = string.format("X: %.2f, Y: %.2f, Z: %.2f", coords.x, coords.y, coords.z),
                ["inline"] = false
            })
        end
        
        -- Color based on smoke color (convert RGB to decimal)
        local discordColor = (itemData.color.r * 65536) + (itemData.color.g * 256) + itemData.color.b
        
        Utils.SendToDiscord(
            "🎆 Smoke Flare Deployed",
            "**" .. playerName .. "** has deployed a smoke flare",
            discordColor,
            fields
        )
    end
end
