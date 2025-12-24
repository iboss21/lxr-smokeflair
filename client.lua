--[[
    ╔══════════════════════════════════════════════════════════════════╗
    ║                                                                  ║
    ║        The Land of Wolves RP - Smoke Flair Client               ║
    ║                   www.wolves.land                                ║
    ║                                                                  ║
    ╚══════════════════════════════════════════════════════════════════╝
--]]

local smokers = {}
local smokes = {}

RegisterNetEvent('lxr_smokeflair:setSmokeObject')
AddEventHandler('lxr_smokeflair:setSmokeObject', function(item)
    local playerPed = PlayerPedId()
    local itemConfig = Config.Items[item]
    
    if not itemConfig then
        Utils.Notify(nil, Config.Translations.noSmokeItem, 'error')
        return
    end
    
    -- Show progressbar if enabled
    if Config.UseProgressbar then
        Utils.Notify(nil, Config.Translations.smokeDeploying, 'info', 3000)
        local success = Utils.Progressbar(Config.Translations.smokeDeploying, Config.ProgressbarDuration)
        if not success then
            Utils.Notify(nil, Config.Translations.cancelled, 'error')
            return
        end
    end
    
    local function playAnim()
        local dict = Config.Animation.dict
        local name = Config.Animation.name
        local duration = Config.Animation.duration
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(10)
        end
        TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, duration, 1, 1.0, false, false, false)
        RemoveAnimDict(dict)
    end
    
    local coords = GetOffsetFromEntityInWorldCoords(playerPed, itemConfig.offset.x, itemConfig.offset.y, itemConfig.offset.z)

    if Config.Animation.freezePlayer then
        FreezeEntityPosition(playerPed, true)
    end
    
    playAnim()
    Wait(Config.Animation.duration * 0.4)
    
    local smoker = CreateObjectNoOffset(itemConfig.model, coords, true, false, true)
    PlaceObjectOnGroundProperly(smoker)
    SetEntityHeading(smoker, GetEntityHeading(playerPed))
    SetEntityInvincible(smoker, true)
    SetEntityRotation(smoker, itemConfig.rotation.x, itemConfig.rotation.y, itemConfig.rotation.z, 2)
    SetEntityCollision(smoker, false, true)
    SetEntityVisible(smoker, true)
    FreezeEntityPosition(smoker, true)
    local index = #smokers + 1
    smokers[index] = smoker
    
    Wait(Config.Animation.duration * 0.35)
    ClearPedTasks(playerPed)
    
    if Config.Animation.freezePlayer then
        FreezeEntityPosition(playerPed, false)
    end

    TriggerServerEvent("lxr_smokeflair:shareSmoke", GetEntityCoords(smoker), item)

    Wait(itemConfig.duration * 1000 + 1000)
    DeleteObject(smoker)
    smokers[index] = nil
end)

RegisterNetEvent('lxr_smokeflair:syncSmoke')
AddEventHandler('lxr_smokeflair:syncSmoke', function(coords, itemData)
    RequestNamedPtfxAsset(`SCR_ADV_SOK`)
    while not HasNamedPtfxAssetLoaded(`SCR_ADV_SOK`) do
        Wait(20)
    end

    UseParticleFxAsset("SCR_ADV_SOK")
    local groundCheck, ground = GetGroundZAndNormalFor_3dCoord(coords.x, coords.y, coords.z)
    if groundCheck then
        local newZ = ground - 1.0
        coords = vector3(coords.x, coords.y, newZ)
    end
    local smoke = StartParticleFxLoopedAtCoord("scr_adv_sok_torchsmoke", coords.x, coords.y, (coords.z - itemData.scale), 0.0, 0.0, 0.0, itemData.scale, false, false, false, true)
    local index = #smokes + 1
    smokes[index] = smoke
    local function normalizeColorValue(value)
        value = value or 0
        return math.min(value / 255.0, 1.0)
    end

    SetParticleFxLoopedColour(
        smoke,
        normalizeColorValue(itemData.color.r),
        normalizeColorValue(itemData.color.g),
        normalizeColorValue(itemData.color.b),
        1
    )
    Wait(itemData.duration * 1000)
    StopParticleFxLooped(smoke, true)
    smokes[index] = nil
end)

RegisterNetEvent('lxr_smokeflair:syncSmokes')
AddEventHandler('lxr_smokeflair:syncSmokes', function(allSmokes)
    for i, smokeData in pairs(allSmokes) do
        TriggerEvent('lxr_smokeflair:syncSmoke', smokeData.coords, smokeData.itemData)
        Wait(500)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if #smokers > 0 then
            for _, smoker in pairs(smokers) do
                DeleteObject(smoker)
            end
        end
        if #smokes > 0 then
            for _, smoke in pairs(smokes) do
                StopParticleFxLooped(smoke, true)
            end
        end
        ClearPedTasks(PlayerPedId())
    end
end)
