local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Model Menu",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}
local c_options = {
    armour = 0,   
    armour_txt = 0,
    hair = 0,
    hcolour = 0,
    shirt = 0,
    shirt_txt = 0,
    pants = 0,
    pants_txt = 0,
    undershirt = 0,
    undershirt_txt = 0,
    shoes = 0,
    shoes_txt = 0,
    hand = 0,
    mask = 0,
    mask_txt = 0,
    head = 0,
    helmet = 0,
    helmet_txt = 0,
    glasses = 0,
    glasses_txt = 0,
    piercing = 0,
    piercing_txt = 0
}
mp_check = false
shirt_help = false
model_info = false
texture_help = false
hair_help = false
secondsRemaining = 0
secondsRemaining2 = 0

firstConnect = true
AddEventHandler('playerSpawned', function(spawn)
    if firstConnect then
        TriggerServerEvent("mm:spawn")
        firstConnect = false
    else
        TriggerServerEvent("mm:otherspawn")
    end
end)

RegisterNetEvent("mm:changemodel")
AddEventHandler("mm:changemodel",function(model)
    changemodel(model,nil)
    Notify("~g~Spieler Geladen")   
end)

RegisterNetEvent("mm:changempmodel")
AddEventHandler("mm:changempmodel",function(model)
    changempmodel(model,nil)
    TriggerServerEvent("mm:spawn2")
    Notify("~g~Spieler Geladen")
end)

RegisterNetEvent("mm:changemodelspawn")
AddEventHandler("mm:changemodelspawn",function(model)
    changemodel(model,nil)
    Notify("~g~Spieler Geladen")
end)

RegisterNetEvent("mm:changempmodelspawn")
AddEventHandler("mm:changempmodelspawn",function(model)
    changempmodel(model,nil)
    Notify("~g~Spieler Geladen")
    TriggerServerEvent("mm:spawn2")
end)

RegisterNetEvent("mm:firstspawn")
AddEventHandler("mm:firstspawn",function()
    Notify("~r~Ändere dein aussehen im Laden!")
end)

