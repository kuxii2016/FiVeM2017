--[[Register]]--


RegisterNetEvent('vehiclesshop:FinishMoneyCheckForvehicles')

--[[Local/Global]]--

local vehiclesshop = {
	opened = false,
	title = "Autohaus",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Kategorie",
			name = "main",
			buttons = {
				{name = "Autos", description = ""},
				{name = "2Raeder", description = ""},
				{name = "Lkws", description = ""},
			}
		},
		["Autos"] = {
			title = "Autos",
			name = "Autos",
			buttons = {
				{name = "Compacts", description = ''},
				{name = "Coupes", description = ''},
				{name = "Sedans", description = ''},
				{name = "Sports", description = ''},
				{name = "Sports Classics", description = ''},
				{name = "Super", description = ''},
				{name = "Muscle", description = ''},
				{name = "Off-Road", description = ''},
				{name = "SUVs", description = ''},
				{name = "Vans", description = ''},
				{name = "Cycles", description = ''},
			}
		},
		["compacts"] = {
			title = "compacts",
			name = "compacts",
			buttons = {
				{name = "Blista", costs = 15000, description = {}, model = "blista"},
				{name = "Brioso R/A", costs = 15500, description = {}, model = "brioso"},
				{name = "Dilettante", costs = 25000, description = {}, model = "Dilettante"},
				{name = "Issi", costs = 18000, description = {}, model = "issi2"},
				{name = "Panto", costs = 85000, description = {}, model = "panto"},
				{name = "Prairie", costs = 30000, description = {}, model = "prairie"},
				{name = "Rhapsody", costs = 120000, description = {}, model = "rhapsody"},
				{name = "Schrottkiste", costs = 150, description = {}, model = "ruiner3"},
			}
		},
		["coupes"] = {
			title = "coupes",
			name = "coupes",
			buttons = {
				{name = "Cognoscenti Cabrio", costs = 18000, description = {}, model = "cogcabrio"},
				{name = "Exemplar", costs = 20000, description = {}, model = "exemplar"},
				{name = "F620", costs = 80000, description = {}, model = "f620"},
				{name = "Felon", costs = 90000, description = {}, model = "felon"},
				{name = "Felon GT", costs = 95000, description = {}, model = "felon2"},
				{name = "Jackal", costs = 60000, description = {}, model = "jackal"},
				{name = "Oracle", costs = 80000, description = {}, model = "oracle"},
				{name = "Oracle XS", costs = 82000, description = {}, model = "oracle2"},
				{name = "Sentinel", costs = 90000, description = {}, model = "sentinel"},
				{name = "Sentinel XS", costs = 60000, description = {}, model = "sentinel2"},
				{name = "Windsor", costs = 800000, description = {}, model = "windsor"},
				{name = "Windsor Drop", costs = 850000, description = {}, model = "windsor2"},
				{name = "Zion", costs = 60000, description = {}, model = "zion"},
				{name = "Zion Cabrio", costs = 65000, description = {}, model = "zion2"},
			}
		},
		["sports"] = {
			title = "sports",
			name = "sports",
			buttons = {
				{name = "9F", costs = 12000, description = {}, model = "ninef"},
				{name = "9F Cabrio", costs = 13000, description = {}, model = "ninef2"},
				{name = "Alpha", costs = 15000, description = {}, model = "alpha"},
				{name = "Banshee", costs = 10500, description = {}, model = "banshee"},
				{name = "Bestia GTS", costs = 61000, description = {}, model = "bestiagts"},
				{name = "Blista Compact", costs = 42000, description = {}, model = "blista2"},		--NEW
				{name = "Blista", costs = 42000, description = {}, model = "blista"},
				{name = "Buffalo", costs = 35000, description = {}, model = "buffalo"},
				{name = "Buffalo S", costs = 96000, description = {}, model = "buffalo2"},
				{name = "Carbonizzare", costs = 19500, description = {}, model = "carbonizzare"},
				{name = "Comet", costs = 10000, description = {}, model = "comet2"},
				{name = "Coquette", costs = 13800, description = {}, model = "coquette"},
				{name = "Drift Tampa", costs = 95000, description = {}, model = "tampa2"},
				{name = "Elegy Retro Custom", costs = 313800, description = {}, model = "elegy"},	--NEW
				{name = "Elegy RH8 ", costs = 99500, description = {}, model = "elegy2"},			--NEW
				{name = "Feltzer", costs = 13000, description = {}, model = "feltzer2"},
				{name = "Futo Karin", costs = 13000, description = {}, model = "futo"},				--NEW
				{name = "Furore GT", costs = 44800, description = {}, model = "furoregt"},
				{name = "Fusilade", costs = 36000, description = {}, model = "fusilade"},
				{name = "Jester", costs = 24000, description = {}, model = "jester"},
				{name = "Jester(Racecar)", costs = 35000, description = {}, model = "jester2"},
				{name = "Kuruma", costs = 95000, description = {}, model = "kuruma"},
				{name = "Lynx", costs = 173500, description = {}, model = "lynx"},
				{name = "Massacro", costs = 27500, description = {}, model = "massacro"},
				{name = "Massacro(Racecar)", costs = 38500, description = {}, model = "massacro2"},
				{name = "Omnis", costs = 70100, description = {}, model = "omnis"},
				{name = "Penumbra", costs = 24000, description = {}, model = "penumbra"},
				{name = "Rapid GT", costs = 14000, description = {}, model = "rapidgt"},
				{name = "Rapid GT Convertible", costs = 15000, description = {}, model = "rapidgt2"},
				{name = "Schafter V12", costs = 14000, description = {}, model = "schafter3"},
				{name = "Sultan", costs = 1200, description = {}, model = "sultan"},
				{name = "Surano", costs = 11000, description = {}, model = "surano"},
				{name = "Tropos", costs = 81600, description = {}, model = "tropos"},
				{name = "Verkierer", costs = 69500, description = {}, model = "verlierer2"},
				{name = "Porsche", costs = 69500, description = {}, model = "comet3"},
				{name = "Ferari", costs = 69500, description = {}, model = "ardent"},
				{name = "Ferari", costs = 69500, description = {}, model = "cheetah2"},
			}
		},
		["sportsclassics"] = {
			title = "sports classics",
			name = "sportsclassics",
			buttons = {
				{name = "Casco", costs = 42000, description = {}, model = "casco"},
				{name = "Coquette Classic", costs = 66500, description = {}, model = "coquette2"},
				{name = "JB 700", costs = 35000, description = {}, model = "jb700"},
				{name = "Mamba", costs = 45000, description = {}, model = "mamba"},  						--NEW
				{name = "Manana", costs = 35000, description = {}, model = "manana"},  						--NEW
				{name = "Monroe", costs = 48060, description = {}, model = "monroe"},  						--NEW
				{name = "Peyote", costs = 58060, description = {}, model = "peyote"},  						--NEW
				{name = "Pigalle", costs = 40000, description = {}, model = "pigalle"},
				{name = "Roosevelt", costs = 128000, description = {}, model = "btype"},  			--NEW
				{name = "Roosevelt Valor", costs = 228000, description = {}, model = "btype3"},  		--NEW
				{name = "Roosevelt Hotrod", costs = 328000, description = {}, model = "btype2"},  		--NEW
				{name = "Stinger", costs = 85000, description = {}, model = "stinger"},
				{name = "Stinger GT", costs = 87500, description = {}, model = "stingergt"},
				{name = "Stirling GT", costs = 97500, description = {}, model = "feltzer3"},
				{name = "Tornado", costs = 60000, description = {}, model = "tornado"},  					--NEW
				{name = "Z-Type", costs = 950000, description = {}, model = "ztype"},
			}
		},
		["super"] = {
			title = "super",
			name = "super",
			buttons = {
				{name = "Adder", costs = 100000, description = {}, model = "adder"},
				{name = "Banshee 900R", costs = 56500, description = {}, model = "banshee2"},
				{name = "Bullet", costs = 15500, description = {}, model = "bullet"},
				{name = "Cheetah", costs = 65000, description = {}, model = "cheetah"},
				{name = "Entity XF", costs = 79500, description = {}, model = "entityxf"},
				{name = "ETR1", costs = 19950, description = {}, model = "sheava"},
				{name = "FMJ", costs = 175000, description = {}, model = "fmj"},
				{name = "Infernus", costs = 44000, description = {}, model = "infernus"},
				{name = "Osiris", costs = 195000, description = {}, model = "osiris"},
				{name = "RE-7B", costs = 247500, description = {}, model = "le7b"},
				{name = "Reaper", costs = 159500, description = {}, model = "reaper"},
				{name = "Sultan RS", costs = 79500, description = {}, model = "sultanrs"},
				{name = "T20", costs = 220000, description = {}, model = "t20"},
				{name = "Turismo R", costs = 50000, description = {}, model = "turismor"},
				{name = "Tyrus", costs = 255000, description = {}, model = "tyrus"},
				{name = "Vacca", costs = 24000, description = {}, model = "vacca"},
				{name = "Voltic", costs = 15000, description = {}, model = "voltic"},
				{name = "X80 Proto", costs = 270000, description = {}, model = "prototipo"},
				{name = "Zentorno", costs = 72500, description = {}, model = "zentorno"},
			}
		},
		["muscle"] = {
			title = "muscle",
			name = "muscle",
			buttons = {
				{name = "Blade", costs = 16000, description = {}, model = "blade"},
				{name = "Buccaneer", costs = 2900, description = {}, model = "buccaneer"},
				{name = "Chino", costs = 22500, description = {}, model = "chino"},
				{name = "Coquette BlackFin", costs = 69500, description = {}, model = "coquette3"},
				{name = "Dominator", costs = 3500, description = {}, model = "dominator"},
				{name = "Dukes", costs = 62000, description = {}, model = "dukes"},
				{name = "Gauntlet", costs = 32000, description = {}, model = "gauntlet"},
				{name = "Hotknife", costs = 90000, description = {}, model = "hotknife"},
				{name = "Lurcher", costs = 35000, description = {}, model = "lurcher"},		--NEW
				{name = "Faction", costs = 36000, description = {}, model = "faction"},
				{name = "Nightshade", costs = 585000, description = {}, model = "nightshade"},
				{name = "Picador", costs = 9000, description = {}, model = "picador"},
				{name = "Phoenix", costs = 35000, description = {}, model = "phoenix"},		--NEW
				{name = "Ruiner", costs = 35000, description = {}, model = "ruiner"},		--NEW
				{name = "Ruiner", costs = 85000, description = {}, model = "ruiner2"},		--NEW
				{name = "Sabre Turbo", costs = 15000, description = {}, model = "sabregt"},
				{name = "Tampa", costs = 37500, description = {}, model = "tampa"},
				{name = "Virgo", costs = 19500, description = {}, model = "virgo"},
				{name = "Vigero", costs = 21000, description = {}, model = "vigero"},
				{name = "Voodoo", costs = 21000, description = {}, model = "voodoo"},		--NEW
			}
		},
		["offroad"] = {
			title = "off-road",
			name = "off-road",
			buttons = {
				{name = "Bifta", costs = 75000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 8000, description = {}, model = "blazer"},
				{name = "Brawler", costs = 715000, description = {}, model = "brawler"},
				{name = "Bubsta 6x6", costs = 249000, description = {}, model = "dubsta3"},
				{name = "Dune Buggy", costs = 20000, description = {}, model = "dune"},
				{name = "Rebel", costs = 22000, description = {}, model = "rebel2"},
				{name = "Sandking", costs = 38000, description = {}, model = "sandking"},
				{name = "The Liberator", costs = 550000, description = {}, model = "monster"},
				{name = "Trophy Truck", costs = 550000, description = {}, model = "trophytruck"},
			}
		},
		["suvs"] = {
			title = "suvs",
			name = "suvs",
			buttons = {
				{name = "Baller", costs = 90000, description = {}, model = "baller"},
				{name = "Cavalcade", costs = 60000, description = {}, model = "cavalcade"},
				{name = "Grabger", costs = 35000, description = {}, model = "granger"},
				{name = "Huntley S", costs = 195000, description = {}, model = "huntley"},
				{name = "Landstalker", costs = 58000, description = {}, model = "landstalker"},
				{name = "Radius", costs = 32000, description = {}, model = "radi"},
				{name = "Rocoto", costs = 85000, description = {}, model = "rocoto"},
				{name = "Seminole", costs = 30000, description = {}, model = "seminole"},
				{name = "XLS", costs = 253000, description = {}, model = "xls"},
			}
		},
		["vans"] = {
			title = "vans",
			name = "vans",
			buttons = {
				{name = "Bison", costs = 30000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 23000, description = {}, model = "bobcatxl"},
				{name = "Gang Burrito", costs = 65000, description = {}, model = "gburrito"},
				{name = "Journey", costs = 15000, description = {}, model = "journey"},
				{name = "Minivan", costs = 30000, description = {}, model = "minivan"},
				{name = "Paradise", costs = 25000, description = {}, model = "paradise"},
				{name = "Rumpo", costs = 13000, description = {}, model = "rumpo"},
				{name = "Surfer", costs = 11000, description = {}, model = "surfer"},
				{name = "Youga", costs = 16000, description = {}, model = "youga"},
			}
		},
		["sedans"] = {
			title = "sedans",
			name = "sedans",
			buttons = {
				{name = "Asea", costs = 1000000, description = {}, model = "asea"},
				{name = "Asterope", costs = 1000000, description = {}, model = "asterope"},
				{name = "Cognoscenti", costs = 1000000, description = {}, model = "cognoscenti"},			--NEW
				{name = "Cognoscenti(Armored)", costs = 1000000, description = {}, model = "cognoscenti2"},	--NEW
				--{name = "Cognoscenti 55", costs = 1000000, description = {}, model = "cognoscenti3"},
				--{name = "Cognoscenti 55(Armored", costs = 1500000, description = {}, model = "ZENTORNO"},
				{name = "Fugitive", costs = 24000, description = {}, model = "fugitive"},
				{name = "Glendale", costs = 200000, description = {}, model = "glendale"},
				{name = "Ingot", costs = 9000, description = {}, model = "ingot"},
				{name = "Intruder", costs = 16000, description = {}, model = "intruder"},
				{name = "Premier", costs = 10000, description = {}, model = "premier"},
				{name = "Primo", costs = 9000, description = {}, model = "primo"},
				{name = "Primo Custom", costs = 9500, description = {}, model = "primo2"},
				{name = "Regina", costs = 8000, description = {}, model = "regina"},
				{name = "Schafter", costs = 65000, description = {}, model = "schafter2"},
				{name = "Stanier", costs = 10000, description = {}, model = "stanier"},
				{name = "Stratum", costs = 10000, description = {}, model = "stratum"},
				{name = "Stretch", costs = 30000, description = {}, model = "stretch"},
				{name = "Super Diamond", costs = 250000, description = {}, model = "superd"},
				{name = "Surge", costs = 38000, description = {}, model = "surge"},
				{name = "Tailgater", costs = 55000, description = {}, model = "tailgater"},
				{name = "Warrener", costs = 120000, description = {}, model = "warrener"},
				{name = "Washington", costs = 15000, description = {}, model = "washington"},
			}
		},
		["2Raeder"] = {
			title = "2Raeder",
			name = "2Raeder",
			buttons = {
				{name = "BMX", costs = 150, description = {}, model = "bmx"},							--NEW
				{name = "Fixter", costs = 5000, description = {}, model = "fixter"},
				{name = "Akuma", costs = 9000, description = {}, model = "AKUMA"},
				{name = "Avarus", costs = 5000, description = {}, model = "avarus"},
				{name = "Bagger", costs = 15000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 15000, description = {}, model = "bati"},
				{name = "Bati 801RR", costs = 18000, description = {}, model = "bati2"},
				{name = "BF400", costs = 95000, description = {}, model = "bf400"},
				{name = "Carbon RS", costs = 40000, description = {}, model = "carbonrs"},
				{name = "Chimera", costs = 225000, description = {}, model = "chimera"},
				{name = "Cliffhanger", costs = 225000, description = {}, model = "cliffhanger"},
				{name = "Daemon", costs = 5000, description = {}, model = "daemon"},
				{name = "Defiler", costs = 225000, description = {}, model = "defiler"},
				--{name = "Diabolus", costs = 265000, description = {}, model = "diabolus"},
				--{name = "Diabolus Custom", costs = 295000, description = {}, model = "diabolus2"},
				{name = "Double T", costs = 12000, description = {}, model = "double"},
				{name = "Enduro", costs = 48000, description = {}, model = "enduro"},
				{name = "Faggio", costs = 4000, description = {}, model = "faggio2"},
				{name = "Gargoyle", costs = 120000, description = {}, model = "gargoyle"},
				{name = "Hakuchou", costs = 82000, description = {}, model = "hakuchou"},
				{name = "Hexer", costs = 15000, description = {}, model = "hexer"},
				{name = "Innovation", costs = 90000, description = {}, model = "innovation"},
				{name = "Lectro", costs = 700000, description = {}, model = "lectro"},
				{name = "Nemesis", costs = 12000, description = {}, model = "nemesis"},
				{name = "PCJ-600", costs = 9000, description = {}, model = "pcj"},
				{name = "Ruffian", costs = 9000, description = {}, model = "ruffian"},
				{name = "Sanchez", costs = 7000, description = {}, model = "sanchez"},
				{name = "Sovereign", costs = 90000, description = {}, model = "sovereign"},
				{name = "Thrust", costs = 75000, description = {}, model = "thrust"},
				{name = "Vader", costs = 9000, description = {}, model = "vader"},
				{name = "Vindicator", costs = 600000, description = {}, model = "vindicator"},
		}
},
		["Lkws"] = {
			title = "Lkws",
			name = "Lkws",
			buttons = {
				{name = "Benson", costs = 9000, description = {}, model = "benson"},			--NEW
				{name = "Rat Tracktor", costs = 9000, description = {}, model = "tractor"},		--NEW
				{name = "Hauler", costs = 50000, description = {}, model = "hauler"},			--NEW
				{name = "Packer", costs = 19000, description = {}, model = "packer"},			--NEW
				{name = "Phantom", costs = 18000, description = {}, model = "phantom"},			--NEW
				{name = "Pounder", costs = 16500, description = {}, model = "pounder"},			--NEW
				{name = "Mule", costs = 8000, description = {}, model = "mule"},				--NEW
				{name = "Flatbed", costs = 19750, description = {}, model = "flatbed"},			--NEW
				{name = "Mixer", costs = 17500, description = {}, model = "mixer"},				--NEW
				{name = "Mixer 2", costs = 18000, description = {}, model = "mixer2"},			--NEW
				{name = "Tipper", costs = 15000, description = {}, model = "tipper"},			--NEW
				{name = "Tipper 2", costs = 10000, description = {}, model = "tipper2"},		--NEW
			}
		},
	}
}

