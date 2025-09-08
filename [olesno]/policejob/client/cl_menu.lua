function checkWeapon(weaponHash)
    local current = GetSelectedPedWeapon(-1)
    local hash = GetHashKey(weaponHash)
    if current == hash then
        print("true")
        return true
    else
        print("false");
        return false
    end
end

function menuCar()
    local menuCar = RageUI.CreateMenu("LSPD", "Garage")
    RageUI.Visible(menuCar, not RageUI.Visible(menuCar))
    while menuCar do 
        Citizen.Wait(0)
        RageUI.IsVisible(menuCar,true,true,true,function()
            RageUI.Separator("Choisir un véhicule")
            for _, car in ipairs(Config.garage.car) do
                RageUI.ButtonWithStyle(car.label, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        spawnCar(car.model, Config.garage.pos.out)
                        menuCar=RMenu:DeleteType("LSPD", true)
                    end
                end)
            end
        end,function()
        end)
        if not RageUI.Visible(menuCar) then
            menuCar=RMenu:DeleteType("LSPD", true)
        end
    end
end

function menuHeli()
    local menuHeli = RageUI.CreateMenu("LSPD","Toît")
    RageUI.Visible(menuHeli, not RageUI.Visible(menuHeli))
    while menuHeli do
        Citizen.Wait(0)
        RageUI.IsVisible(menuHeli,true,true,true,function()
            RageUI.Separator("Choisir un véhicule")
            RageUI.ButtonWithStyle("Maverick","Vous permet de prendre le contrôle d'un maverick avec livré LSPD", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    spawnCar("polmav", Config.garage.pos.heliSpawn)
                    menuHeli = RMenu:DeleteType("LSPD", true)
                end
            end)
        end,function()
        end)
        if not RageUI.Visible(menuHeli) then
            menuHeli=RMenu:DeleteType("LSPD", true)
        end
    end
end

function menuArmory()
    local grade = ESX.PlayerData.job.grade
    print(grade)
    local menuArmory = RageUI.CreateMenu("LSPD", "Armurerie")
    RageUI.Visible(menuArmory, not RageUI.Visible(menuArmory))
    while menuArmory do 
        Citizen.Wait(0)
        RageUI.IsVisible(menuArmory,true,true,true,function()
            RageUI.Separator("Choisir mon équipement")
            if grade == 0 then
                for k, v in ipairs(Config.armory.weapon.grade.recruit) do
                    print(v)
                    RageUI.ButtonWithStyle(v.name, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local weaponList = v.list
                            for _, list in pairs(weaponList) do
                                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(list.model), list.ammo, false, false)
                            end
                            menuArmory=RMenu:DeleteType("LSPD", true)
                        end
                    end)
                end
            elseif grade == 1 then
                for k, v in ipairs(Config.armory.weapon.grade.officer) do
                    RageUI.ButtonWithStyle(v.name, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local weaponList = v.list
                            for _, list in pairs(weaponList) do
                                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(list.model), list.ammo, false, false)
                            end
                            menuArmory=RMenu:DeleteType("LSPD", true)
                        end
                    end)
                end
            elseif grade == 2 then
                for k, v in ipairs(Config.armory.weapon.grade.sergeant) do
                    RageUI.ButtonWithStyle(v.name, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local weaponList = v.list
                            for _, list in pairs(weaponList) do
                                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(list.model), list.ammo, false, false)
                            end
                            menuArmory=RMenu:DeleteType("LSPD", true)
                        end
                    end)
                end
            elseif grade >= 3 then
                for k, v in ipairs(Config.armory.weapon.grade.lieutenant) do
                    RageUI.ButtonWithStyle(v.name, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local weaponList = v.list
                            for _, list in pairs(weaponList) do
                                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(list.model), list.ammo, false, false)
                            end
                            menuArmory=RMenu:DeleteType("LSPD", true)
                        end
                    end)
                end
            end
            RageUI.Separator("Zone dangeureuse")
            RageUI.ButtonWithStyle("Rendre mes armes", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    RemoveAllPedWeapons(GetPlayerPed(-1), false)
                end
            end)
        end,function()
        end)
        if not RageUI.Visible(menuArmory) then
            menuArmory=RMenu:DeleteType("LSPD", true)
        end
    end
end

function menuOffice()
    ESX.TriggerServerCallback('getHighestRankPlayer', function(player)
        local boss = player or {name = "Aucun", gradeLabel = ""}
    end, job)
    ESX.TriggerServerCallback('myScript:getPoliceBankMoney', function(money)
        local societyaccount = money
    end)
    
    
    local rank = ESX.PlayerData.job.grade
    if rank == 4 then
        local menuOffice = RageUI.CreateMenu("LSPD", "Gestion de société")
        RageUI.Visible(menuOffice, not RageUI.Visible(menuOffice))
        while menuOffice do 
            Citizen.Wait(0)
            RageUI.IsVisible(menuOffice,true,true,true,function()
                RageUI.Separator("Captain : ~g~" .. boss.name)
            end,function()
            end)
            if societyaccount > 0 then
                RageUI.Separator("Compte de la société ~g~" .. societyaccount .. "$")
            else
                RageUI.Separator("Compte de la société ~r~" .. societyaccount .. "$")
            if not RageUI.Visible(menuOffice) then
                menuOffice=RMenu:DeleteType("LSPD", true)
            end
        end
    else
        ESX.ShowNotification("Vous n\'avez pas les permissions pour ouvrir l\'interface de gestion")
end

function menuClothe()
    local menuClothe = RageUI.CreateMenu("LSPD", "Vestiaire")
    RageUI.Visible(menuClothe, not RageUI.Visible(menuClothe))
    while menuClothe do 
        Citizen.Wait(0)
        RageUI.IsVisible(menuClothe,true,true,true,function()
            RageUI.Separator("Choisir ma tenue")
        end,function()
        end)
        if not RageUI.Visible(menuClothe) then
            menuClothe=RMenu:DeleteType("LSPD", true)
        end
    end
end

function menuF6()
    local menuF6 = RageUI.CreateMenu("LSPD", "Menu F6")
    RageUI.Visible(menuF6, not RageUI.Visible(menuF6))
    while menuF6 do 
        Citizen.Wait(0)
        RageUI.IsVisible(menuF6,true,true,true,function()
            if not inService then
               RageUI.Separator("-") 
            end
            RageUI.Checkbox("En service", nil, inService, {}, function(Hovered, Active, Selected)
                if Selected then
                    if inService then
                        inService = false
                    else
                        inService = true
                    end
                end
            end)
            if inService then
                RageUI.Separator("-")
                RageUI.ButtonWithStyle("Intéraction", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        print('yes')
                    end
                end)
            end
        end,function()
        end)
        if not RageUI.Visible(menuF6) then
            menuF6=RMenu:DeleteType("LSPD", true)
        end
    end
end

RegisterKeyMapping("openlspd", "F6 Police", "keyboard", "F6")

RegisterCommand("openlspd", function()
    if job == "police" then
        menuF6()
    end
end, false)