RegisterNetEvent("mm:changeeverything_spawn") --Sets mask and texture when spawned
AddEventHandler("mm:changeeverything_spawn",function(user)
    c_options.armour = user.armour
    c_options.armour_txt = user.armour_txt
    c_options.hair = user.hair
    c_options.hcolour = user.hcolour
    c_options.shirt = user.shirt
    c_options.shirt_txt = user.shirt_txt
    c_options.pants = user.pants
    c_options.pants_txt = user.pants_txt
    c_options.undershirt = user.undershirt
    c_options.undershirt_txt = user.undershirt_txt
    c_options.shoes = user.shoe
    c_options.shoes_txt = user.shoe_txt
    c_options.hand = user.hand
    c_options.mask = user.mask
    c_options.mask_txt = user.mask
    c_options.head = user.head
    c_options.helmet = user.helmet
    c_options.helmet_txt = user.helmet_txt
    c_options.glasses = user.glasses
    c_options.glasses_txt = user.glasses_txt
    c_options.piercing = user.piercing
    c_options.piercing_txt = user.piercing_txt

    --SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(user.head), 0, 0) 
    --The laziest way possible of doing this ^_^
    SetPedHeadBlendData(GetPlayerPed(-1), tonumber(c_options.head), tonumber(c_options.head), 0, tonumber(c_options.head), tonumber(c_options.head), 0, 0.5, 0.5, 0.0, false)
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(user.mask), tonumber(user.mask_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(user.hair), 0, 1)
    SetPedHairColor(GetPlayerPed(-1), tonumber(user.hcolour), tonumber(user.hcolour))
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(user.shoe), tonumber(user.shoe_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(user.shirt), tonumber(user.shirt_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(user.hand), 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(user.pants), tonumber(user.pants_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(user.undershirt), tonumber(user.undershirt_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(user.armour), tonumber(user.armour_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(user.helmet), tonumber(user.helmet_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(user.glasses), tonumber(user.glasses_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(user.piercing), 0, 0)
end)

RegisterNetEvent("mm:changeeverything") --Sets mask and texture when spawned
AddEventHandler("mm:changeeverything",function(user)
    --SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(user.head), 0, 0)
    --The laziest way possible of doing this ^_^
    SetPedHeadBlendData(GetPlayerPed(-1), tonumber(c_options.head), tonumber(c_options.head), 0, tonumber(c_options.head), tonumber(c_options.head), 0, 0.5, 0.5, 0.0, false) 
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(user.mask), tonumber(user.mask_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(user.hair), 0, 1)
    SetPedHairColor(GetPlayerPed(-1), tonumber(user.hcolour), tonumber(user.hcolour))
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(user.shoe), tonumber(user.shoe_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(user.shirt), tonumber(user.shirt_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(user.hand), 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(user.pants), tonumber(user.pants_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(user.undershirt), tonumber(user.undershirt_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(user.armour), tonumber(user.armour_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(user.helmet), tonumber(user.helmet_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(user.glasses), tonumber(user.glasses_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(user.piercing), 0, 0)
end)

function changemodel(model)
    
    local modelhashed = GetHashKey(model)

    RequestModel(modelhashed)
    while not HasModelLoaded(modelhashed) do 
        RequestModel(modelhashed)
        Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), modelhashed)
    SetPedRandomComponentVariation(GetPlayerPed(-1), true)
    local a = "" -- nil doesnt work
    SetModelAsNoLongerNeeded(modelhashed)
    mp_check = false
end

function changempmodel(model)
    
    local modelhashed = GetHashKey(model)

    RequestModel(modelhashed)
    while not HasModelLoaded(modelhashed) do 
        RequestModel(modelhashed)
        Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), modelhashed)
    local a = "" -- nil doesnt work
    SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 0)
    if model == 'mp_f_freemode_01' then
        SetPedComponentVariation(GetPlayerPed(-1), 0, 34, 0, 0)
    end
    SetModelAsNoLongerNeeded(modelhashed)
    mp_check = true
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function savemodel(model)
    TriggerServerEvent("mm:savemodel", model)
end

function savempmodel(model)
    TriggerServerEvent("mm:savempmodel", model)
end

function checkCustomisation()
    TriggerServerEvent("mm:checkCustomisation")
end

RegisterNetEvent("mm:Customisationisagogogo")
AddEventHandler("mm:Customisationisagogogo",function()
    GCustomisation()
    mp_check = true
end)

RegisterNetEvent("mm:Customisationisanonono")
AddEventHandler("mm:Customisationisanonono",function()
    mp_check = false
    model_info = true
    secondsRemaining = 10
    TriggerServerEvent("mm:timer")
end)

RegisterNetEvent("mm:timerend")
AddEventHandler("mm:timerend",function()
    model_info = false
end)

RegisterNetEvent("mm:timerend2")
AddEventHandler("mm:timerend2",function()
    mp_check_message = false
end)

function Main()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    Notify("Drücke ~r~E ~w~zum ~g~Öffnen~w~/~r~Schließen~w~!")
    Notify("~w~Drücke ~g~F ~w~zum ~g~Speichern~w~!")
    options.menu_title = "Model Menu"
    options.menu_subtitle = "Categories"
    ClearMenu()
    Menu.addButton("Anpassung", "checkCustomisation", nil)
    Menu.addButton("Männliche", "MaleMenu", nil)
    Menu.addButton("Weibliche", "FemaleMenu", nil)
    --Menu.addButton("EMS Models","EMSMenu",nil)
    --Menu.addButton("Animals", "AnimalMenu", nil)
    Menu.addButton("Andere", "OtherMenu", nil)
end

function GCustomisation()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_title = "Geschlecht?"
    options.menu_subtitle = "Categories"
    ClearMenu()
    Menu.selection = 1
    Menu.previous = "Main"
    Menu.addButton("Männlich", "Customisation", nil)
    Menu.addButton("Weiblich", "FCustomisation", nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Male Menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Männliche"
    ClearMenu()
    Menu.previous = "Main"
    for i,c in pairs(male_models) do
        Menu.addButton(male_models[Menu.buttonCount+1], "savemodel", male_models[Menu.buttonCount+1])
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Female Menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Weibliche"
    ClearMenu()
    Menu.previous = "Main"
    for i,c in pairs(female_models) do
        Menu.addButton(female_models[Menu.buttonCount+1], "savemodel", female_models[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--COP/EMS/MARINES/SHERIFF/SECURITY Menu 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function EMSMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "EMS"
    ClearMenu()
    Menu.previous = "Main"
    for i,c in pairs(ems_models) do
        Menu.addButton(ems_models[Menu.buttonCount+1], "savemodel", ems_models[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Animal Menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function AnimalMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Animal Models"
    ClearMenu()
    Menu.previous = "Main"
    for i,c in pairs(animal_models) do
        Menu.addButton(animal_models[Menu.buttonCount+1], "savemodel", animal_models[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Andere"
    ClearMenu()
    Menu.previous = "Main"
    Menu.addButton("Männliche","OtherMenuMale",nil)
    Menu.addButton("Weibliche","OtherMenuFemale",nil)  
    Menu.addButton("Online","MPMenu",nil)  
    Menu.addButton("Return","Main",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuMale()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Männliche"
    ClearMenu()
    Menu.previous = "OtherMenu"
    for i,c in pairs(other_male_models) do
        Menu.addButton(other_male_models[Menu.buttonCount+1], "savemodel", other_male_models[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OtherMenuFemale()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Weibliche"
    ClearMenu()
    Menu.previous = "OtherMenu"
    for i,c in pairs(other_female_models) do
        Menu.addButton(other_female_models[Menu.buttonCount+1], "savemodel", other_female_models[Menu.buttonCount+1])
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu
--Multiplayer Models
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MPMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Online Models"
    ClearMenu()
    Menu.previous = "OtherMenu"
    Menu.addButton(freemode_models[Menu.buttonCount+1], "savempmodel", freemode_models[Menu.buttonCount+1])
    Menu.addButton(freemode_models[Menu.buttonCount+1], "savempmodel", freemode_models[Menu.buttonCount+1])
    Menu.addButton("Mehr", "MPMenu2", nil)
end
function MPMenu2()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Online Models"
    ClearMenu()
    Menu.previous = "MPMenu"
    for i,c in pairs(mp_models) do
        Menu.addButton(mp_models[Menu.buttonCount+1], "savemodel", mp_models[Menu.buttonCount+1])
    end
end
--[[
     _                                    _           
    / \   ___ ___ ___  ___ ___  ___  _ __(_) ___  ___ 
   / _ \ / __/ __/ _ \/ __/ __|/ _ \| '__| |/ _ \/ __|
  / ___ \ (_| (_|  __/\__ \__ \ (_) | |  | |  __/\__ \
 /_/   \_\___\___\___||___/___/\___/|_|  |_|\___||___/
                                                      
]]

function Accessories()
    texture_help = false
    options.menu_subtitle = "Männlich Accessories"
    ClearMenu()
    Menu.previous = "Customisation"
    Menu.addButton("Helme/Hüte", "HelmetMenu")
    Menu.addButton("Brillen", "GlassesMenu")
    Menu.addButton("Ohrringe", "PiercingMenu")
    Menu.addButton("Masken", "MaskMenu")
    Menu.addButton("Abnehmen", "RemoveAccessories")
end

function FAccessories()
    texture_help = false
    options.menu_subtitle = "Weiblich Accessories"
    ClearMenu()
    Menu.previous = "FCustomisation"
    Menu.addButton("Helme/Hüte", "FemaleHelmetMenu")
    Menu.addButton("Brillen", "FemaleGlassesMenu")
    Menu.addButton("Ohrringe", "FemalePiercingMenu")
    Menu.addButton("Masken", "FMaskMenu")
    Menu.addButton("Abnehmen", "FRemoveAccessories")
end

function RemoveAccessories()
    options.menu_subtitle = "Accessories"
    ClearMenu()
    Menu.previous = "Accessories"
    Menu.addButton("Nehme Hut ab", "riphat",nil)
    Menu.addButton("Nehme Brille ab", "ripglasses",nil)
    Menu.addButton("Nehme Ohrringe ab", "ripearrings",nil)
    Menu.addButton("Nehme Maske ab", "ripmask",nil)
end

function FRemoveAccessories()
    options.menu_subtitle = "Accessories"
    ClearMenu()
    Menu.previous = "FAccessories"
    Menu.addButton("Nehme Hut ab", "riphat",nil)
    Menu.addButton("Nehme Brille ab", "ripglasses",nil)
    Menu.addButton("Nehme Ohrringe ab", "ripearrings",nil)
    Menu.addButton("Nehme Maske ab", "ripmask",nil)
end

function riphat()
    c_options.helmet = 240
    ClearPedProp(GetPlayerPed(-1),0)
end
function ripglasses()
    c_options.glasses = 240
    ClearPedProp(GetPlayerPed(-1),1)
end
function ripearrings()
    c_options.piercing = 240
    ClearPedProp(GetPlayerPed(-1),2)
end
function ripmask()
    c_options.mask = 0
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), 0, 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                   
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function MaskMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Masks"
    ClearMenu()
    Menu.previous = "Accessories"
    for i,c in pairs(ass.masks_names) do
        Menu.addButton(ass.masks_names[Menu.buttonCount+1], "savemask", ass.masks_drawable[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                   
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Textures"
    ClearMenu()
    Menu.previous = "MaskMenu"
    for i,c in pairs(ass.txt_pg1) do
        Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function FMaskMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Masks"
    ClearMenu()
    Menu.previous = "FAccessories"
    for i,c in pairs(ass.masks_names) do
        Menu.addButton(ass.masks_names[Menu.buttonCount+1], "fsavemask", ass.masks_drawable[Menu.buttonCount+1])
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 1/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fmaskTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Textures"
    ClearMenu()
    Menu.previous = "FMaskMenu"
    for i,c in pairs(ass.txt_pg1) do
        Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu             --Credit to izio38 for helping me with one of my annoying errors :)
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savemask(mask) --Sets Players mask in database
    c_options.mask = mask
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), 0, 0)
    maskTextures()
end

function fsavemask(mask) --Sets Players mask in database
    c_options.mask = mask
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), 0, 0)
    fmaskTextures()
end

function savetxt(mask_txt) --Sets mask texture in database
    c_options.mask_txt = mask_txt
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), tonumber(c_options.mask_txt), 0)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/5
--Helmet Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HelmetMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Helmets"
    ClearMenu()
    Menu.previous = "Accessories"
    for i,c in pairs(hat.drawable) do
        Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/5
--Helmets Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHelmetMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Helmets"
    ClearMenu()
    Menu.previous = "FAccessories"
    for i,c in pairs(hat.fdrawable) do
        Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/2
--Helmet Menu
--Textures
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function helmetTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Helmet Textures"
    ClearMenu()
    Menu.previous = "HelmetMenu"
    for i,c in pairs(hat.texture) do
        Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/2
--Helmet Menu
--Textures
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fhelmetTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Helmet Textures"
    ClearMenu()
    Menu.previous = "FemaleHelmetMenu"
    for i,c in pairs(hat.texture) do
        Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Hat/Helmet Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function sethelmet(helmet)
    c_options.helmet = helmet
    --c_options.helmet_txt = helmet_txt
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(c_options.helmet), 0, 0)
    helmetTextures()
end

function fsethelmet(helmet)
    c_options.helmet = helmet
    --c_options.helmet_txt = helmet_txt
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(c_options.helmet), 0, 0)
    fhelmetTextures()
end

function sethelmet_txt(helmet_txt)
    c_options.helmet_txt = helmet_txt
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(c_options.helmet), tonumber(c_options.helmet_txt), 0)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories   
--Glasses Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GlassesMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Brillen"
    ClearMenu()
    Menu.previous = "Accessories"
    for i,c in pairs(glasses.drawable) do
        Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories   
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleGlassesMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Brillen"
    ClearMenu()
    Menu.previous = "FAccessories"
    for i,c in pairs(glasses.fdrawable) do
        Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories   
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fglassesTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Glasses textures"
    ClearMenu()
    Menu.previous = "FemaleGlassesMenu"
    for i,c in pairs(glasses.texture) do
        Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories   
--Glasses Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function glassesTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Glasses textures"
    ClearMenu()
    Menu.previous = "GlassesMenu"
    for i,c in pairs(glasses.texture) do
        Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories  
--Glasses Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function setglasses(glasses)
    c_options.glasses = glasses
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(c_options.glasses), 0, 0)
    glassesTextures()
end

function fsetglasses(glasses)
    c_options.glasses = glasses
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(c_options.glasses), 0, 0)
    glassesTextures()
end

function setglasses_txt(glasses_txt)
    c_options.glasses_txt = glasses_txt
   SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(c_options.glasses), tonumber(c_options.glasses_txt), 0)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories
--Piercing Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PiercingMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Piercing"
    ClearMenu()
    Menu.previous = "Accessories"
    for i,c in pairs(ears.drawable) do
        Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/3
--Piercing Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePiercingMenu()
    texture_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Piercing"
    ClearMenu()
    Menu.previous = "FAccessories"
    for i,c in pairs(ears.fdrawable) do
        Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories  
--Piercing Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function setpiercing(piercing)
    c_options.piercing = piercing
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(c_options.piercing), 0, 0)
end

function setpiercing_txt(piercing_txt)
    c_options.piercing_txt = piercing_txt
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(c_options.piercing), tonumber(c_options.piercing_txt), 0)
end


--[[
  ______                           _                 _               
 / _____)          _              (_)           _   (_)              
| /     _   _  ___| |_  ___  ____  _  ___  ____| |_  _  ___  ____    
| |    | | | |/___)  _)/ _ \|    \| |/___)/ _  |  _)| |/ _ \|  _ \   
| \____| |_| |___ | |_| |_| | | | | |___ ( ( | | |__| | |_| | | | |  
 \______)____(___/ \___)___/|_|_|_|_(___/ \_||_|\___)_|\___/|_| |_|                                                                 
]]
function Customisation()
    shirt_help = false
    texture_help = false
    options.menu_title = "Customisation"
    options.menu_subtitle = "Passe deinen Spieler an"
    ClearMenu()
    Menu.previous = "GCustomisation"
    Menu.addButton("Accessories", "Accessories")
    Menu.addButton("Kopf", "HeadMenu")
    Menu.addButton("Haare", "MaleHairMenu")
    Menu.addButton("T-Shirt", "ShirtMenu")
    Menu.addButton("Untershirt", "MaleUndershirtMenu")
    Menu.addButton("Schutzwesten", "MaleArmourMenu")
    Menu.addButton("Hände", "HandsMenu")
    Menu.addButton("Hosen", "MalePantsMenu")
    Menu.addButton("Schuhe", "MaleShoeMenu")
