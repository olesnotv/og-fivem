ESX = exports['es_extended']:getSharedObject()

local function vec4To3(vec4)
    return vector3(vec4.x, vec4.y, vec4.z)
end

local function spawnPed(model, posx, posy, posz, posw)
    local hash = GetHashKey(model)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Citizen.Wait(20)
    end
    ped = CreatePed(4, model, posx, posy, posz - 1.0, posw, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true) 
    FreezeEntityPosition(ped, true)
end

function spawnCar(model, coords)
    if spawnedVehicle then
        ESX.ShowNotification("~r~Vous ne pouvez pas sortir plus d\'un véhicule du garage à la fois !")
    else
        local hash = GetHashKey(model)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end

        local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, coords.w, false, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

        spawnedVehicle = vehicle
    end
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function deleteVehicle()
    if IsControlJustReleased(0, 51) then
        if spawnedVehicle and DoesEntityExist(spawnedVehicle) then
            DeleteVehicle(spawnedVehicle)
            spawnedVehicle = nil
            ESX.ShowNotification("~g~Véhicule supprimé.")
        else
            ESX.ShowNotification("~r~Le véhicule doit provenir du garage LSPD.")
        end
    end
end

Citizen.CreateThread(function()
    while true do
        job = ESX.PlayerData.job.name
        grade = ESX.PlayerData.job.grade
        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function(job)
            ESX.PlayerData.job = job
        end)
        Wait(5000)
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.acceuil.ped) do
        pos = v.coords
        spawnPed("s_m_y_cop_01", pos.x, pos.y, pos.z, pos.w)
    end
    while true do
        local interval = 1000
        local playerId = PlayerPedId()
        local coords = GetEntityCoords(playerId)
        
        for k, v in pairs(Config.acceuil.pos) do
            local position = v.coords
            local dist = #(coords - position)
            if dist < 10 then
                interval = 0
                DrawMarker(Config.marker.type, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker.scale, Config.marker.scale, Config.marker.scale, 0, Config.marker.colorR, Config.marker.colorG, Config.marker.colorB, false, false, true, 0, false, false, false, false)
                if dist <= 1.5 then
                    AddTextEntry("acceuil", "Appuyez sur ~INPUT_CONTEXT~ pour appeler un policier")
                    DisplayHelpTextThisFrame("acceuil", false)
                    if IsControlJustPressed(0, 51) then
                        
                    end
                end
            end
        end
        Citizen.Wait(interval)
    end
end)

Citizen.CreateThread(function()
    if job == "police" then
        while true do
            local interval = 1000
            local playerID = PlayerPedId()
            local coords = GetEntityCoords(playerID)

            local pos = Config.office.pos
            local dist = #(coords - pos)
            if dist <= 10 then
                interval = 0
                DrawMarker(Config.marker.type, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker.scale, Config.marker.scale, Config.marker.scale, 0, Config.marker.colorR, Config.marker.colorG, Config.marker.colorB, false, false, true, 0, false, false, false, false)
                if dist <= 1.5 then
                    AddTextEntry("office", "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir l'interface de gestion")
                    DisplayHelpTextThisFrame("office", false)
                    if IsControlJustPressed(0, 51) then
                        menuOffice()
                    end
                end
            end
            Wait(interval)
        end
    end
end)

Citizen.CreateThread(function()
    if job == "police" then
        while true do
            local interval = 1000
            local playerId = PlayerPedId()
            local coords = GetEntityCoords(playerId)
            
            for k, v in pairs(Config.vestiaire.pos) do
                local position = v.coords
                local dist = #(coords - position)
                if dist < 10 then
                    interval = 0
                    DrawMarker(Config.marker.type, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker.scale, Config.marker.scale, Config.marker.scale, 0, Config.marker.colorR, Config.marker.colorG, Config.marker.colorB, false, false, true, 0, false, false, false, false)
                    if dist <= 1.5 then
                        AddTextEntry("vestiaire", "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir votre casier")
                        DisplayHelpTextThisFrame("vestiaire", false)
                        if IsControlJustPressed(0, 51) then
                            menuClothe()
                        end
                    end
                end
            end
            Citizen.Wait(interval)
        end
    end
end)

