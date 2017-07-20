--[[Info]]--
require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)
--[[Register]]--
RegisterServerEvent('vehiclesshop:CheckForSpawnvehicles')
RegisterServerEvent('vehiclesshop:CheckForvehicles')
RegisterServerEvent('vehiclesshop:SetvehiclesOut')
RegisterServerEvent('vehiclesshop:SetvehiclesIn')
RegisterServerEvent('vehiclesshop:PutvehiclesInvehiclesport')
RegisterServerEvent('vehiclesshop:CheckvehiclesportForvehicles')
RegisterServerEvent('vehiclesshop:CheckForSelvehicles')
RegisterServerEvent('vehiclesshop:Selvehicles')
RegisterServerEvent('UpdateVeh')

vehicless = {}


--###########################################################################UPDATED
AddEventHandler('vehiclesshop:CheckForSpawnvehicles', function(vehicles_id)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local vehicles_id = vehicles_id
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username' AND id = '@id'",
    {['@username'] = player, ['@id'] = vehicles_id})
    local result = MySQL:getResults(executed_query, {'vehicles_model', 'vehicles_plate', 'vehicles_state', 'vehicles_colorprimary', 'vehicles_colorsecondary', 'vehicles_pearlescentcolor', 'vehicles_wheelcolor' }, "identifier")
    if(result)then
      for k,v in ipairs(result)do
		vehicles = v.vehicles_model
        plate = v.vehicles_plate
        state = v.vehicles_state
        primarycolor = v.vehicles_colorprimary
        secondarycolor = v.vehicles_colorsecondary
        pearlescentcolor = v.vehicles_pearlescentcolor
        wheelcolor = v.vehicles_wheelcolor
	  local vehicles = vehicles
      local plate = plate
      local state = state      
      local primarycolor = primarycolor
      local secondarycolor = secondarycolor
      local pearlescentcolor = pearlescentcolor
      local wheelcolor = wheelcolor
      end
    end
	local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE vehicles_plate = '"..plate.."'")
    local result = MySQL:getResults(executed_query, {'vehicles_plate', 'tyresmoke','mod0', 'mod1','mod2','mod3','mod4','mod5','mod6','mod7','mod8','mod9','mod10','mod11','mod12','mod13','mod14','mod15','mod16','mod17','mod18','mod19','mod20','mod21','mod22','mod23','mod24' }, "id")
    local tyrecolor = nil
    print("FINDING SMOKE RESULT")
    print (result)
    local mods = {}
    if(result)then
        print("HAVE RESULT")
        for k,v in ipairs(result)do
            print("RESULT#: "..k.." VALUE: "..v)
            tyre = v.tyresmoke
            table.insert(mods, v.mod0)
            table.insert(mods, v.mod1)
            table.insert(mods, v.mod2)
            table.insert(mods, v.mod3)
            table.insert(mods, v.mod4)
            table.insert(mods, v.mod5)
            table.insert(mods, v.mod6)
            table.insert(mods, v.mod7)
            table.insert(mods, v.mod8)
            table.insert(mods, v.mod9)
            table.insert(mods, v.mod10)
            table.insert(mods, v.mod11)
            table.insert(mods, v.mod12)
            table.insert(mods, v.mod13)
            table.insert(mods, v.mod14)
            table.insert(mods, v.mod15)
            table.insert(mods, v.mod16)
            table.insert(mods, v.mod17)
            table.insert(mods, v.mod18)
            table.insert(mods, v.mod19)
            table.insert(mods, v.mod20)
            table.insert(mods, v.mod21)
            table.insert(mods, v.mod22)
            table.insert(mods, v.mod23)
            table.insert(mods, v.mod24)
            tyrecolor = tyre
        end
    end
    --TriggerClientEvent('vehiclesshop:Spawnvehicles', source, vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor,)
	TriggerClientEvent('vehiclesshop:Spawnvehicles', source, vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, tyrecolor, mods)
    end)
end)
--###########################################################################UPDATED

AddEventHandler('vehiclesshop:CheckForvehicles', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local state = "Draußen"
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username' AND vehicles_state ='@state'",
    {['@username'] = player, ['@vehicles'] = vehicles, ['@state'] = state})
    local result = MySQL:getResults(executed_query, {'vehicles_model', 'vehicles_plate'})
    if(result)then
      for k,v in ipairs(result)do
        vehicles = v.vehicles_model
        plate = v.vehicles_plate
      local vehicles = vehicles
      local plate = plate
      end
    end
    TriggerClientEvent('vehiclesshop:Storevehicles', source, vehicles, plate)
  end)
end)

AddEventHandler('vehiclesshop:SetvehiclesOut', function(vehicles, plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local vehicles = vehicles
    local state = "Draußen"
    local plate = plate

    local executed_query = MySQL:executeQuery("UPDATE user_vehicles SET vehicles_state='@state' WHERE identifier = '@username' AND vehicles_plate = '@plate' AND vehicles_model = '@vehicles'",
      {['@username'] = player, ['@vehicles'] = vehicles, ['@state'] = state, ['@plate'] = plate})
  end)
end)
-- AUTOS PARKEN
AddEventHandler('vehiclesshop:SetvehiclesIn', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local plate = plate
    local state = "Geparkt"
    local executed_query = MySQL:executeQuery("UPDATE user_vehicles SET vehicles_state='@state' WHERE identifier = '@username' AND vehicles_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
  end)
 end)
