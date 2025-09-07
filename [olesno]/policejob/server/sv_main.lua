local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("myserver:giveWeapon")
AddEventHandler("myserver:giveWeapon", function(weaponName, weaponAmmo)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local exists = false
        for _, weapon in ipairs(Config.armory.weapon) do
            if weapon.name == weaponName then
                exists = true
                break
            end
        end

        if exists then
            xPlayer.addWeapon(weaponName, weaponAmmo) -- donne l’arme avec 250 munitions
        else
            print(("[myserver] %s a tenté d'obtenir une arme invalide (%s)"):format(GetPlayerName(source), weaponName))
        end
    end
end)