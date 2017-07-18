require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "five_m_online", "root", "")

local max_number_weapons = 20 --maximum number of weapons that the player can buy. Weapons given at spawn doesn't count.
local cost_ratio = 100 --Ratio for withdrawing the weapons. This is price/cost_ratio = cost.

RegisterServerEvent('CheckMoneyForWea')
AddEventHandler('CheckMoneyForWea', function(weapon,price)
	TriggerEvent('es:getPlayerFromId', source, function(user)

		if (tonumber(user.money) >= tonumber(price)) then
			local player = user.identifier
			local nb_weapon = 0
			local executed_query = MySQL:executeQuery("SELECT * FROM user_weapons WHERE identifier = '@username'",{['@username'] = player})
			local result = MySQL:getResults(executed_query, {'weapon_model'}, "identifier")
			if result then
				for k,v in ipairs(result) do
					nb_weapon = nb_weapon + 1
				end
			end
			print(nb_weapon)
			if (tonumber(max_number_weapons) > tonumber(nb_weapon)) then
				user:removeMoney((price))
				MySQL:executeQuery("INSERT INTO user_weapons (identifier,weapon_model,withdraw_cost) VALUES ('@username','@weapon','@cost')",
				{['@username'] = player, ['@weapon'] = weapon, ['@cost'] = (price)/cost_ratio})
				TriggerClientEvent('FinishMoneyCheckForWea',source)
				TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Viel Spaß damit!\n")
			else
				TriggerClientEvent('ToManyWeapons',source)
				TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Maximale Waffen  ! (max: "..max_number_weapons..")\n")
			end
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Du hast nicht genug Geld !\n")
		end
	end)
end)

RegisterServerEvent("weaponshop:playerSpawned")
AddEventHandler("weaponshop:playerSpawned", function(spawn)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('weaponshop:GiveWeaponsToPlayer1', source)
	end)
end)
-- EXPERIMENTAL LOADING
RegisterServerEvent("weaponshop:GiveWeaponsToPlayer1")
AddEventHandler("weaponshop:GiveWeaponsToPlayer1", function(player)
	TriggerEvent('es:getPlayerFromId', player, function(user)
		local playerID = user.identifier
		local delay = nil
			
		local executed_query = MySQL:executeQuery("SELECT * FROM user_weapons WHERE identifier = '@username'",{['@username'] = playerID})
		local result = MySQL:getResults(executed_query, {'weapon_model','withdraw_cost'}, "identifier")
		delay = 6000
		if(result)then
			for k,v in ipairs(result) do
				if (tonumber(user.money) >= tonumber(v.withdraw_cost)) then
					TriggerClientEvent("giveWeapon", player, v.weapon_model, delay)
				else
					--TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Nicht Genug Geld!\n")
					return
				end
			end
			--TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Hier deine Knarren !\n")
		end
	
	end)
end)
-- EXPERIMENTAL LOADING

RegisterServerEvent("weaponshop:GiveWeaponsToPlayer")
AddEventHandler("weaponshop:GiveWeaponsToPlayer", function(player)
	TriggerEvent('es:getPlayerFromId', player, function(user)
		local playerID = user.identifier
		local delay = nil
			
		local executed_query = MySQL:executeQuery("SELECT * FROM user_weapons WHERE identifier = '@username'",{['@username'] = playerID})
		local result = MySQL:getResults(executed_query, {'weapon_model','withdraw_cost'}, "identifier")
		delay = 2000
		if(result)then
			for k,v in ipairs(result) do
				if (tonumber(user.money) >= tonumber(v.withdraw_cost)) then
					TriggerClientEvent("giveWeapon", player, v.weapon_model, delay)
					user:removeMoney((v.withdraw_cost))
				else
					TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Nicht Genug Geld!\n")
					return
				end
			end
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_ROBERTO", 1, "Roberto", false, "Hier deine Knarren !\n")
		end
	
	end)
end)
