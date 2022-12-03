local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

local postLeitZahl = LoadResourceFile(GetCurrentResourceName(), "postals.json")
local plz = json.decode(postLeitZahl)

RegisterCommand("gps", function(source, args, rawCommands)
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
end)