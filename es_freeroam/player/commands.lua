TriggerEvent("es:addGroup", "admin", "user", function(group) end)

--Help Commands
TriggerEvent('es:addCommand', 'help', function(source, args, user)
  TriggerClientEvent("chatMessage", source, "^3SYSTEM", {255, 255, 255}, "Player Commands ")
	TriggerClientEvent("chatMessage", source, "^3SYSTEM", {255, 255, 255}, "-------------------------------------------------------")
	TriggerClientEvent("chatMessage", source, "^3SYSTEM", {255, 255, 255}, "/pv - Get teleported in your personal vehicle")
	TriggerClientEvent("chatMessage", source, "^3SYSTEM", {255, 255, 255}, "/rmwanted - Remove your wanted level")
end)

TriggerEvent('es:addCommand', 'group', function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Group: ^2" .. user.group.group)
end)

-- Kicking
TriggerEvent('es:addGroupCommand', 'kick', "admin", function(source, args, user)
		if(GetPlayerName(tonumber(args[2])))then
			local player = tonumber(args[2])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)
				if(tonumber(target.permission_level) > tonumber(user.permission_level))then
					TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "Du hast keine Rechte!")
					return
				end

				local reason = args
				table.remove(reason, 1)
				table.remove(reason, 1)
				if(#reason == 0)then
					reason = "Kicked: Du wurdest vom Server Geschmissen"
				else
					reason = "Kicked: " .. table.concat(reason, " ")
				end

				TriggerClientEvent('chatMessage', -1, "SYSTEM", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 wurde gekickt(^2" .. reason .. "^0)")
				DropPlayer(player, reason)
			end)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Falsche Spieler ID!")
		end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Deine Rechte reichen nicht!")
end)


TriggerEvent('es:addCommand', 'rmwanted', function(source)
  TriggerEvent("es:getPlayerFromId", source, function(user)
    if(user.money > 10000) then
			user:removeMoney((10000))
			TriggerClientEvent('es_freeroam:wanted', source)
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Lester", false, "Das Paradise auf Erden")
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Lester", false, "Sorry.! Dafür reicht dein Geld nicht")
		end
	end)
end)
