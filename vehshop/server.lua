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
RegisterServerEvent('vehiclesshop:UpdateVeh')

vehicless = {}

AddEventHandler('vehiclesshop:CheckForSpawnvehicles', function(vehicles_id)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local vehicles_id = vehicles_id
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicles WHERE identifier = '@username' AND ID = '@ID'",
    {['@username'] = player, ['@ID'] = vehicles_id})
    local result = MySQL:getResults(executed_query, {'vehicles_model', 'vehicles_plate', 'vehicles_state', 'vehicles_colorprimary', 'vehicles_colorsecondary', 'vehicles_pearlescentcolor', 'vehicles_wheelcolor', 'mod0', 'mod1', 'mod2', 'mod3', 'mod4', 'mod5', 'mod6', 'mod7', 'mod8', 'mod9', 'mod10', 'mod11', 'mod12', 'mod13', 'mod14', 'mod15', 'mod16', 'mod17', 'mod18', 'mod19', 'mod20', 'mod21', 'mod22', 'mod23', 'mod24' ,'windowtint', 'wheeltype'})
    if(result)then
      for k,v in ipairs(result)do
		vehicles = v.vehicles_model
        plate = v.vehicles_plate
        state = v.vehicles_state
        primarycolor = v.vehicles_colorprimary
        secondarycolor = v.vehicles_colorsecondary
        pearlescentcolor = v.vehicles_pearlescentcolor
        wheelcolor = v.vehicles_wheelcolor
		mod0 = v.vehicle_mod0
		mod1 = v.vehicle_mod1
		mod2 = v.vehicle_mod2
		mod3 = v.vehicle_mod3
		mod4 = v.vehicle_mod4
		mod5 = v.vehicle_mod5
		mod6 = v.vehicle_mod6
		mod7 = v.vehicle_mod7
		mod8 = v.vehicle_mod8
		mod9 = v.vehicle_mods9
		mod10 = v.vehicle_mod10
		mod11 = v.vehicle_mod11
		mod12 = v.vehicle_mod12
		mod13 = v.vehicle_mod13
		mod14 = v.vehicle_mod14
		mod15 = v.vehicle_mod15
		mod16 = v.vehicle_mod16
		mod17 = v.vehicle_mod17
		mod18 = v.vehicle_mod18
		mod19 = v.vehicle_mod19
		mod20 = v.vehicle_mod20
		mod21 = v.vehicle_mod21
		mod22 = v.vehicle_mod22
		mod23 = v.vehicle_mod23
		mod24 = v.vehicle_mod24
		wheeltype = v.vehicle_wheeltype

--[[    
			local plate = v.vehicle_plate
			local state = v.vehicle_state
			local primarycolor = tonumber(v.vehicle_primarycolor)
			local secondarycolor = tonumber(v.vehicle_secondarycolor)
			local pearlescentcolor = tonumber(v.vehicle_pearlescentcolor)
			local wheelcolor = tonumber(v.vehicle_wheelcolor)
			local wheeltype = tonumber(v.vehicle_wheeltype)
			local windowtint = tonumber(v.vehicle_windowtint)
			local mod0 = tonumber(v.vehicle_mod0)
			local mod1 = tonumber(v.vehicle_mod1)
			local mod2 = tonumber(v.vehicle_mod2)
			local mod3 = tonumber(v.vehicle_mod3)
			local mod4 = tonumber(v.vehicle_mod4)
			local mod5 = tonumber(v.vehicle_mod5)
			local mod6 = tonumber(v.vehicle_mod6)
			local mod7 = tonumber(v.vehicle_mod7)
			local mod8 = tonumber(v.vehicle_mod8)
			local mod9 = tonumber(v.vehicle_mod9)
			local mod10 = tonumber(v.vehicle_mod10)
			local mod11 = tonumber(v.vehicle_mod11)
			local mod12 = tonumber(v.vehicle_mod12)
			local mod13 = tonumber(v.vehicle_mod13)
			local mod14 = tonumber(v.vehicle_mod14)
			local mod15 = tonumber(v.vehicle_mod15)
			local mod16 = tonumber(v.vehicle_mod16)
			local mod17 = tonumber(v.vehicle_mod17)
			local mod18 = tonumber(v.vehicle_mod18)
			local mod19 = tonumber(v.vehicle_mod19)
			local mod20 = tonumber(v.vehicle_mod20)
			local mod21 = tonumber(v.vehicle_mod21)
			local mod22 = tonumber(v.vehicle_mod22)
			local mod23 = tonumber(v.vehicle_mod23)
			local mod24 = tonumber(v.vehicle_mod24)
--]]
      local vehicles = vehicle
      local plate = plate
      local state = state      
      local primarycolor = primarycolor
      local secondarycolor = secondarycolor
      local pearlescentcolor = pearlescentcolor
      local wheelcolor = wheelcolor
	  local mod0 = mod0
	  local mod1 = mod1
	  local mod2 = mod2
	  local mod3 = mod3
	  local mod4 = mod4
	  local mod5 = mod5
	  local mod6 = mod6
	  local mod7 = mod7
	  local mod8 = mod8
	  local mod9 = mods9
	  local mod10 = mod10
	  local mod11 = mod11
	  local mod12 = mod12
	  local mod13 = mod13
	  local mod14 = mod14
	  local mod15 = mod15
	  local mod16 = mod16
	  local mod17 = mod17
	  local mod18 = mod18
	  local mod19 = mod19
	  local mod20 = mod20
	  local mod21 = mod21
	  local mod22 = mod22
	  local mod23 = mod23
	  local mod24 = mod24
	  local wheeltype = wheeltype
 
	  	  print("USER:" .. player .. " MODS:" .. vehicles .. "|" .. plate .. "|" .. state .. "|" .. primarycolor ..  "|" .. secondarycolor .. "|" .. pearlescentcolor .. "|" .. wheelcolor .. "|" .. mod0 .. "|" .. mod1 .. "|" .. mod2 ..  "|" .. mod3 .. "|" .. mod4 .. "|" .. mod5 .. "|" .. mod6 .. "|" .. mod7 .. "|" .. mod8 .. "|" .. mod9 .. "|" .. mod10 .. "|" .. mod11 .. "|" .. mod12 .. "|" .. mod13 .. "|" .. mod14 .. "|" .. mod15 .. "|" .. mod16 .. "|" .. mod17 .. "|" .. mod18 .. "|" .. mod19 .. "|" .. mod20 .. "|" .. mod21 .. "|" .. mod22 .. "|" .. mod23 ..  "|" .. mod24 .. "|" .. windowtint ..  "|" .. wheeltype .. "|")
--###########################################################for Test
      end
    end
    TriggerClientEvent('vehiclesshop:Spawnvehicles', source, vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, mod0, mod1, mod2, mod3, mod4, mod5, mod6, mod7, mod8, mod9, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17, mod18, mod19, mod20, mod21, mod22, mod23, mod24, windowtint, wheeltype)
	--TriggerClientEvent('vehiclesshop:Spawnvehicles', source, vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor,) ORGINAL FILE
 end)
end)

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
