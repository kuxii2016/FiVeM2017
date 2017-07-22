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
	{name="Garage", colour=2, id=50, x=-359.40548706055, y=6325.478515625, z=28.425603485107, axe = 30.000},
	{name="Garage", colour=2, id=50, x=-1396.2978515625, y=1118.7564697266, z=113.83769226074, axe = 120.000},
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

AddEventHandler('vehiclesshop:Spawnvehicles', function(vehicles, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, tyrecolor, mods)

	local vehicles = vehicles

	local tyrecolors = tyrecolor
    local tyre =  {}
    local localmods = mods
    for word in string.gmatch(tyrecolors, '([^,]+)') do
        table.insert(tyre, word)
    end
	local car = GetHashKey(vehicles)
	local plate = plate
	local state = state
	local primarycolor = tonumber(primarycolor)
	local secondarycolor = tonumber(secondarycolor)
	local pearlescentcolor = tonumber(pearlescentcolor)
	local wheelcolor = tonumber(wheelcolor)

	Citizen.CreateThread(function()			
		Citizen.Wait(3000)
		local caisseo = GetClosestVehicle(vehiclesportsSelected.x, vehiclesportsSelected.y, vehiclesportsSelected.z, 3.000, 0, 70)
		if DoesEntityExist(caisseo) then
			drawNotification("Kein Platz zum Spawnen.") 
		else
			if state == "Draußen" then
				drawNotification("Nicht Geparkt.!")
			else
				RequestModel(car)
				while not HasModelLoaded(car) do
				Citizen.Wait(0)
				end
				veh = CreateVehicle(car, vehiclesportsSelected.x, vehiclesportsSelected.y, vehiclesportsSelected.z, vehiclesportsSelected.axe, true, false)
                for k, v in pairs(localmods) do
                    local t = k - 1
                    SetVehicleModKit(veh,0)
                    SetVehicleMod(veh, tonumber(t), tonumber(v))
                    --Chat("Setting Mod # "..t.. " to value ".. v)
                end
                ToggleVehicleMod(veh,20,true)
                SetVehicleTyreSmokeColor(veh,tonumber(tyre[1]), tonumber(tyre[2]), tonumber(tyre[3]))
				SetVehicleNumberPlateText(veh, plate)
				SetVehicleOnGroundProperly(veh)
				SetVehicleHasBeenOwnedByPlayer(veh,true)
                --print(GetVehicleOwner(veh))
				local id = NetworkGetNetworkIdFromEntity(veh)
				SetNetworkIdCanMigrate(id, true)
				SetVehicleColours(veh, primarycolor, secondarycolor)
				SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
				SetEntityInvincible(veh, false) 
				drawNotification("Gute Fahrt.!")				
				TriggerServerEvent('vehiclesshop:SetvehiclesOut', vehicles, plate)
   				TriggerServerEvent("vehiclesshop:CheckvehiclesportForvehicles")
					local blip = AddBlipForEntity(veh)
					SetBlipSprite(blip,326)
					SetBlipColour(blip, 3)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString('Persönliches Fahrzeug')
					EndTextCommandSetBlipName(blip)
					veh_blip = blip
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
				drawNotification("Das ist nicht dein Auto")
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
		local caissei = GetClosestVehicle(vente_location[1],vente_location[2],vente_location[3], 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then
			if plate ~= platecaissei then
				drawNotification("~r~Das Auto Gehört dir Nicht!!.")
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				TriggerServerEvent('vehiclesshop:Selvehicles', vehiclesco)
				TriggerServerEvent("vehiclesshop:CheckvehiclesportForvehicles")
				drawNotification("~g~Verkauft!!.")
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
