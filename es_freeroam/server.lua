RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	TriggerClientEvent('es_freeroam:spawnPlayer', source, spawnCoords.x, spawnCoords.y, spawnCoords.z)
end)

AddEventHandler('es:playerLoaded', function(source)
	-- Get the players money amount
	TriggerEvent("es:getPlayerFromId", source, function(user)
	user:setMoney((user.money))
	end)
end)

RegisterServerEvent('mission:completed')
AddEventHandler('mission:completed', function(total)
TriggerEvent('es:getPlayerFromId', source, function(user)
  user:addMoney((total))
 TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Du bekommst ~g~$".. tonumber(total))
 end)
end)

RegisterServerEvent('es_freeroam:pay')
AddEventHandler('es_freeroam:pay', function(amount)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if(user.money > amount) then
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Transfer is ~g~Fertig.")
			user:removeMoney((amount))
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Transfer ~r~abgelehnt.")
		end
	end)
end)
