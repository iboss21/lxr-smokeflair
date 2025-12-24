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
    
    if IsDuplicityVersion() then -- Server side
        if notifyType == 'bln_notify' or notifyType == 'custom' then
            TriggerClientEvent('bln_notify:notify', source, message, type, duration)
        elseif notifyType == 'ox_lib' then
            TriggerClientEvent('ox_lib:notify', source, {
                description = message,
                type = type,
                duration = duration
            })
        elseif notifyType == 'lxr-notify' or notifyType == 'rsg-notify' or notifyType == 'qb-notify' then
            TriggerClientEvent('QBCore:Notify', source, message, type, duration)
        elseif notifyType == 'mythic_notify' then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, {
                text = message,
                type = type,
                length = duration
            })
        else
            -- Default notification
            TriggerClientEvent('chat:addMessage', source, {
                args = { '[Smoke Flair]', message }
            })
        end
    else -- Client side
        if notifyType == 'bln_notify' or notifyType == 'custom' then
            exports['bln_notify']:notify(message, type, duration)
        elseif notifyType == 'ox_lib' then
            exports.ox_lib:notify({
                description = message,
                type = type,
                duration = duration
            })
        elseif notifyType == 'lxr-notify' then
            exports['lxr-notify']:Notify(message, type, duration)
        elseif notifyType == 'rsg-notify' then
            exports['rsg-notify']:Notify(message, type, duration)
        elseif notifyType == 'qb-notify' then
            TriggerEvent('QBCore:Notify', message, type, duration)
        elseif notifyType == 'mythic_notify' then
            exports['mythic_notify']:SendAlert(type, message, duration)
        else
            -- Default notification
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
    
    if progressType == 'lxr-progressbar' then
        exports['lxr-progressbar']:Progress({
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
            finished = true
        end)
    elseif progressType == 'ox_lib' then
        if exports.ox_lib:progressBar({
            duration = duration,
            label = message,
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                combat = true,
            },
        }) then
            finished = true
        end
    elseif progressType == 'rsg-progressbar' then
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
            finished = true
        end)
    elseif progressType == 'qb-progressbar' then
        exports['qb-progressbar']:Progress({
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
            finished = true
        end)
    elseif progressType == 'mythic_progbar' then
        exports['mythic_progbar']:Progress({
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
            finished = true
        end)
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
                finished = true
            end)
        else
            Wait(duration)
            finished = true
        end
    else
        Wait(duration)
        finished = true
    end
    
    if not finished then
        while not finished do
            Wait(100)
        end
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
        elseif framework == 'qb-core' then
            Utils.Framework = exports['qb-core']:GetCoreObject()
        elseif framework == 'qbx' then
            Utils.Framework = exports.qbx_core:GetCoreObject()
        elseif framework == 'esx' then
            Utils.Framework = exports['es_extended']:getSharedObject()
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
        
        if framework == 'lxr-core' or framework == 'rsg-core' or framework == 'qb-core' then
            return fw.Functions.GetPlayer(source)
        elseif framework == 'qbx' then
            return exports.qbx_core:GetPlayer(source)
        elseif framework == 'esx' then
            return fw.GetPlayerFromId(source)
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
        
        if framework == 'lxr-core' or framework == 'rsg-core' or framework == 'qb-core' or framework == 'qbx' then
            local hasItem = Player.Functions.GetItemByName(item)
            if hasItem and hasItem.amount >= amount then
                return true
            end
        elseif framework == 'esx' then
            local hasItem = Player.getInventoryItem(item)
            if hasItem and hasItem.count >= amount then
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
        
        if framework == 'lxr-core' or framework == 'rsg-core' or framework == 'qb-core' or framework == 'qbx' then
            return Player.Functions.RemoveItem(item, amount, false, metadata)
        elseif framework == 'esx' then
            Player.removeInventoryItem(item, amount)
            return true
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
        
        if framework == 'lxr-core' or framework == 'rsg-core' or framework == 'qb-core' then
            fw.Functions.CreateUseableItem(item, callback)
        elseif framework == 'qbx' then
            exports.qbx_core:CreateUseableItem(item, callback)
        elseif framework == 'esx' then
            fw.RegisterUsableItem(item, callback)
        elseif framework == 'vorp' then
            fw.VorpCore.RegisterUsableItem(item, callback)
        elseif framework == 'redem' then
            fw.RegisterUsableItem(item, callback)
        end
    end
end
