--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                                                                  ║
    ║        The Land of Wolves RP - Smoke Flair Server               ║
    ║                   www.wolves.land                                ║
    ║                                                                  ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

local activeSmokes = {}
local smokeIdCounter = 0
local playerSmokeCount = {}

local function getPlayerSmokeCount(source)
    return playerSmokeCount[source] or 0
end

local function incrementPlayerSmokeCount(source)
    playerSmokeCount[source] = getPlayerSmokeCount(source) + 1
end

local function decrementPlayerSmokeCount(source)
    if not playerSmokeCount[source] then
        return
    end

    playerSmokeCount[source] = math.max(playerSmokeCount[source] - 1, 0)

    if playerSmokeCount[source] == 0 then
        playerSmokeCount[source] = nil
    end
end

local function removeActiveSmoke(smokeId)
    local smoke = activeSmokes[smokeId]
    if not smoke then
        return
    end

    activeSmokes[smokeId] = nil
    if smoke.owner then
        decrementPlayerSmokeCount(smoke.owner)
    end
end

function getCurrentSmokes()
    local now = GetGameTimer()
    local smokeList = {}

    for smokeId, smoke in pairs(activeSmokes) do
        local remainingMs = (smoke.expiresAt or 0) - now

        if remainingMs <= 0 then
            removeActiveSmoke(smokeId)
        else
            table.insert(smokeList, {
                coords = smoke.coords,
                itemData = {
                    duration = remainingMs / 1000,
                    scale = smoke.itemData.scale,
                    color = smoke.itemData.color
                }
            })
        end
    end

    return smokeList
end

-- ═══════════════════════════════════════════════════════════════════
--                      FRAMEWORK INTEGRATION
-- ═══════════════════════════════════════════════════════════════════

-- Support for frameworks with character selection
if Config.Framework ~= 'standalone' then
    AddEventHandler('playerLoaded', function(source)
        local smokes = getCurrentSmokes()
        TriggerClientEvent('lxr_smokeflair:syncSmokes', source, smokes)
    end)
    
    -- LXRCore/RSGCore style
    RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
        local source = source
        local smokes = getCurrentSmokes()
        TriggerClientEvent('lxr_smokeflair:syncSmokes', source, smokes)
    end)
    
    RegisterNetEvent('RSGCore:Server:OnPlayerLoaded', function()
        local source = source
        local smokes = getCurrentSmokes()
        TriggerClientEvent('lxr_smokeflair:syncSmokes', source, smokes)
    end)
    
    -- VORP style
    RegisterNetEvent('vorp:SelectedCharacter', function(charid)
        local source = source
        local smokes = getCurrentSmokes()
        TriggerClientEvent('lxr_smokeflair:syncSmokes', source, smokes)
    end)
    
    -- RedEM style
    RegisterNetEvent('redemrp_respawn:playerFullySpawned', function()
        local source = source
        local smokes = getCurrentSmokes()
        TriggerClientEvent('lxr_smokeflair:syncSmokes', source, smokes)
    end)
end

-- ═══════════════════════════════════════════════════════════════════
--                      ITEM REGISTRATION
-- ═══════════════════════════════════════════════════════════════════

Citizen.CreateThread(function()
    Wait(1000) -- Wait for framework to load
    
    for itemName, itemData in pairs(Config.Items) do
        Utils.RegisterUsableItem(itemName, function(source, item)
            local _source = source
            
            if not Utils.HasItem(_source, itemName, 1) then
                Utils.Notify(_source, Config.Translations.noSmokeItem, 'error')
                return
            end
            
            if #activeSmokes >= Config.maxSmokes then
                Utils.Notify(_source, Config.Translations.maxSmokesReached, 'error')
                return
            end
            
            if getPlayerSmokeCount(_source) >= Config.maxSmokePerPlayer then
                Utils.Notify(_source, Config.Translations.maxPlayerSmokesReached, 'error')
                return
            end
            
            if Utils.RemoveItem(_source, itemName, 1, item and item.metadata) then
                TriggerClientEvent("lxr_smokeflair:setSmokeObject", _source, itemName)
                Utils.Notify(_source, Config.Translations.smokeUsed, 'success')
            else
                Utils.Notify(_source, Config.Translations.noSmokeItem, 'error')
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════════════════════════
--                      SMOKE SYNCHRONIZATION
-- ═══════════════════════════════════════════════════════════════════

RegisterServerEvent("lxr_smokeflair:shareSmoke")
AddEventHandler("lxr_smokeflair:shareSmoke", function(coords, item)
    if not item or not Config.Items[item] then
        return
    end

    local _source = source
    if getPlayerSmokeCount(_source) >= Config.maxSmokePerPlayer then
        Utils.Notify(_source, Config.Translations.maxPlayerSmokesReached, 'error')
        return
    end

    local itemData = Config.Items[item]
    local syncedItemData = {
        duration = itemData.duration,
        scale = itemData.scale,
        color = itemData.color
    }

    smokeIdCounter = smokeIdCounter + 1
    local smokeId = smokeIdCounter
    local expiresAt = GetGameTimer() + (syncedItemData.duration * 1000)
    local coordsData = { x = coords.x, y = coords.y, z = coords.z }

    incrementPlayerSmokeCount(_source)

    activeSmokes[smokeId] = {
        coords = coordsData,
        itemData = syncedItemData,
        expiresAt = expiresAt,
        owner = _source
    }

    Citizen.SetTimeout(syncedItemData.duration * 1000, function()
        removeActiveSmoke(smokeId)
    end)

    TriggerClientEvent("lxr_smokeflair:syncSmoke", -1, coords, syncedItemData)
    
    -- Log to Discord
    Utils.LogSmokeDeployment(_source, item, itemData, coordsData)
end)

-- ═══════════════════════════════════════════════════════════════════
--                      PLAYER CLEANUP
-- ═══════════════════════════════════════════════════════════════════

AddEventHandler('playerDropped', function()
    playerSmokeCount[source] = nil
end)
