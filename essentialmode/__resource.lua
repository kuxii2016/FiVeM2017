-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --

-- Manifest
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'EssentialMode by Kanersps.'

ui_page 'ui.html'

-- NUI Files
files {
	'ui.html',
	'pdown.ttf'
}

-- Server
server_script 'server/classes/player.lua'
server_script 'server/classes/groups.lua'
server_script 'server/player/login.lua'
server_script 'server/main.lua'
server_script 'server/util.lua'
server_script 'server/carwash.lua'
server_script 'server/wetter.lua'
--server_script 'server/garage.lua'

-- Client
client_script 'client/main.lua'
client_script 'client/player.lua'
client_script 'car/carhud.lua'
client_script 'client/carwash.lua'
client_script 'client/wetter.lua'
--client_script 'client/garage.lua'
--client_script 'client/garageGUI.lus'
client_script 'events/airport.lua'
client_script 'events/train.lua'
client_script 'client/streetname.lua'
client_script 'client/compass.lua'
client_script 'client/essentials.lua'