secondsToWait = 600              -- Seconds to wait between changing weather. 60 seconds to fully switch types
currentWeatherString = "CLEAR"   -- Starting Weather Type.
local SmartWeatherEnabled = true -- Should this script be enabled?


-- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING. CONTACT TheStonedTurtle IF ANYTHING IS BROKEN.
-- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING. CONTACT TheStonedTurtle IF ANYTHING IS BROKEN.
-- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING. CONTACT TheStonedTurtle IF ANYTHING IS BROKEN.
-- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING. CONTACT TheStonedTurtle IF ANYTHING IS BROKEN.
-- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING. CONTACT TheStonedTurtle IF ANYTHING IS BROKEN.
-- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOU ARE DOING. CONTACT TheStonedTurtle IF ANYTHING IS BROKEN.


-- Removed Neutral from possible weather options, had issue with it sometimes turning the sky green.
-- Removed XMAS from possible weather option as it blankets entire map with snow.
weatherTree = {
	["EXTRASUNNY"] = {"CLEAR","SMOG"},
	["SMOG"] = {"FOGGY","CLEAR","CLEARING","OVERCAST","CLOUDS","EXTRASUNNY"},
	["CLEAR"] = {"CLOUDS","EXTRASUNNY","CLEARING","SMOG","FOGGY","OVERCAST"},
	["CLOUDS"] = {"CLEAR","SMOG","FOGGY","CLEARING","OVERCAST","SNOW","SNOWLIGHT"},
	["FOGGY"] = {"CLEAR","CLOUDS","SMOG","OVERCAST"},
	["OVERCAST"] = {"CLEAR","CLOUDS","SMOG","FOGGY","RAIN","CLEARING"},
	["RAIN"] = {"THUNDER","CLEARING","SNOW","SNOWLIGHT","OVERCAST"},
	["THUNDER"] = {"RAIN","CLEARING","BLIZZARD"},
	["CLEARING"] = {"CLEAR","CLOUDS","OVERCAST","FOGGY","SMOG","RAIN","SNOWLIGHT"},
	["SNOW"] = {"BLIZZARD","RAIN","SNOWLIGHT"},
	["BLIZZARD"] = {"SNOW","SNOWLIGHT","THUNDER"},
	["SNOWLIGHT"] = {"SNOW","RAIN","CLEARING"},
}


windWeathers = {
	["OVERCAST"] = true,
	["RAIN"] = true,
	["THUNDER"] = true,
	["BLIZZARD"] = true,
	["XMAS"] = true,
	["SNOW"] = true,
	["CLOUDS"] = true
}


function getTableLength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1
	end
	return count
end

function getTableKeys(T)
	local keys = {}
	for k,v in pairs(T) do
		table.insert(keys,k)
	end
	return keys
end

function stringsplit(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t,str)
    end
    return t
end



currentWeatherData = {
	["weatherString"] = currentWeatherString,
	["windEnabled"] = false,
	["windHeading"] = 0
}


function updateWeatherString()
	local newWeatherString
	local windEnabled = false
	local windHeading = 0
	-- Lua random requires an updated randomseed to ensure randomnees between same range values.
	math.randomseed(GetGameTimer())

	local count = getTableLength(weatherTree)
	local tableKeys = getTableKeys(weatherTree)

	if(currentWeatherData["weatherString"] == nil)then
		newWeatherString = tableKeys[math.random(1,count)]
	else
		local currentOptions = weatherTree[currentWeatherData["weatherString"]]
		newWeatherString = currentOptions[math.random(1,getTableLength(currentOptions))]
	end

	-- 50/50 Chance to enabled wind at a random heading for the specified weathers.
	if(windWeathers[newWeatherString] and (math.random(0,1) == 1))then
		windEnabled = true
		windHeading = math.random(0,360)
	end

	currentWeatherData = {
		["weatherString"] = newWeatherString,
		["windEnabled"] = windEnabled,
		["windHeading"] = windHeading
	}

	print("Updating Weather to "..newWeatherString.." for all players.")
	TriggerClientEvent("smartweather:updateWeather", -1, currentWeatherData)
end







-- Sync Weather once player joins.
RegisterServerEvent("smartweather:syncWeather")
AddEventHandler("smartweather:syncWeather",function()
	print("Syncing weather for: "..GetPlayerName(source))
	TriggerClientEvent("smartweather:updateWeather", source, currentWeatherData)
end)



-- Toggle if weather should auto change.
RegisterServerEvent("smartweather:toggleWeather")
AddEventHandler("smartweather:toggleWeather",function(from)
	local by = GetPlayerName(from) or ""
	local text = "^1disabled^7"

	SmartWeatherEnabled = not SmartWeatherEnabled
	if(SmartWeatherEnabled)then
		text = "^2enabled^7"
	end

	local message = "SmartWeather has been "..text.." by ^5"..by
	TriggerClientEvent("chatMessage", -1, "SmartWeather",{0,0,0},message)
end)



-- Example of how to toggle weather. Added basic chat command.
AddEventHandler('chatMessage', function(from,name,message)
	if(string.sub(message,1,1) == "/") then

		local args = stringsplit(message)
		local cmd = args[1]

		if(cmd == "/toggleweather")then
			CancelEvent()
			TriggerEvent("smartweather:toggleWeather", from)
		end
	end

end)



-- Wait before updating the weather.
CreateThread(function()
	while true do
		-- Every 7 minutes update the weather type.
		-- Wait(420000)

		Wait(secondsToWait * 1000)
		if(SmartWeatherEnabled)then
			updateWeatherString()
		else
			print("SmartWeather is currently disabled.")
		end
	end
end)




