local enableCruise = false
Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )   
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(ped, false)
		local vehicleModel = GetEntityModel(vehicle)
		local speed = GetEntitySpeed(vehicle)
		local float Max = GetVehicleMaxSpeed(vehicleModel)
			if ( ped ) then
				if IsControlJustPressed(1, 288) then
					local inVehicle = IsPedSittingInAnyVehicle(ped)
					if (inVehicle) then
						if (GetPedInVehicleSeat(vehicle, -1) == ped) then
						--vehicle = GetVehiclePedIsIn(ped, false)
						--speed = GetEntitySpeed(vehicle)
							if enableCruise == false then
								SetEntityMaxSpeed(vehicle, speed)
							--SetVehicleForwardSpeed(vehicle, speed)
								TriggerEvent("chatMessage", "[Cruise Control: ]", {255, 255, 255}, "Cruise control AN, MAX speed".. math.floor(speed*3.6).."km/h")
								enableCruise = true
							else
							
								SetEntityMaxSpeed(vehicle, Max)
								TriggerEvent("chatMessage", "[Cruise Control: ]", {255, 255, 255}, "Cruise control AUS, MAX speed".. math.floor(Max*3.6).. "km/h")
								enableCruise = false
							end
						else
							TriggerEvent("ChatMessage", "[Cruise Control: ]", {255, 255, 255}, "Du musst dazu Fahren" )
						end
					end
				end
			end
		end
end)