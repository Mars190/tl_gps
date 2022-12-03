RegisterNetEvent("tl_gps:setWaypoint")
AddEventHandler("tl_gps:setWaypoint", function(x, y)
    SetNewWaypoint(x, y)
end)