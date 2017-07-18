--[[Register]]--
RegisterNetEvent("vehiclesshop:getvehicles")
RegisterNetEvent('vehiclesshop:Spawnvehicles')
RegisterNetEvent('vehiclesshop:Storevehicles')
RegisterNetEvent('vehiclesshop:Selvehicles')

--[[Local/Global]]--

vehicless = {}

local vente_location = {1203.8988037109,-3117.4606933594, 4.040322303772} -- a definir

local vehiclesports = {
	{name="Garage", colour=2, id=50, x=-231.83854675293, y=-1169.0726318359, z=22.011341018677, axe = 120.000},
}

vehiclesportsSelected = { {x=nil, y=nil, z=nil}, }

function Menuvehicles()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Parke Auto","Rentrervehiclesco",nil)
    Menu.addButton("Hole Auto","Listevehiclesco",nil)
    Menu.addButton("Schließen","CloseMenu",nil) 
end

function Rentrervehiclesco()
	TriggerServerEvent('vehiclesshop:CheckForvehicles',source)
	CloseMenu()
end

function Listevehiclesco()
    ped = GetPlayerPed(-1);
    MenuTitle = "Autos"
    ClearMenu()
    for ind, value in pairs(vehiclesCOS) do
            Menu.addButton(tostring(value.vehicles_name) .. " : " .. tostring(value.vehicles_state), "Optionvehicles", value.id)
    end    
    Menu.addButton("Zurück","Menuvehicles",nil)
end

function Optionvehicles(vehiclesID)
	local vehiclesID = vehiclesID
    MenuTitle = "Options"
    ClearMenu()
    Menu.addButton("Holen", "Spawn", vehiclesID)
    Menu.addButton("Zurück", "Listevehiclesco", nil)
end

function Spawn(vehiclesID)
	local vehiclesID = vehiclesID
	TriggerServerEvent('vehiclesshop:CheckForSpawnvehicles', vehiclesID)
	CloseMenu()
end


---Generic Fonction

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function CloseMenu()
    Menu.hidden = true
end

function LocalPed()
	return GetPlayerPed(-1)
end

function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

--[[Citizen]]--

--dock
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, vehiclesport in pairs(vehiclesports) do
			DrawMarker(1, vehiclesport.x, vehiclesport.y, vehiclesport.z, 0, 0, 0, 0, 0, 0, 5.001, 5.0001, 1.1001, 0, 155, 255, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(vehiclesport.x, vehiclesport.y, vehiclesport.z, GetEntityCoords(LocalPed())) < 10 and IsPedInAnyVehicle(LocalPed(), true) == false then
				drawTxt('Drücke ~g~E~s~ Um das Menü zu Öffnen',0,1,0.5,0.8,0.6,255,255,255,255)
				if IsControlJustPressed(1, 86) then
					vehiclesportsSelected.x = vehiclesport.x
					vehiclesportsSelected.y = vehiclesport.y
					vehiclesportsSelected.z = vehiclesport.z
					vehiclesportsSelected.axe = vehiclesport.axe
					Menuvehicles()
					Menu.hidden = not Menu.hidden 
				end
				Menu.renderGUI() 
			end
		end
	end
end)

--closmenurange
Citizen.CreateThread(function()
	while true do
		local near = false
		Citizen.Wait(0)
		for _, vehiclesport in pairs(vehiclesports) do		
			if (GetDistanceBetweenCoords(vehiclesport.x, vehiclesport.y, vehiclesport.z, GetEntityCoords(LocalPed())) < 10 and near ~= true) then 
				near = true							
			end
		end
		if near == false then 
			Menu.hidden = true;
		end
	end
end)

--blips
Citizen.CreateThread(function()
    for _, item in pairs(vehiclesports) do
		item.blip = AddBlipForCoord(item.x, item.y, item.z)
		SetBlipSprite(item.blip, item.id)
		SetBlipAsShortRange(item.blip, true)
		SetBlipColour(item.blip, item.colour)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(item.name)
		EndTextCommandSetBlipName(item.blip)
    end
end)


--vente
Citizen.CreateThread(function()
	local loc = vente_location
	local pos = vente_location
	local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	SetBlipSprite(blip,207)
	SetBlipColour(blip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Auto Verkauf')
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip,true)
	SetBlipAsMissionCreatorBlip(blip,true)
	checkgarage = 0
	while true do
		Wait(0)
		DrawMarker(1,vente_location[1],vente_location[2],vente_location[3],0,0,0,0,0,0,5.001,5.0001,1.5001,0,155,255,200,0,0,0,0)
		if GetDistanceBetweenCoords(vente_location[1],vente_location[2],vente_location[3],GetEntityCoords(LocalPed())) < 5 and IsPedInAnyVehicle(LocalPed(), true) == false then
			drawTxt('Drücke ~g~E~s~ um ein Auto zu Verkaufen',0,1,0.5,0.8,0.6,255,255,255,255)
			if IsControlJustPressed(1, 86) then
				TriggerServerEvent('vehiclesshop:CheckForSelvehicles',source)
			end
		end
	end
end)



