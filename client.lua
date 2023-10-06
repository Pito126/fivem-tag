local showTag = false
local adminRank = ""

RegisterNetEvent('displayAdminTag')
AddEventHandler('displayAdminTag', function(rank)
    showTag = not showTag
    adminRank = rank
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if showTag and adminRank then
            local playerId = PlayerId()
            local msg = adminRank
            local playerCoords = GetEntityCoords(GetPlayerPed(-1))

            if adminRank == "OWNER" then
                Draw3DText(playerCoords.x, playerCoords.y, playerCoords.z + 1, msg, 0, 0, 255) -- Blue
            elseif adminRank == "ADMIN" then
                Draw3DText(playerCoords.x, playerCoords.y, playerCoords.z + 1, msg, 255, 0, 0) -- Red
            elseif adminRank == "TRIAL ADMIN" then
                Draw3DText(playerCoords.x, playerCoords.y, playerCoords.z + 1, msg, 0, 255, 0) -- Greem
            end
        end
    end
end)

function Draw3DText(x, y, z, text, r, g, b)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.5, 0.5) -- Increase the size of the text here
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