local fakevehicles = {model = '', car = nil}
local vehiclesshop_locations = {
{entering = {-33.803,-1102.322,25.422}, inside = {-46.56327,-1097.382,25.99875, 120.1953}, outside = {-31.849,-1090.648,25.998,322.345}},
}

local vehiclesshop_blips ={}
local inrangeofvehiclesshop = false
local currentlocation = nil
local boughtvehicles = false
local vehicles_price = 0
local backlock = false
local firstspawn = 0

local function LocalPed()
	return GetPlayerPed(-1)
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

function IsPlayerInRangeOfvehiclesshop()
	return inrangeofvehiclesshop
end

function ShowvehiclesshopBlips(bool)
	if bool and #vehiclesshop_blips == 0 then
		for station,pos in pairs(vehiclesshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			SetBlipSprite(blip,225)
			SetBlipColour(blip, 0)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Autohaus')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehiclesshop_blips, {blip = blip, pos = loc})
	end
		Citizen.CreateThread(function()
			while #vehiclesshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehiclesshop_blips) do
					DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehiclesshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 5 then
						drawTxt('Drücke ~g~Enter~s~ für das Menü',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehiclesshop = inrange
			end
		end)
	elseif bool == false and #vehiclesshop_blips > 0 then
		for i,b in ipairs(vehiclesshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehiclesshop_blips = {}
	end
end

function f(n)
	return n + 0.0001
end

function LocalPed()
	return GetPlayerPed(-1)
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
	catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function OpenCreator()
	boughtvehicles = false
	local ped = LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehiclesshop.currentmenu = "main"
	vehiclesshop.opened = true
	vehiclesshop.selectedbutton = 0
end

function CloseCreator(name, vehicles, price)
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtvehicles then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local name = name
			local vehicles = vehicles
			local price = price
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = currentlocation.pos.outside

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			personalvehicles = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
			SetModelAsNoLongerNeeded(model)
			for i,mod in pairs(mods) do
				SetVehicleModKit(personalvehicles,0)
				SetVehicleMod(personalvehicles,i,mod)
			end
			SetVehicleOnGroundProperly(personalvehicles)
			local plate = GetVehicleNumberPlateText(personalvehicles)
			SetVehicleHasBeenOwnedByPlayer(personalvehicles,true)
			local id = NetworkGetNetworkIdFromEntity(personalvehicles)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicles))
			SetVehicleColours(personalvehicles,colors[1],colors[2])
			SetVehicleExtraColours(personalvehicles,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),personalvehicles,-1)
			SetEntityVisible(ped,true)
			local primarycolor = colors[1]
			local secondarycolor = colors[2]	
			local pearlescentcolor = extra_colors[1]
			local wheelcolor = extra_colors[2]
			TriggerServerEvent('vehiclesshop:BuyForvehicles', name, vehicles, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
		end
		vehiclesshop.opened = false
		vehiclesshop.menu.from = 1
		vehiclesshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = vehiclesshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehiclesshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehiclesshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
	local menu = vehiclesshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DoesPlayerHaveVehicle(model,button,y,selected)
	local t = false
	--TODO:check if player own car
	if t then
		drawMenuRight("Gekauft",vehiclesshop.menu.x,y,selected)
	else
		drawMenuRight(button.costs.."$",vehiclesshop.menu.x,y,selected)
	end
end

function round(num, idp)
	if idp and idp>0 then
		local mult = 10^idp
		return math.floor(num * mult + 0.5) / mult
	end
	return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehiclesshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Autos" then
			OpenMenu('Autos')
		elseif btn == "2Raeder" then
			OpenMenu('2Raeder')
		elseif btn == "Lkws" then
			OpenMenu('Lkws')
		end
	elseif this == "Autos" then
		if btn == "Sports" then
			OpenMenu('sports')
		elseif btn == "Sedans" then
			OpenMenu('sedans')
		elseif btn == "Compacts" then
			OpenMenu('compacts')
		elseif btn == "Coupes" then
			OpenMenu('coupes')
		elseif btn == "Sports Classics" then
			OpenMenu("sportsclassics")
		elseif btn == "Super" then
			OpenMenu('super')
		elseif btn == "Muscle" then
			OpenMenu('muscle')
		elseif btn == "Off-Road" then
			OpenMenu('offroad')
		elseif btn == "SUVs" then
			OpenMenu('suvs')
		elseif btn == "Vans" then
			OpenMenu('vans')
		end
	elseif this == "compacts" or this == "coupes" or this == "sedans" or this == "sports" or this == "sportsclassics" or this == "super" or this == "muscle" or this == "offroad" or this == "suvs" or this == "vans" or this == "industrial" or this == "cycles" or this == "2Raeder" or this == "Lkws" then
		TriggerServerEvent('vehiclesshop:CheckMoneyForvehicles',button.name,button.model,button.costs)
	end
end

function OpenMenu(menu)
	fakevehicles = {model = '', car = nil}
	vehiclesshop.lastmenu = vehiclesshop.currentmenu
	if menu == "Autos" then
		vehiclesshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehiclesshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehiclesshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehiclesshop.lastmenu = "race_create_objects"
	end
	vehiclesshop.menu.from = 1
	vehiclesshop.menu.to = 10
	vehiclesshop.selectedbutton = 0
	vehiclesshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehiclesshop.currentmenu == "main" then
		CloseCreator()
	elseif vehiclesshop.currentmenu == "compacts" or vehiclesshop.currentmenu == "coupes" or vehiclesshop.currentmenu == "sedans" or vehiclesshop.currentmenu == "sports" or vehiclesshop.currentmenu == "sportsclassics" or vehiclesshop.currentmenu == "super" or vehiclesshop.currentmenu == "muscle" or vehiclesshop.currentmenu == "offroad" or vehiclesshop.currentmenu == "suvs" or vehiclesshop.currentmenu == "vans" or vehiclesshop.currentmenu == "industrial" or vehiclesshop.currentmenu == "cycles" or vehiclesshop.currentmenu == "2Raeder" or vehiclesshop.currentmenu == "Lkws"then
		if DoesEntityExist(fakevehicles.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakevehicles.car))
		end
		fakevehicles = {model = '', car = nil}
		OpenMenu(vehiclesshop.lastmenu)
	else
		OpenMenu(vehiclesshop.lastmenu)
	end