--[[Events]]--

AddEventHandler("vehiclesshop:getvehicles", function(THEvehiclesCOS)
    vehiclesCOS = {}
    vehiclesCOS = THEvehiclesCOS
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("vehiclesshop:CheckvehiclesportForvehicles")
end)
--AddEventHandler('vehiclesshop:Spawnvehicles', function(vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor) ORGINAL FILE
AddEventHandler('vehiclesshop:Spawnvehicles', function(vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, mod0, mod1, mod2, mod3, mod4, mod5, mod6, mod7, mod8, mod9, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17, mod18, mod19, mod20, mod21, mod22, mod23, mod24, windowtint, wheeltype)
    --print("USER:" .. player .. " MODS:" .. vehicles .. "|" .. plate .. "|" .. state .. "|" .. primarycolor ..  "|" .. secondarycolor .. "|" .. pearlescentcolor .. "|" .. wheelcolor .. "|" .. mod0 .. "|" .. mod1 .. "| " .. mod2 ..  "|" .. mod3 .. "|" .. mod4 .. "|" .. mod5 .. "|" .. mod6 .. "|" .. mod7 .. "|" .. mod8 .. "|" .. mod9 .. "|" .. mod10 .. "|" .. mod11 .. "|" .. mod12 .. "|" .. mod13 .. "|" .. mod14 .. "|" .. mod15 .. "|" .. mod16 .. "|" .. mod17 .. "|" .. mod18 .. "|" .. mod19 .. "|" .. mod20 .. "|" .. mod21 .. "|" .. mod22 .. "|" .. mod23 ..  "|" .. mod24 .. "|" .. windowtint ..  "|" .. wheeltype .. "|")

	local vehicles = vehicles
	local car = GetHashKey(vehicles)
	local plate = plate
	local state = state
	--local primarycolor = tonumber(primarycolor)
	--local secondarycolor = tonumber(secondarycolor)
	--local pearlescentcolor = tonumber(pearlescentcolor)
	--local wheelcolor = tonumber(wheelcolor)
	--TUNINGADDON#############################################
			local primarycolor = tonumber(primarycolor)
			local secondarycolor = tonumber(secondarycolor)
			local pearlescentcolor = tonumber(pearlescentcolor)
			local wheelcolor = tonumber(wheelcolor)
			local windowtint = tonumber(windowtint)
			local wheeltype = tonumber(wheeltype)
			local mod0 = tonumber(mod0)
			local mod1 = tonumber(mod1)
			local mod2 = tonumber(mod2)
			local mod3 = tonumber(mod3)
			local mod4 = tonumber(mod4)
			local mod5 = tonumber(mod5)
			local mod6 = tonumber(mod6)
			local mod7 = tonumber(mod7)
			local mod8 = tonumber(mod8)
			local mod9 = tonumber(mod9)
			local mod10 = tonumber(mod10)
			local mod11 = tonumber(mod11)
			local mod12 = tonumber(mod12)
			local mod13 = tonumber(mod13)
			local mod14 = tonumber(mod14)
			local mod15 = tonumber(mod15)
			local mod16 = tonumber(mod16)
			local mod17 = tonumber(mod17)
			local mod18 = tonumber(mod18)
			local mod19 = tonumber(mod19)
			local mod20 = tonumber(mod20)
			local mod21 = tonumber(mod21)
			local mod22 = tonumber(mod22)
			local mod23 = tonumber(mod23)
			local mod24 = tonumber(mod24)     
			local primarycolor = tonumber(primarycolor)
			local secondarycolor = tonumber(secondarycolor)
			local pearlescentcolor = tonumber(pearlescentcolor)
			local wheelcolor = tonumber(wheelcolor)
--###########################################################for Test
	Citizen.CreateThread(function()
		Citizen.Wait(3000)
		local caisseo = GetClosestVehicle(vehiclesportsSelected.x, vehiclesportsSelected.y, vehiclesportsSelected.z, 3.000, 0, 70)
		if DoesEntityExist(caisseo) then
			drawNotification("Das Gebiet ist voll.!") 
		else
			if state == "Draußen" then
				drawNotification("Nicht Geparkt.!")
			else
				local mods = {}
				for i = 0,24 do
					mods[i] = GetVehicleMod(veh,i)
				end
				RequestModel(car)
				while not HasModelLoaded(car) do
				Citizen.Wait(0)
				end
				veh = CreateVehicle(car, vehiclesportsSelected.x, vehiclesportsSelected.y, vehiclesportsSelected.z, vehiclesportsSelected.axe, true, false)
				for i,mod in pairs(mods) do
					SetVehicleModKit(veh,0)
					--SetVehicleMod(veh,i,mod)
					SetVehicleMod(veh, 0, mod0)
					SetVehicleMod(veh, 1, mod1)
					SetVehicleMod(veh, 2, mod2)
					SetVehicleMod(veh, 3, mod3)
					SetVehicleMod(veh, 4, mod4)
					SetVehicleMod(veh, 5, mod5)
					SetVehicleMod(veh, 6, mod6)
					SetVehicleMod(veh, 7, mod7)
					SetVehicleMod(veh, 8, mod8)
					SetVehicleMod(veh, 9, mod9)
					SetVehicleMod(veh, 10, mod10)
					SetVehicleMod(veh, 11, mod11)
					SetVehicleMod(veh, 12, mod12)
					SetVehicleMod(veh, 13, mod13)
					SetVehicleMod(veh, 14, mod14)
					SetVehicleMod(veh, 15, mod15)
					SetVehicleMod(veh, 16, mod16)
					if mod18 == "1" then
						ToggleVehicleMod(veh, 18, true)
					else
						ToggleVehicleMod(veh, 18, false)
					end
					if tiresmoke == "1" then
						ToggleVehicleMod(veh, 20, true)
					else
						ToggleVehicleMod(veh, 20, false)
					end
					if mod22 == "1" then
						ToggleVehicleMod(veh, 22, true)
					else
						ToggleVehicleMod(veh, 22, false)
					end
						--SetVehicleWheelType(veh, tonumber(wheeltype))
						SetVehicleMod(veh, 23, mod23)
						SetVehicleMod(veh, 24, mod24)
				end
				SetVehicleNumberPlateText(veh, plate)
				SetVehicleOnGroundProperly(veh)
				SetVehicleHasBeenOwnedByPlayer(veh,true)
				local id = NetworkGetNetworkIdFromEntity(veh)
				SetNetworkIdCanMigrate(id, true)
				SetVehicleColours(veh, primarycolor, secondarycolor)
				SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
				SetEntityInvincible(veh, false) 
				drawNotification("Gute Fahrt.!")				
				TriggerServerEvent('vehiclesshop:SetvehiclesOut', vehicles, plate)
   				TriggerServerEvent("vehiclesshop:CheckvehiclesportForvehicles")
			end
		end
	end)
end)

AddEventHandler('vehiclesshop:Storevehicles', function(vehicles, plate)
	local vehicles = GetHashKey(vehicles)	
	local plate = plate
	Citizen.CreateThread(function()
		Citizen.Wait(3000)
		local caissei = GetClosestVehicle(vehiclesportsSelected.x, vehiclesportsSelected.y, vehiclesportsSelected.z, 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)		
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then	
			if plate ~= platecaissei then						
				drawNotification("Parke Auto")
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				drawNotification("Auto geparkt")
				TriggerServerEvent('vehiclesshop:SetvehiclesIn', plate)
				TriggerServerEvent("vehiclesshop:CheckvehiclesportForvehicles")
					  TriggerServerEvent('vehiclesshop:UpdateVeh', plate, plateindex,primarycolor,secondarycolor,pearlescentcolor,wheelcolor,windowtint,wheeltype,mods0,mods1,mods2,mods3,mods4,mods5,mods6,mods7,mods8,mods9,mods10,mods11,mods12,mods13,mods14,mods15,mods16,turbo,tiresmoke,mods23,mods24)
			end
		else
			drawNotification("Kein Auto in der Nähe.!") 
			end
	end)
end)

AddEventHandler('vehiclesshop:Selvehicles', function(vehicles, plate)
	local vehicles = GetHashKey(vehicles)	
	local plate = plate
	Citizen.CreateThread(function()		
		Citizen.Wait(0)
		local caissei = GetClosestVehicle(vente_location[1],vente_location[2],vente_location[3], 5.000, 1, 12294)
		SetEntityAsMissionEntity(caissei, true, true)
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then
			if plate ~= platecaissei then
				drawNotification("Lade Autos")
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				TriggerServerEvent('vehiclesshop:Selvehicles', vehiclesco)
				TriggerServerEvent("vehiclesshop:CheckvehiclesportForvehicles")
			end
		else
			drawNotification("Kein Auto in der Nähe.!")
		end
	end)
end)

local firstspawn = 0

AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		RemoveIpl('v_carshowroom')
		RemoveIpl('shutter_open')
		RemoveIpl('shutter_closed')
		RemoveIpl('shr_int')
		RemoveIpl('csr_inMission')
		RequestIpl('v_carshowroom')
		RequestIpl('shr_int')
		RequestIpl('shutter_closed')
		firstspawn = 1
	end
end)
