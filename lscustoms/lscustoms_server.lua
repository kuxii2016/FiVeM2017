local sql = MySQL.open("127.0.0.1","root","","five_m_online") -- EDIT these values to the values of your sql servers


local tbl = {
				[1] = {locked = false},
				[2] = {locked = false},
				[3] = {locked = false},
				[4] = {locked = false},
			}
local paymentInfo = {}

RegisterServerEvent('lockGarage')
AddEventHandler('lockGarage', function(b,garage)
	tbl[tonumber(garage)].locked = b
	TriggerClientEvent('lockGarage',-1,tbl)
	print(json.encode(tbl))
end)

RegisterServerEvent('getGarageInfo')
AddEventHandler('getGarageInfo', function()
	TriggerClientEvent('lockGarage',-1,tbl)
	print(json.encode(tbl))
end)

RegisterServerEvent('UpdateVeh')
AddEventHandler('UpdateVeh', function(plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, mods)

	local mods = mods
    local primarycolor = primarycolor
    local secondarycolor = secondarycolor
    local pearlescentcolor = pearlescentcolor
    local wheelcolor = wheelcolor
		local id = string.sub(plate,7)
		print(id)
		if primarycolor then
			q_update = sql:prepare("update user_vehicles set vehicle_colorprimary ='".. primarycolor .."' where id='".. id .."'")
			q_update:execute()
		end
		if secondarycolor then
			q_update = sql:prepare("update user_vehicles set vehicle_colorsecondary ='".. secondarycolor .."' where id='".. id .."'")
			q_update:execute()
		end
		if pearlescentcolor  then
			q_update = sql:prepare("update user_vehicles set vehicle_pearlescentcolor ='".. pearlescentcolor .."' where id='".. id .."'")
			q_update:execute()
		end
		if wheelcolor then
			q_update = sql:prepare("update user_vehicles set vehicle_wheelcolor ='".. wheelcolor .."' where id='".. id .."'")
			q_update:execute()
		end

		for i,t in pairs(mods) do
        	print('Versuche, Mods zu aktualisieren')
        	if t.mod ~= nil then
           		print("Mod#: "..i.." Value: " .. t.mod)
			    local q_update = sql:prepare("update user_vehicles set mod"..i.." = '"..t.mod.."' where id='"..id.."'")
					  q_update:execute()
        	end
		end
end)

-- Payment Events
RegisterServerEvent('receivePaymentInfo')
AddEventHandler('receivePaymentInfo', function(modPrice)	
	TriggerEvent('es:getPlayerFromId', source, function(user)
	if (tonumber(user.money) >= tonumber(modPrice)) then
	local player = user.identifier
	local blockPurchase = false
	
 	--print("Player ID :" .. user_id .. " | Price : " .. modPrice .. " | Wallet : " .. wallet .. " | New Wallet : " .. nWallet) -- DEBUG message for jink

 	if paidAmount then
 		user:removeMoney((round(modPrice)))
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Lsc", false, "Danke für deinen Einkauf" )
 		print("Mod Gekauft" .. modPrice)
 	elseif not paidAmount then
 		local blockPurchase = not blockPurchase
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Lsc", false, "Nicht genug Geld.!" )
 		TriggerClientEvent('blockPurchase', blockPurchase)
 		print("Kein Geld")
 	end

end)
end)