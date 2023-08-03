local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

local plz = json.decode(LoadResourceFile(GetCurrentResourceName(), "postals.json"))

RegisterCommand("gps", function(source, args, rawCommands)
    if source == 0 then return print("You cannot use this command from the console") end

    local xPlayer = ESX.GetPlayerFromId(source)
    if args[1] == nil then return xPlayer.showNotification("No zipcode given") end
    if tonumber(args[1]) == nil then return xPlayer.showNotification("No zipcode given") end
    local coords
    for k, v in pairs(plz) do
        if v.code == args[1] then 
            coords = true
            TriggerClientEvent("tl_gps:setWaypoint", source, v.x, v.y)
            xPlayer.showNotification("Waypoint set")
            break
        end
    end
    if coords == nil then return xPlayer.showNotification("Zipcode not found") end
end)
