local damaged = false
local AllowedWeapons = { -- i think only melee weapons
    GetHashKey("WEAPON_KNIFE"),
}

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        for k,v in pairs(AllowedWeapons) do
            if HasPedBeenDamagedByWeapon(playerPed, v, 0) and not damaged then
                damaged = true
                local animSet = "move_m@injured"
                while not HasAnimSetLoaded(animSet) do
                    RequestAnimSet(animSet)
                    Citizen.Wait(0)
                end
                SetPedMovementClipset(playerPed, animSet, true)
            end
        end
        Citizen.Wait(1)
    end
end)
