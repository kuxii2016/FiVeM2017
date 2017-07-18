AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
    exports.spawnmanager:setAutoSpawnCallback(function()
        if spawnLock then
            return
        end

        spawnLock = false

        TriggerServerEvent('playerSpawn')
        TriggerEvent('playerSpawn')
    
    end)
end)

RegisterNetEvent('es_freeroam:spawnPlayer')
AddEventHandler('es_freeroam:spawnPlayer', function(x, y, z)
    exports.spawnmanager:spawnPlayer({x = x, y = y, z = z})
end)

  AddEventHandler("playerSpawned", function(spawn)
    Citizen.CreateThread(function()
    while true do
      Wait(0)
      SetNotificationTextEntry("STRING");
      AddTextComponentString("Willkommen by ~g~Kuxiis!.\n ~y~Spiel hart aber Fair.!");
      SetNotificationMessage("CHAR_ALL_PLAYERS_CONF", "CHAR_ALL_PLAYERS_CONF", true, 1, "Kuxiis Mode", "v0.1.3");
      DrawNotification(false, true);
      Wait(10000000)
    end
 end)
   -- give the player some weapons
   --Citizen.CreateThread(function()
   --  GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), true, true)
   --end)
 end)

 RegisterNetEvent("es_freeroam:wanted")
 AddEventHandler("es_freeroam:wanted", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 0, 0)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)
 --Gesucht Level 1
 RegisterNetEvent("es_freeroam:1")
 AddEventHandler("es_freeroam:tanke", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 1, 1)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)
--Gesucht Level 2
  RegisterNetEvent("es_freeroam:2")
 AddEventHandler("es_freeroam:tanke", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 2, 2)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)
--Gesucht Level 3
  RegisterNetEvent("es_freeroam:3")
 AddEventHandler("es_freeroam:tanke", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 3, 3)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)
--Gesucht Level 4
  RegisterNetEvent("es_freeroam:4")
 AddEventHandler("es_freeroam:tanke", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 4, 4)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)
--Gesucht Level 5
  RegisterNetEvent("es_freeroam:5")
 AddEventHandler("es_freeroam:tanke", function()
   Citizen.CreateThread(function()
       SetPlayerWantedLevel(PlayerId(), 5, 5)
       SetPlayerWantedLevelNow(PlayerId(), 0)
     end)
 end)
  -- Display text
    RegisterNetEvent("es_freeroam:displaytext")
    AddEventHandler("es_freeroam:displaytext", function(text, time)
      ClearPrints()
    	SetTextEntry_2("STRING")
    	AddTextComponentString(text)
    	DrawSubtitleTimed(time, 1)
    end)

    -- Display notification
    RegisterNetEvent("es_freeroam:notify")
    AddEventHandler("es_freeroam:notify", function(icon, type, sender, title, text)
      Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING");
        AddTextComponentString(text);
        SetNotificationMessage(icon, icon, true, type, sender, title, text);
        DrawNotification(false, true);
      end)
    end)