--[[
Outdated Trees kept for reference


-- XMAS 
weatherTree = {
	["EXTRASUNNY"] = {"CLEAR","SMOG"},
	["SMOG"] = {"FOGGY","CLEAR","CLEARING","OVERCAST","CLOUDS","EXTRASUNNY"},
	["CLEAR"] = {"CLOUDS","EXTRASUNNY","CLEARING","SMOG","FOGGY","OVERCAST"},
	["CLOUDS"] = {"CLEAR","SMOG","FOGGY","CLEARING","OVERCAST","SNOW","SNOWLIGHT"},
	["FOGGY"] = {"CLEAR","CLOUDS","SMOG","OVERCAST"},
	["OVERCAST"] = {"CLEAR","CLOUDS","SMOG","FOGGY","RAIN","CLEARING"},
	["RAIN"] = {"THUNDER","CLEARING","SNOW","SNOWLIGHT","OVERCAST"},
	["THUNDER"] = {"RAIN","CLEARING","BLIZZARD"},
	["CLEARING"] = {"CLEAR","CLOUDS","OVERCAST","FOGGY","SMOG","RAIN","SNOWLIGHT"},
	["SNOW"] = {"BLIZZARD","RAIN","SNOWLIGHT","XMAS"},
	["BLIZZARD"] = {"SNOW","SNOWLIGHT","THUNDER","XMAS"},
	["SNOWLIGHT"] = {"SNOW","RAIN","CLEARING"},
	["XMAS"] = {"EXTRASUNNY","BLIZZARD","SNOWLIGHT","SNOW"},
	-- ["lightsnow"] = {} ? Doesn't seem to do anything worth while, seems like lightrain.
}

-- Neutral & XMAS
weatherTree = {
	["EXTRASUNNY"] = {"CLEAR","SMOG","NEUTRAL"},
	["SMOG"] = {"FOGGY","CLEAR","CLEARING","OVERCAST","NEUTRAL","CLOUDS","EXTRASUNNY"},
	["CLEAR"] = {"CLOUDS","EXTRASUNNY","CLEARING","SMOG","FOGGY","NEUTRAL","OVERCAST"},
	["CLOUDS"] = {"CLEAR","SMOG","FOGGY","CLEARING","OVERCAST","SNOW","SNOWLIGHT","NEUTRAL"},
	["FOGGY"] = {"CLEAR","CLOUDS","SMOG","OVERCAST","NEUTRAL"},
	["OVERCAST"] = {"CLEAR","CLOUDS","SMOG","FOGGY","RAIN","NEUTRAL","CLEARING"},
	["RAIN"] = {"THUNDER","CLEARING","SNOW","SNOWLIGHT","OVERCAST"},
	["THUNDER"] = {"RAIN","CLEARING","BLIZZARD"},
	["CLEARING"] = {"CLEAR","CLOUDS","OVERCAST","FOGGY","SMOG","RAIN","SNOWLIGHT"},
	["NEUTRAL"] = {"EXTRASUNNY","SMOG","CLEAR","CLEARING","CLOUDS","FOGGY","OVERCAST"},
	["SNOW"] = {"BLIZZARD","RAIN","SNOWLIGHT","XMAS"},
	["BLIZZARD"] = {"SNOW","SNOWLIGHT","THUNDER","XMAS"},
	["SNOWLIGHT"] = {"SNOW","RAIN","CLEARING"},
	["XMAS"] = {"EXTRASUNNY","BLIZZARD","SNOWLIGHT","SNOW"},
	-- ["lightsnow"] = {} ? Doesn't seem to do anything worth while, seems like lightrain.
}


-- Original
weatherTree = {
	["EXTRASUNNY"] = {"CLEAR","SMOG","NEUTRAL"},
	["SMOG"] = {"FOGGY","CLEAR","CLEARING","OVERCAST","NEUTRAL","CLOUDS","EXTRASUNNY"},
	["CLEAR"] = {"CLOUDS","EXTRASUNNY","CLEARING","SMOG","FOGGY","NEUTRAL","OVERCAST"},
	["CLOUDS"] = {"CLEAR","SMOG","FOGGY","CLEARING","OVERCAST","SNOW","LIGHTSNOW","NEUTRAL"},
	["FOGGY"] = {"CLEAR","CLOUDS","SMOG","OVERCAST","NEUTRAL"},
	["OVERCAST"] = {"CLEAR","CLOUDS","SMOG","FOGGY","RAIN","NEUTRAL","CLEARING"},
	["RAIN"] = {"THUNDER","CLEARING","SNOW","LIGHTSNOW","OVERCAST"},
	["THUNDER"] = {"RAIN","CLEARING","BLIZZARD"},
	["CLEARING"] = {"CLEAR","CLOUDS","OVERCAST","FOGGY","SMOG","RAIN","LIGHTSNOW"},
	["NEUTRAL"] = {"EXTRASUNNY","SMOG","CLEAR","CLEARING","CLOUDS","FOGGY","OVERCAST"},
	["SNOW"] = {"BLIZZARD","RAIN","LIGHTSNOW","XMAS"},
	["BLIZZARD"] = {"SNOW","LIGHTSNOW","THUNDER","XMAS"},
	["LIGHTSNOW"] = {"SNOW","RAIN","CLEARING"},
	["XMAS"] = {"EXTRASUNNY","BLIZZARD","LIGHTSNOW","SNOW"},
	-- ["SNOWLIGHT"] = {} ? Doesn't seem to do anything worth while
}
]]