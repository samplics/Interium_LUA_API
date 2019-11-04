-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Show Speed", "bShowSpeed", false)
Menu.Checkbox("Only In Air", "bShowSpeed_OnlyAir", false)

-- Init Global
local vVelocity_Offset = Hack.GetOffset("DT_BasePlayer", "m_vecVelocity[0]")
local fFlags_Offset = Hack.GetOffset("DT_BasePlayer", "m_fFlags")
local Screen = IEngine.GetScreenSize()
local TicksShow = 0

-- Vec
local function VecLenght(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
end
local function VecLenght2D(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y)
end

-- func
local function RenderSpeed()
    if (Menu.GetBool("bShowSpeed") == false) then 
        return
    end
    if (Utils.IsLocalAlive() == false) then 
        return
    end

    local LocalPlayer = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 

    if (Menu.GetBool("bShowSpeed_OnlyAir") == true) then 
        local Flags = LocalPlayer:GetPropInt(fFlags_Offset)
        if (Flags == 256 or Flags == 262) then -- Air and Air+Duck
            TicksShow = 64
        else
            if (TicksShow == 0) then
                return
            end
        end
    end

    local fSpeed = VecLenght2D(LocalPlayer:GetPropVector(vVelocity_Offset))
    local iSpeed = math.floor(fSpeed)

    local Raz = (300 - fSpeed)
    local col = Color.new(0, 255, 0, 255)

    if Raz > 49 then
        col.r = col.r + (Raz / 1.18)
        col.g = (col.g - (Raz / 1.18)) / 1.25
    elseif Raz > 0 and Raz < 49 then
        col.r = col.r + (Raz / 1.18)
        col.g = (col.g - (Raz / 1.18))
    end

    Render.Text_TahomaBd(tostring(iSpeed), Screen.x / 2, Screen.y / 2 + 25, 18, col, true, true)

    if (Menu.GetBool("bShowSpeed_OnlyAir") == true) then 
        TicksShow = TicksShow - 1
    end
end

Hack.RegisterCallback("PaintTraverse", RenderSpeed)