Citizen.CreateThread(function()
    spawnPed("s_m_y_cop_01", Config.armory.ped.coords.x, Config.armory.ped.coords.y, Config.armory.ped.coords.z, Config.armory.ped.coords.w)
    if job == "police" then
        while true do
            local interval = 1000
            local playerId = PlayerPedId()
            local coords = GetEntityCoords(playerId)
            
            for k, v in pairs(Config.armory.pos) do
                local position = v.coords
                local dist = #(coords - position)
                if dist < 10 then
                    interval = 0
                    DrawMarker(Config.marker.type, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker.scale, Config.marker.scale, Config.marker.scale, 0, Config.marker.colorR, Config.marker.colorG, Config.marker.colorB, false, false, true, 0, false, false, false, false)
                    if dist <= 1.5 then
                        AddTextEntry("armory", "Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie")
                        DisplayHelpTextThisFrame("armory", false)
                        if IsControlJustPressed(0, 51) then
                            menuArmory()
                        end
                    end
                end
            end
            Citizen.Wait(interval)
        end 
    end
end)

Citizen.CreateThread(function()
    if job == "police" then
        while true do
            local interval = 1000
            local playerId = PlayerPedId()
            local coords = GetEntityCoords(playerId)
            
            local position = Config.garage.pos.inPed
            local dist = #(coords - position)
            if dist < 10 then
                interval = 0
                DrawMarker(Config.marker.type, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker.scale, Config.marker.scale, Config.marker.scale, 0, Config.marker.colorR, Config.marker.colorG, Config.marker.colorB, false, false, true, 0, false, false, false, false)
                if dist <= 1.5 then
                    AddTextEntry("garageSortie", "Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                    DisplayHelpTextThisFrame("garageSortie", false)
                    if IsControlJustPressed(0, 51) then
                        menuCar()
                    end
                end
            end
            Citizen.Wait(interval)
        end 
    end
end)

Citizen.CreateThread(function()
    if job == "police" then
        while true do
            local interval = 1000
            local playerId = PlayerPedId()
            local coords = GetEntityCoords(playerId)
            
            local position = Config.garage.pos.inCar
            local dist = #(coords - position)
            if dist < 10 then
                interval = 0
                DrawMarker(Config.marker2.type, position.x, position.y, position.z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.marker2.scale, Config.marker2.scale, Config.marker2.scale, 0, Config.marker.colorR, Config.marker.colorG, Config.marker.colorB, false, false, true, 0, false, false, false, false)
                if dist <= 1.5 then
                    AddTextEntry("garageSortie", "Appuyez sur ~INPUT_CONTEXT~ pour rentrer votre véhicule dans le garage")
                    DisplayHelpTextThisFrame("garageSortie", false)
                    if IsControlJustReleased(0, 51) then
                        deleteVehicle()
                    end
                end
            end
            Citizen.Wait(interval)
        end
    end
end)

Citizen.CreateThread(function()
    spawnPed("s_m_y_cop_01", Config.garage.pos.heliPed.x, Config.garage.pos.heliPed.y, Config.garage.pos.heliPed.z, Config.garage.pos.heliPed.w)
    if job == "police" then
        while true do
            local interval = 1000
            local playerId = PlayerPedId()
            local coords = GetEntityCoords(playerId)
            
            local position = vec4To3(Config.garage.pos.heliPed)
            local dist = #(coords - position)
            if dist <= 1.5 then
                interval = 0
                AddTextEntry("garageSortie", "Appuyez sur ~INPUT_CONTEXT~ pour demander un hélicoptère")
                DisplayHelpTextThisFrame("garageSortie", false)
                if IsControlJustReleased(0, 51) then
                    menuHeli()
                end
            end
            Citizen.Wait(interval)
        end
    end
end)

Citizen.CreateThread(function()
    if job == "police" then
        while true do
            local interval = 1000
            local playerId = PlayerPedId()
            local coords = GetEntityCoords(playerId)
            
            local position = Config.garage.pos.heliDelete
            local dist = #(coords - position)
            if dist <= 10 then
                interval = 0
                DrawMarker(Config.marker.type, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 0, 137, 255, 255, false, false, true, 2, false, false, false, false)
                if dist <= 5 then
                    AddTextEntry("garageSortie", "Appuyez sur ~INPUT_CONTEXT~ pour rentrer l\'hélicoptère")
                    DisplayHelpTextThisFrame("garageSortie", false)
                    if IsControlJustReleased(0, 51) then
                        deleteVehicle()
                    end
                end
            end
            Citizen.Wait(interval)
        end
    end
end)