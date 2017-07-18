fuel = math.random(1.19, 1.55) -- Fuel Cost, random from 1.19 to 1.55
local thisPed
local playerPed
function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)

	TriggerEvent('es:getPlayerFromId', source, function(user)
    local cost = fuel * amount
	if (tonumber(user.money) >= tonumber(cost)) then
	local player = user.identifier
	TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Kassierer", false, "Liter Kostet " .. fuel .. "$")
		user:removeMoney((round(cost)))
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Kassierer", false, "Bezahlt "  .. round(cost) ..  " $ für ".. round(amount) .. " L" )
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Kassierer", false, "Nicht Bezahlt?, Nicht gut! Ich ruf die Bullen..!!")
			TriggerClientEvent('es_freeroam:1', source)
		end
	end)
end)