end

function FCustomisation()
    shirt_help = false
    texture_help = false
    options.menu_title = "Customisation"
    options.menu_subtitle = "Customise your character"
    ClearMenu()
    Menu.previous = "GCustomisation"
    Menu.addButton("Accessories", "FAccessories")
    Menu.addButton("Kopf", "FemaleHeadMenu")
    Menu.addButton("Haare", "FemaleHairMenu")
    Menu.addButton("T-Shirt", "FemaleShirtMenu")
    Menu.addButton("Untershirt", "FemaleUndershirtMenu")
    Menu.addButton("Schutzwesten", "FemaleArmourMenu")
    Menu.addButton("Hände", "FHandsMenu")
    Menu.addButton("Hosen", "FemalePantsMenu")
    Menu.addButton("Schuhe", "FemaleShoeMenu")
end
--Females 34,45,33,21
--Males 1,12,13,22,42,43,44
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Köpfe"
    ClearMenu()
    Menu.previous = "Customisation"
    for i,c in pairs(heads.drawable) do
        Menu.addButton(heads.names[Menu.buttonCount+1], "savehead", heads.drawable[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Head
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHeadMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Köpfe"
    ClearMenu()
    Menu.previous = "FCustomisation"
    for i,c in pairs(heads.fdrawable) do
        Menu.addButton(heads.fnames[Menu.buttonCount+1], "savehead", heads.fdrawable[Menu.buttonCount+1])
    end
end

--[[
    Head Functions
--]]
function savehead(head) --Sets Players head in database
    c_options.head = head
    --The laziest way possible of doing this ^_^
    SetPedHeadBlendData(GetPlayerPed(-1), tonumber(c_options.head), tonumber(c_options.head), 0, tonumber(c_options.head), tonumber(c_options.head), 0, 0.5, 0.5, 0.0, false)
    --SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(c_options.head), 0, 2)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu()
    hair_help = false
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Haare"
    ClearMenu()
    Menu.previous = "Customisation"
    for i,c in pairs(hair.names) do
        Menu.addButton(hair.names[Menu.buttonCount+1], "savehair", hair.hair[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu()
    hair_help = false
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Haare"
    ClearMenu()
    Menu.previous = "FCustomisation"
    for i,c in pairs(hair.hair) do
        Menu.addButton(hair.fnames[Menu.buttonCount+1], "fsavehair", hair.hair[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
--Colour
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HairColour()
    hair_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Haar Farben"
    ClearMenu()
    Menu.previous = "MaleHairMenu"
    for i,c in pairs(hair.hcolour) do
        Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
--Colour
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fHairColour()
    hair_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Haar Farben"
    ClearMenu()
    Menu.previous = "FemaleHairMenu"
    for i,c in pairs(hair.hcolour) do
        Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savehair(hair) --Sets Players head in database
    c_options.hair = hair
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), 0, 0)
    HairColour()
end
function fsavehair(hair) --Sets Players head in database
    c_options.hair = hair
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), 0, 0)
    fHairColour()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savecolour(hcolour) --Sets mask texture in database
    c_options.hcolour = hcolour
    --SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), tonumber(c_options.hcolour), 2)
    SetPedHairColor(GetPlayerPed(-1), tonumber(c_options.hcolour), tonumber(c_options.hcolour))
    --SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), tonumber(c_options.hcolour), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu          
