-- Settings
local Strong = 1.0

-- Global
local Rainbow = 0.0

-- Funcs
local function hsv2rgb(h, s, v, a)
    local r, g, b
  
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
  
    i = i % 6
  
    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
  
    return r * 255, g * 255, b * 255, a * 255
end

-- Start
function PaintTraverse()
    Rainbow = Rainbow + (IGlobalVars.frametime * (Strong / 10))
    if Rainbow > 1.0 then Rainbow = 0.0 end

    Render.Text_TahomaBd("TestText", Globals.ScreenWidth() - 100, 5, 16,  Color.new(hsv2rgb(Rainbow, 1, 1, 1)), true, true)
    Render.Text_TahomaBd("[ " .. tostring(GetTimeDay()) .. " | " .. tostring(GetTimeMonth()) .. " | " .. tostring(GetTimeYear()) .. " ]", Globals.ScreenWidth() - 100, 25, 16,  Color.new(hsv2rgb(Rainbow, 1, 1, 1)), true, true)
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)