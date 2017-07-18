--Version 1.4
RegisterNetEvent('projectEZ:notify')
RegisterNetEvent("projectEZ:spawnlaspos")

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local AutoSaveEnabled = true -- Active automatic backup // true = automatic backup // false = manual backup
local TimerAutoSave = 60000 -- Duration between each saving of the position in automatic mode // 60000 = 60 seconds
local TimerManualSave = 60000 -- Waiting time before you can save the player position again in Manual mode // 60000 = 60 seconds
local firstspawn = 0 -- Do not touch

--Player notification
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

function RequestToSave()
	--Recovering the x, y, z position of the player
	LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	--Recovery of player azimuth
	local LastPosH = GetEntityHeading(GetPlayerPed(-1))
	--Sending data to server
	TriggerServerEvent("projectEZ:savelastpos", LastPosX , LastPosY , LastPosZ, LastPosH)
	if not origin then
		--Display of a message confirming the saving of the position of the players.
		--Notify("Position saved")
	end
end

--Auto-save function for player position
function Saver()
	--Thread Loop sends the position every x seconds to the server to perform the backup
	Citizen.CreateThread(function ()
		while true do
			if AutoSaveEnabled then
				--Duration between each request
				Citizen.Wait(TimerAutoSave)
				--Sending data to server
				RequestToSave()
			else
				Citizen.Wait(0)
				if IsControlJustPressed(1, Keys["."])  then
				--Sending the data to the sender of the data to the server
				RequestToSave()
				Citizen.Wait(TimerManualSave)
				end
			end	
		end
	end)
end

--Event that allows the server to send a notification to the player
RegisterNetEvent('projectEZ:notify')
AddEventHandler('projectEZ:notify', function(alert)
    if not origin then
        Notify(alert)
    end
end)

--Event for the player's spawn to the last known position
AddEventHandler("projectEZ:spawnlaspos", function(PosX, PosY, PosZ)
	SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
	if not origin then
		--Notify("Geladen")
    end
	Saver()
end)

--Action at the player's spawn
AddEventHandler('playerSpawned', function(spawn)
	--We verify that it is indeed the first spawn of the player
	if firstspawn == 0 then
		TriggerServerEvent("projectEZ:SpawnPlayer")
		firstspawn = 1
	end
end)