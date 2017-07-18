require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent('vehiclesshop:CheckMoneyForvehicles')
RegisterServerEvent('vehiclesshop:BuyForvehicles')

AddEventHandler('vehiclesshop:CheckMoneyForvehicles', function(name, vehicles, price)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if (tonumber(user.money) >= tonumber(price)) then
      local player = user.identifier
      local vehicles = vehicles
      local name = name
      user:removeMoney((price))
      TriggerClientEvent('vehiclesshop:FinishMoneyCheckForvehicles',source, name, vehicles, price)
      TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Danke für den Kauf.!\n")
    else
      TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Sorry..!Kleiner dein Geld Reicht nicht!\n")
    end
  end)
end)

AddEventHandler('vehiclesshop:BuyForvehicles', function(name, vehicles, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
  TriggerEvent('es:getPlayerFromId', source, function(user)

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
    local executed_query = MySQL:executeQuery("INSERT INTO user_vehicles (`identifier`, `vehicles_name`, `vehicles_model`, `vehicles_price`, `vehicles_plate`, `vehicles_state`, `vehicles_colorprimary`, `vehicles_colorsecondary`, `vehicles_pearlescentcolor`, `vehicles_wheelcolor`) VALUES ('@username', '@name', '@vehicles', '@price', '@plate', '@state', '@primarycolor', '@secondarycolor', '@pearlescentcolor', '@wheelcolor')",
    {['@username'] = player, ['@name'] = name, ['@vehicles'] = vehicles, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor})
  end)
end)
