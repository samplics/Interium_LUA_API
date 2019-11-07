Menu.SliderFloat("Glowing Models", "fl_glowing", 0.01, 1.0, 0.1)
Menu.SliderFloat("Model Ambient", "fl_modelambient", 1.0, 10.0, 5)
Menu.SliderFloat("Bloom Scale", "fl_bloomscale", 1.0, 10.0, 5)

local Old_fl_glowing = 0
local Old_fl_modelambient = 0
local Old_fl_bloomscale = 0

local cvar = ICvar.FindVar("r_modelAmbientMin")
local m_bUseCustomAutoExposureMin = Hack.GetOffset("DT_EnvTonemapController", "m_bUseCustomAutoExposureMin")
local m_bUseCustomAutoExposureMax = Hack.GetOffset("DT_EnvTonemapController", "m_bUseCustomAutoExposureMax")
local m_flCustomAutoExposureMin = Hack.GetOffset("DT_EnvTonemapController", "m_flCustomAutoExposureMin")
local m_flCustomAutoExposureMax = Hack.GetOffset("DT_EnvTonemapController", "m_flCustomAutoExposureMax")
local m_flCustomBloomScale = Hack.GetOffset("DT_EnvTonemapController", "m_flCustomBloomScale")

local function GlowingModels()
    cvar:SetFloat(Menu.GetFloat("fl_modelambient"))

    for i = 1, IEntityList.GetHighestEntityIndex() do  
        local ent = IEntityList.GetEntity(i)
        if (ent and ent:GetClassId() == 69) then
            local brightness = Menu.GetFloat("fl_glowing")
            local bloom = Menu.GetFloat("fl_bloomscale")
    
            ent:SetPropBool(m_bUseCustomAutoExposureMin, true)
            ent:SetPropBool(m_bUseCustomAutoExposureMax, true)
            ent:SetPropFloat(m_flCustomAutoExposureMin, brightness)
            ent:SetPropFloat(m_flCustomAutoExposureMax, brightness)
            ent:SetPropFloat(m_flCustomBloomScale, bloom)
        end
    end
end


function PaintTraverse()
    if (Menu.GetFloat("fl_glowing") == Old_fl_glowing) and 
        (Menu.GetFloat("fl_modelambient") == Old_fl_modelambient) and 
        (Menu.GetFloat("fl_bloomscale") == Old_fl_bloomscale) then
		return
    end
    
    GlowingModels()

    Old_fl_glowing = Menu.GetFloat("fl_glowing")
    Old_fl_modelambient = Menu.GetFloat("fl_modelambient")
    Old_fl_bloomscale = Menu.GetFloat("fl_bloomscale")
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)

function FireEventClientSideThink(Event)
	if (Event:GetName("game_newmap") ~= "game_newmap") then
		return
    end
    
    GlowingModels()

    Old_fl_glowing = Menu.GetFloat("fl_glowing")
    Old_fl_modelambient = Menu.GetFloat("fl_modelambient")
    Old_fl_bloomscale = Menu.GetFloat("fl_bloomscale")
end
Hack.RegisterCallback("FireEventClientSideThink", FireEventClientSideThink)