-- AUTOS PARKEN


AddEventHandler('vehiclesshop:PutvehiclesInvehiclesport', function(vehicles)
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.identifier
    local state ="Geparkt"

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'identifier'})

    if(result)then
      for k,v in ipairs(result)do
        joueur = v.identifier
        local joueur = joueur
       end
    end

    if joueur ~= nil then

      local executed_query = MySQL:executeQuery("UPDATE user_vehicles SET `vehicles_state`='@state' WHERE identifier = '@username'",
      {['@username'] = player, ['@state'] = state})

    end
  end)
end)

AddEventHandler('vehiclesshop:CheckvehiclesportForvehicles', function()
  vehicless = {}
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier  
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'id','vehicles_model', 'vehicles_name', 'vehicles_state'})
    if (result) then
        for _, v in ipairs(result) do
            t = { ["id"] = v.id, ["vehicles_model"] = v.vehicles_model, ["vehicles_name"] = v.vehicles_name, ["vehicles_state"] = v.vehicles_state}
            table.insert(vehicless, tonumber(v.id), t)
        end
    end
  end)  
    TriggerClientEvent('vehiclesshop:getvehicles', source, vehicless)
end)

AddEventHandler('vehiclesshop:CheckForSelvehicles', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local state = "Draußen"
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username' AND vehicles_state ='@state'",
    {['@username'] = player, ['@vehicles'] = vehicles, ['@state'] = state})
    local result = MySQL:getResults(executed_query, {'vehicles_model', 'vehicles_plate'})
    if(result)then
      for k,v in ipairs(result)do
        vehicles = v.vehicles_model
        plate = v.vehicles_plate
      local vehicles = vehicles
      local plate = plate
      end
    end
    TriggerClientEvent('vehiclesshop:Selvehicles', source, vehicles, plate)
  end)
end)


AddEventHandler('vehiclesshop:Selvehicles', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local plate = plate

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username' AND vehicles_plate ='@plate'",
    {['@username'] = player, ['@vehicles'] = vehicles, ['@plate'] = plate})
    local result = MySQL:getResults(executed_query, {'vehicles_price'})
    if(result)then
      for k,v in ipairs(result)do
        price = v.vehicles_price
      local price = price / 2
      user:addMoney((price))
      end
    end
    local executed_query = MySQL:executeQuery("DELETE from user_vehicles WHERE identifier = '@username' AND vehicles_plate = '@plate'",
    {['@username'] = player, ['@plate'] = plate})
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Verkauft")
  end)
end)

AddEventHandler('playerConnecting', function()
	local player_state = 1
	local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE player_state = '@player_state'",
      {['@player_state'] = player_state})
	local result = MySQL:getResults(executed_query, {'player_state'})
	if (result) then
		for i,v in ipairs(result) do
			sum = sum + v.player_state
		end
	else
		sum = 0
	end
	if (sum < 1) then
		local old_state = "Draußen"
		local state = "Geparkt"
		local executed_query = MySQL:executeQuery("UPDATE user_vehicles SET `vehicles_state`='@state' WHERE vehicles_state = '@old_state'",
		{['@old_state'] = old_state, ['@state'] = state})
	end
end)

AddEventHandler('VehUpdateTyreSmoke', function(plate, colorR, colorG, colorB)
    local cr =  colorR
    local cg = colorG
    local cb = colorB
    local plate = plate
    local executed_query = MySQL:executeQuery("update user_vehicles set tyresmoke='"..cr..","..cg..","..cb.."' where vehicles_plate='"..plate.."'" )
end)


AddEventHandler('UpdateVeh', function(plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, mods)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local mods = mods
    local player = user.identifier
    local name = name
    local price = price
    local vehicles = vehicles
    local plate = plate
    local state = "Draußen"
    local primarycolor = primarycolor
    local secondarycolor = secondarycolor
    local pearlescentcolor = pearlescentcolor
    local wheelcolor = wheelcolor
    local executed_query = MySQL:executeQuery("update user_vehicles Set vehicles_colorprimary='@primarycolor', vehicles_colorsecondary='@secondarycolor', vehicles_pearlescentcolor='@pearlescentcolor', vehicles_wheelcolor='@wheelcolor' where vehicles_plate='@plate'",
    {['@username'] = player, ['@name'] = name, ['@vehicles'] = vehicles, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor})
    for i,t in pairs(mods) do
        print('Versuche, Mods zu aktualisieren')
        if t.mod ~= nil then
           print("Mod#: "..i.." Wert: " .. t.mod)
           local executed_query = MySQL:executeQuery("update user_vehicles set mod"..i.."='"..t.mod.."' where vehicles_plate='"..plate.."'" )
        end
	end
  end)
end)
