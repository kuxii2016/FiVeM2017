local planeModel = GetHashKey("luxor")
local pilotModel = GetHashKey("s_m_m_pilot_01")
local airplane
local pilot
local flying = false

  Citizen.CreateThread(function()
  while true do
  Citizen.Wait(0)
  playerPed = GetPlayerPed(-1)
  playerCoords = GetEntityCoords(GetPlayerPed(-1), true)

  DrawMarker(1, -1037.263, -2734.585, 12.142, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
  AirportDraw3DText(-1037.263, -2734.585, 12.142 +.500, "Fly to Mc Kenzie",7,0.3,0.2)
  AirportDraw3DText(-1037.263, -2734.585, 12.142 +.100, "Field",7,0.3,0.2)

  if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, -1037.263, -2734.585, 12.142) < 1.5 then
    if flying == false then
        -- Request the plane model
        RequestModel(planeModel)
        while not HasModelLoaded(planeModel) do
          Wait(1)
        end

        -- Request the pilot
        RequestModel(pilotModel)
        while not HasModelLoaded(pilotModel) do
          Wait(1)
        end

        flying = true

      -- flying = true
    elseif flying == true then
      -- Spawn the plane.
      airplane = CreateVehicle(planeModel, -1744.563, -2909.346, 13.944, 322.815, true, true)
      SetEntityAsMissionEntity(airplane, true, true)
      N_0x06faacd625d80caa(airplane)
      -- Teleport the pilots inside the plane.
      pilot = CreatePedInsideVehicle(airplane, 26, pilotModel, -1, 1, true)
      N_0x06faacd625d80caa(pilot)
      SetBlockingOfNonTemporaryEvents(pilot, true)

      -- Make the player enter the plane.
      TaskEnterVehicle(playerPed, airplane, 100, 0, 1.0, 1, 0)
      -- Let the plane fly to the destination.
      TaskPlaneMission(pilot, airplane, 0, 0, 1916.275, 4707.327, 39.83545, 4, 800.0, -1.0, -1.0, 900.0, 800.0)
      Wait(15000)
      SetVehicleLandingGear(airplane, 1)

      Wait(90000)
      TaskPlaneLand(pilot, airplane, 1917.368, 4707.804, 40.19184, 2001.851, 4746.581, 40.06049)
      SetEntityLoadCollisionFlag(airplane, true)
      RequestCollisionAtCoord(1944.88, 4720.528, 40.06041)

      Wait(35000)
      ClearPedTasks(pilot)
      SetPedAsNoLongerNeeded(pilot)

      TaskLeaveVehicle(playerPed, airplane)
      Wait(25000)

      Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(airplane))
          end
        end
      end
    end)

    function AirportDraw3DText(x, y, z, textInput, fontId, scaleX, scaleY)
      local px,py,pz=table.unpack(GetGameplayCamCoords())
      local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

      local scale = (1/dist)*20
      local fov = (1/GetGameplayCamFov())*100
      local scale = scale*fov

      SetTextScale(scaleX*scale, scaleY*scale)
      SetTextFont(fontId)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 150)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(2, 0, 0, 0, 150)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(textInput)
      SetDrawOrigin(x,y,z+2, 0)
      DrawText(0.0, 0.0)
      ClearDrawOrigin()
    end