--Male Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu()
    shirt_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "T-Shirts"
    ClearMenu()
    Menu.previous = "Customisation"
    for i,c in pairs(shirts.shirts) do
        Menu.addButton(shirts.names[Menu.buttonCount+1], "saveshirt", shirts.shirts[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu          
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu()
    shirt_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "T-Shirts"
    ClearMenu()
    Menu.previous = "FCustomisation"
    for i,c in pairs(fshirts.shirts) do
        Menu.addButton(fshirts.names[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures                      
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshirtTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "FemaleShirtMenu"
    for i,c in pairs(shirts.txt) do
        Menu.addButton(shirts.txt[Menu.buttonCount+1], "saveshirt_txt", shirts.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures                    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "ShirtMenu"
    for i,c in pairs(shirts.txt) do
        Menu.addButton(shirts.txt[Menu.buttonCount+1], "saveshirt_txt", shirts.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshirt(shirt) --Sets Players head in database
    c_options.shirt = shirt
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(c_options.shirt), 0, 0)
    shirtTextures()
end
function fsaveshirt(shirt) --Sets Players head in database
    c_options.shirt = shirt
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(c_options.shirt), 0, 0)
    fshirtTextures()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirt Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshirt_txt(shirt_txt) --Sets mask texture in database
    c_options.shirt_txt = shirt_txt
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(c_options.shirt), tonumber(c_options.shirt_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Hände"
    ClearMenu()
    Menu.previous = "Customisation"
    for i,c in pairs(hands.hands) do
        Menu.addButton(hands.hands[Menu.buttonCount+1], "savehand", hands.hands[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu          
--Hands Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Hände"
    ClearMenu()
    Menu.previous = "FCustomisation"
    for i,c in pairs(hands.hands) do
        Menu.addButton(hands.hands[Menu.buttonCount+1], "savehand", hands.hands[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hands
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savehand(hand) --Sets Players head in database
    c_options.hand = hand
    SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(c_options.hand), 0, 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu          
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleShoeMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Schuhe"
    ClearMenu()
    Menu.previous = "Customisation"
    for i,c in pairs(shoes.shoes) do
        Menu.addButton(shoes.names[Menu.buttonCount+1], "saveshoe", shoes.shoes[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           
--Female Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShoeMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Schuhe"
    ClearMenu()
    Menu.previous = "FCustomisation"
    for i,c in pairs(shoes.fshoes) do
        Menu.addButton(shoes.fnames[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                     
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshoeTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "FemaleShoeMenu"
    for i,c in pairs(shoes.txt) do
        Menu.addButton(shoes.txt[Menu.buttonCount+1], "saveshoe_txt", shoes.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shoeTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "MaleShoeMenu"
    for i,c in pairs(shoes.txt) do
        Menu.addButton(shoes.txt[Menu.buttonCount+1], "saveshoe_txt", shoes.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshoe(shoe) --Sets Players head in database
    c_options.shoes = shoe
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(c_options.shoes), 0, 0)
    shoeTextures()
end

function fsaveshoe(shoe) --Sets Players head in database
    c_options.shoes = shoe
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(c_options.shoes), 0, 0)
    fshoeTextures()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoe Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshoe_txt(shoe_txt) --Sets mask texture in database
    c_options.shoes_txt = shoe_txt
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(c_options.shoes), tonumber(c_options.shoes_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Hosen"
    ClearMenu()
    Menu.previous = "Customisation"
    for i,c in pairs(pants.pants) do
        Menu.addButton(pants.names[Menu.buttonCount+1], "savepants", pants.pants[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                     
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Hosen"
    ClearMenu()
    Menu.previous = "FCustomisation"
    for i,c in pairs(pants.fpants) do
        Menu.addButton(pants.fnames[Menu.buttonCount+1], "fsavepants", pants.fpants[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fpantsTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "FemalePantsMenu"
    for i,c in pairs(pants.txt) do
        Menu.addButton(pants.txt[Menu.buttonCount+1], "savepants_txt", pants.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function pantsTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "MalePantsMenu"
    for i,c in pairs(pants.txt) do
        Menu.addButton(pants.txt[Menu.buttonCount+1], "savepants_txt", pants.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savepants(pants) --Sets Players head in database
    c_options.pants = pants
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(c_options.pants), 0, 0)
    pantsTextures()
end

function fsavepants(pants) --Sets Players head in database
    c_options.pants = pants
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(c_options.pants), 0, 0)
    fpantsTextures()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savepants_txt(pants_txt) --Sets mask texture in database
    c_options.pants_txt = pants_txt
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(c_options.pants), tonumber(c_options.pants_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu()
    shirt_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Untershirt"
    ClearMenu()
    Menu.previous = "Customisation"
    Menu.addButton("Remove Undershirt", "RemoveUnderShirt", nil)
    for i,c in pairs(undershirt.undershirt) do
        Menu.addButton(undershirt.names[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu()
    shirt_help = true
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Untershirt"
    ClearMenu()
    Menu.previous = "FCustomisation"
    Menu.addButton("Remove Undershirt", "RemoveUnderShirt", nil)
    for i,c in pairs(undershirt.fundershirt) do
        Menu.addButton(undershirt.fnames[Menu.buttonCount+1], "saveundershirt", undershirt.fundershirt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fundershirtTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "FemaleUndershirtMenu"
    for i,c in pairs(undershirt.txt) do
        Menu.addButton(undershirt.txt[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function undershirtTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Farben"
    ClearMenu()
    Menu.previous = "MaleUndershirtMenu"
    for i,c in pairs(undershirt.txt) do
        Menu.addButton(undershirt.txt[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt[Menu.buttonCount+1])
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveundershirt(undershirt) --Sets Players head in database
    c_options.undershirt = undershirt
    SetPedComponentVariation(GetPlayerPed(-1), 8, undershirt, 0, 0)
    undershirtTextures()
end

function fsaveundershirt(undershirt) --Sets Players head in database
    c_options.undershirt = undershirt
    SetPedComponentVariation(GetPlayerPed(-1), 8, undershirt, 0, 0)
    fundershirtTextures()
end

function RemoveUnderShirt()
    c_options.undershirt = 0
    c_options.undershirt_txt = 240
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(c_options.undershirt), tonumber(c_options.undershirt_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveundershirt_txt(undershirt_txt) --Sets mask texture in database
    c_options.undershirt_txt = undershirt_txt
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(c_options.undershirt), tonumber(c_options.undershirt_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleArmourMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Schutzwesten"
    ClearMenu()
    Menu.previous = "Customisation"
    Menu.addButton(armour.m_name[Menu.buttonCount+1], "removearmour", armour.m_armour[Menu.buttonCount+1])
    Menu.addButton(armour.m_name[Menu.buttonCount+1], "savearmour", armour.m_armour[Menu.buttonCount+1])
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleArmourMenu()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Schutzwesten"
    ClearMenu()
    Menu.previous = "FCustomisation"
    Menu.addButton(armour.f_name[Menu.buttonCount+1], "removearmour", armour.f_armour[Menu.buttonCount+1])
    Menu.addButton(armour.f_name[Menu.buttonCount+1], "fsavearmour", armour.f_armour[Menu.buttonCount+1])
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function armourTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Armour Camos"
    ClearMenu()
    Menu.previous = "MaleArmourMenu"
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function farmourTextures()
    DisplayHelpText("Benutze ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ zum ~y~Blättern~w~ und ~y~Enter~w~ zum ~r~auswählen")
    options.menu_subtitle = "Armour Camos"
    ClearMenu()
    Menu.previous = "FemaleArmourMenu"
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Armour 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savearmour(armour) --Sets Players head in database
    c_options.armour = armour
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), 0, 0)
    armourTextures()
end

function fsavearmour(armour) --Sets Players head in database
    c_options.armour = armour
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), 0, 0)
    farmourTextures()
end

function removearmour(armour) --Sets Players head in database
    c_options.armour = armour
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), 0, 0)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Armour Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savearmour_txt(armour_txt) --Sets mask texture in database
    c_options.armour_txt = armour_txt
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), tonumber(c_options.armour_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press E to open/close menu in the red marker
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local emplacement = {
    {name="Kleidungs Laden", id=73, x=1932.76989746094, y=3727.73510742188, z=32.8444557189941},
    {name="Kleidungs Laden", id=73, x=1693.26, y=4822.27, z=42.06},
    {name="Kleidungs Laden", id=73, x=125.83, y=-223.16, z=54.55},
    {name="Kleidungs Laden", id=73, x=-710.16, y=-153.26, z=37.41},
    {name="Kleidungs Laden", id=73, x=-821.69, y=-1073.90, z=11.32},
    {name="Kleidungs Laden", id=73, x=-1192.81, y=-768.24, z=17.31},
    {name="Kleidungs Laden", id=73, x=4.25, y=6512.88, z=31.87},
    {name="Kleidungs Laden", id=73, x=425.471, y=-806.164, z=29.4911},
	{name="Kleidungs Laden", id=73, x=-1100.8930664063, y=2710.3825683594, z=18.207870101929},
	{name="Kleidungs Laden", id=73, x=614.49359130859, y=2762.8823242188, z=42.088130950928},
	{name="Kleidungs Laden", id=73, x=1196.5007324219, y=2710.0922851563, z=38.222621917725},
	{name="Kleidungs Laden", id=73, x=75.43815612793, y=-1392.9052734375, z=29.376152038574},
	{name="Kleidungs Laden", id=73, x=-3170.8498535156, y=1044.1860351563, z=20.863218307495},
}
incircle = false
Citizen.CreateThread(function()
    for _, item in pairs(emplacement) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.colour)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        for k,v in ipairs(emplacement) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,165, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 1.0)then
                    if (incircle == false) then
                        DisplayHelpText("Drücke ~INPUT_CONTEXT~ um dein Spieler anzupassen.")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) then -- INPUT_CELLPHONE_DOWN
                        Main() -- Menu to draw
                        Menu.selection = 1
                        Menu.hidden = false -- Hide/Show the menu
                        shirt_help = false
                        model_info = false
                        texture_help = false
                    end
                    if(IsControlJustReleased(1, 23)) then 
                        if mp_check then
                            mp_check_message = false
                            local user = {
                                hair = c_options.hair,
                                hcolour = c_options.hcolour,
                                shirt = c_options.shirt,
                                shirt_txt = c_options.shirt_txt,
                                pants = c_options.pants,
                                pants_txt = c_options.pants_txt,
                                undershirt = c_options.undershirt,
                                undershirt_txt = c_options.undershirt_txt,
                                shoe = c_options.shoes,
                                shoe_txt = c_options.shoes_txt,
                                hand = c_options.hand,
                                mask = c_options.mask,
                                mask_txt = c_options.mask_txt,
                                head = c_options.head,
                                armour = c_options.armour,
                                armour_txt = c_options.armour_txt,
                                helmet = c_options.helmet,
                                helmet_txt = c_options.helmet_txt,
                                glasses = c_options.glasses,
                                glasses_txt = c_options.glasses_txt,
                                piercing = c_options.piercing,
                                piercing_txt = c_options.piercing_txt
                            }
                            Notify("~g~Spieler Gespeichert.") 
                            TriggerServerEvent("mm:saveeverything", user)
                        else
                            secondsRemaining2 = 10
                            mp_check_message = true
                            TriggerServerEvent("mm:timer2")                          
                        end
                    end
                    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 3.0)then
                    incircle = false
                    shirt_help = false
                    model_info = false
                    texture_help = false
                    mp_check_message = false
                    hair_help = false
                    Menu.hidden = true
                end
            end
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Help messages
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if shirt_help then
            drawTxt(0.66, 1.45, 1.0,1.0,0.4, "~r~INFO~w~: Wenn deine Charaktere Hände oder Arme unsichtbar sind, dann geh zum ~r~Hands ~w~menü.", 255, 255, 255, 255)
            drawTxt(0.66, 1.42, 1.0,1.0,0.4, "~r~INFO~w~: Wenn deine Charaktere Brust unsichtbar ist, dann geh zum ~r~Untershirt ~w~menü.", 255, 255, 255, 255)
            drawTxt(0.66, 1.37, 1.0,1.0,0.4, "~r~INFO~w~: Wenn deine Charaktere Körper oder Arme durch Kleidung gehen dann gehen auf die ~r~Hände", 255, 255, 255, 255)
            drawTxt(0.66, 1.39, 1.0,1.0,0.4, "              ~w~menü.", 255, 255, 255, 255)
            drawTxt(0.66, 1.34, 1.0,1.0,0.4, "~r~INFO~w~: (~g~Number~w~) = the number of ~g~Textures ~w~available.", 255, 255, 255, 255)
            drawTxt(0.66, 1.31, 1.0,1.0,0.4, "~r~INFO~w~: ~g~T~w~ = ~g~Textures ~w~aUnd die Zahlen sind Texturen, die mit der Kleidung arbeiten.", 255, 255, 255, 255)
        end
        if model_info then
            drawTxt(0.66, 1.41, 1.0,1.0,0.4, "(~g~" .. secondsRemaining .. "~w~) ~r~INFO~w~: Fertige Spieler können nicht Angepasst werden.", 255, 255, 255, 255)
            drawTxt(0.66, 1.44, 1.0,1.0,0.4, "(~g~" .. secondsRemaining .. "~w~) ~r~INFO~w~: Du musst das Model ~r~mp_m_freemode_01 ~w~oder ~r~mp_f_freemode_01~w~ nutzen.", 255, 255, 255, 255)
        end
        if mp_check_message then
            drawTxt(0.66, 1.38, 1.0,1.0,0.4, "(~g~" .. secondsRemaining2 .. "~w~) ~r~INFO~w~: Du kannst keine Fertigen Modelle Speichern.", 255, 255, 255, 255)
        end
        if texture_help then
            drawTxt(0.66, 1.45, 1.0,1.0,0.4, "~r~INFO~w~: (~g~Nummer~w~) = die Nummer von ~g~Textures ~w~Verfügbar.", 255, 255, 255, 255)
            drawTxt(0.66, 1.42, 1.0,1.0,0.4, "~r~INFO~w~: ~g~T~w~ = ~g~Textur ~w~Und die Zahlen sind Texturen, die mit der Kleidung arbeiten.", 255, 255, 255, 255)
        end
        if hair_help then
            drawTxt(0.66, 1.45, 1.0,1.0,0.4, "~r~INFO~w~: [ ~r~- ~w~] ist Dunkel und [ ~g~+ ~w~] Hell.", 255, 255, 255, 255)
            drawTxt(0.66, 1.42, 1.0,1.0,0.4, "~r~INFO~w~: Haar Farbe von Dunkel zu Hell.", 255, 255, 255, 255)
        end
        if not Menu.hidden then
            drawTxt(0.65, 0.76, 1.0,1.0,0.4, Menu.selection.."/"..Menu.buttonCount, 255, 255, 255, 255, true)
        end
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityDead(GetPlayerPed(-1)) then
            Menu.hidden = true
            Citizen.Wait(5000)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        if model_info then
            Citizen.Wait(1000)
            if(secondsRemaining > 0)then
                secondsRemaining = secondsRemaining - 1
            end
        end

        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        if mp_check_message then
            Citizen.Wait(1000)
            if(secondsRemaining2 > 0)then
                secondsRemaining2 = secondsRemaining2 - 1
            end
        end

        Citizen.Wait(0)
    end
end)
