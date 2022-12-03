local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

local plz = json.decode(LoadResourceFile(GetCurrentResourceName(), "postals.json"))

RegisterCommand("gps", function(source, args, rawCommands)
    if source ~= 0 then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if args[1] == nil then return xPlayer.showNotification("Keine Postleitzahl angegeben") end
        if tonumber(args[1]) == nil then return xPlayer.showNotification("Keine Postleitzahl angegeben") end
        local coords
        for k, v in pairs(plz) do
            if v.code == args[1] then 
                coords = true
                TriggerClientEvent("tl_gps:setWaypoint", source, v.x, v.y)
                xPlayer.showNotification("Wegpunkt gesetzt")
                break
            end
        end
        if coords == nil then return xPlayer.showNotification("Postleitzahl nicht gefunden") end
    else
        print("Du kannst diesen Command nicht von der Console ausführen")
    end
end)
