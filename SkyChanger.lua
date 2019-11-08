-- Donload skyboxes - https://mega.nz/#!NhVC3QhZ!qmF8HmSoOJfWRoUGJ96k_Fk_EMcQcKltM9vD2gJCm8Q
-- Files to "...\steamapps\common\Counter-Strike Global Offensive\csgo\materials\skybox"

Menu.Combo( "bSkyBox", "iSkyBox", {"Defaul","Space","Mountains","Orange Space","Sky of day","borealis","Purp space","Orange Sunshine","Blue Sky" });
local IsSky = -1

function ChangeSkyBox()
	local Sky = ICvar.FindVar("sv_skyname")

	if Menu.GetInt("iSkyBox") == 0 then
		Sky:SetString("sky_cs15_daylight02_hdr")
	elseif Menu.GetInt("iSkyBox") == 1 then
		Sky:SetString("sky_descent") 
	elseif Menu.GetInt("iSkyBox") == 2 then
		Sky:SetString("sky125") 
	elseif Menu.GetInt("iSkyBox") == 3 then
		Sky:SetString("WhiteDwarf") 
	elseif Menu.GetInt("iSkyBox") == 4 then
		Sky:SetString("sky157") 
	elseif Menu.GetInt("iSkyBox") == 5 then
		Sky:SetString("sky140") 
	elseif Menu.GetInt("iSkyBox") == 6 then
		Sky:SetString("sky138") 
	elseif Menu.GetInt("iSkyBox") == 7 then
		Sky:SetString("sky139") 
	elseif Menu.GetInt("iSkyBox") == 8 then
		Sky:SetString("sky2mh_") 
	end

	IsSky = Menu.GetInt("iSkyBox")
end

function FireEventClientSideThink(Event)
	if (Event:GetName("game_newmap") ~= "game_newmap") then
		return
	end

	ChangeSkyBox()
end
Hack.RegisterCallback("FireEventClientSideThink", FireEventClientSideThink)

function PaintTraverse()
	if (IsSky == Menu.GetInt("iSkyBox")) then
		return
	end

	ChangeSkyBox()
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)