end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRangeOfvehiclesshop() then
			if vehiclesshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end
		if vehiclesshop.opened then
			local ped = LocalPed()
			local menu = vehiclesshop.menu[vehiclesshop.currentmenu]
			drawTxt(vehiclesshop.title,1,1,vehiclesshop.menu.x,vehiclesshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, vehiclesshop.menu.x,vehiclesshop.menu.y + 0.08)
			drawTxt(vehiclesshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,vehiclesshop.menu.x + vehiclesshop.menu.width/2 - 0.0385,vehiclesshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehiclesshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehiclesshop.menu.from and i <= vehiclesshop.menu.to then

					if i == vehiclesshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehiclesshop.menu.x,y,selected)
					if button.costs ~= nil then
							if vehiclesshop.currentmenu == "compacts" or vehiclesshop.currentmenu == "coupes" or vehiclesshop.currentmenu == "sedans" or vehiclesshop.currentmenu == "sports" or vehiclesshop.currentmenu == "sportsclassics" or vehiclesshop.currentmenu == "super" or vehiclesshop.currentmenu == "muscle" or vehiclesshop.currentmenu == "offroad" or vehiclesshop.currentmenu == "suvs" or vehiclesshop.currentmenu == "vans" or vehiclesshop.currentmenu == "industrial" or vehiclesshop.currentmenu == "cycles" or vehiclesshop.currentmenu == "2Raeder" or vehiclesshop.currentmenu == "Lkws" then
							DoesPlayerHaveVehicle(button.model,button,y,selected)
						else
						drawMenuRight(button.costs.."$",vehiclesshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
						if vehiclesshop.currentmenu == "compacts" or vehiclesshop.currentmenu == "coupes" or vehiclesshop.currentmenu == "sedans" or vehiclesshop.currentmenu == "sports" or vehiclesshop.currentmenu == "sportsclassics" or vehiclesshop.currentmenu == "super" or vehiclesshop.currentmenu == "muscle" or vehiclesshop.currentmenu == "offroad" or vehiclesshop.currentmenu == "suvs" or vehiclesshop.currentmenu == "vans" or vehiclesshop.currentmenu == "industrial" or vehiclesshop.currentmenu == "cycles" or vehiclesshop.currentmenu == "2Raeder" or vehiclesshop.currentmenu == "Lkws" then
						if selected then
							if fakevehicles.model ~= button.model then
								if DoesEntityExist(fakevehicles.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakevehicles.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)
									drawTxt("~b~Lade...",0,1,0.5,0.5,1.5,255,255,255,255)

								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								while not DoesEntityExist(veh) do
									Citizen.Wait(0)
									drawTxt("~b~Lade...",0,1,0.5,0.5,1.5,255,255,255,255)
								end
								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakevehicles = { model = button.model, car = veh}
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if vehiclesshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehiclesshop.selectedbutton > 1 then
					vehiclesshop.selectedbutton = vehiclesshop.selectedbutton -1
					if buttoncount > 10 and vehiclesshop.selectedbutton < vehiclesshop.menu.from then
						vehiclesshop.menu.from = vehiclesshop.menu.from -1
						vehiclesshop.menu.to = vehiclesshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehiclesshop.selectedbutton < buttoncount then
					vehiclesshop.selectedbutton = vehiclesshop.selectedbutton +1
					if buttoncount > 10 and vehiclesshop.selectedbutton > vehiclesshop.menu.to then
						vehiclesshop.menu.to = vehiclesshop.menu.to + 1
						vehiclesshop.menu.from = vehiclesshop.menu.from + 1
					end
				end
			end
		end

	end
end)


--[[Events]]--


AddEventHandler('vehiclesshop:FinishMoneyCheckForvehicles', function(name, vehicles, price)
	local name = name
	local vehicles = vehicles
	local price = price
	boughtvehicles = true	
	CloseCreator(name, vehicles, price)
end)

AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		ShowvehiclesshopBlips(true)
		firstspawn = 1
	end
end)
