-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Show Speed", "bShowSpeed", true)
Menu.Checkbox("Show Graph", "bShowGraph", true)
Menu.Checkbox("Only In Air", "bShowSpeed_OnlyAir", true)

-- Init Global
local MaxSpeed = 300
local vVelocity_Offset = Hack.GetOffset("DT_BasePlayer", "m_vecVelocity[0]")
local fFlags_Offset = Hack.GetOffset("DT_BasePlayer", "m_fFlags")
local Screen = IEngine.GetScreenSize()
local TicksShow = 0

-- Graph
local Mnoj = 5
local SpeedArray = { }
local SpeedArraySize = 200
for i = 1, SpeedArraySize do
    SpeedArray[i] = MaxSpeed / Mnoj
end

-- Customize Pos
local SpeedPos = Vector2D.new(Screen.x / 2, Screen.y / 2 + 25)
local GraphPos = Vector2D.new(Screen.x / 2 - SpeedArraySize / 2, Screen.y / 2 + 50)

-- For Vec
local function VecLenght(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
end
local function VecLenght2D(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y)
end

-- Func
local function RenderSpeed()
    if (Menu.GetBool("bShowSpeed") == false) then 
        return
    end
    if (Utils.IsLocalAlive() == false) then 
        return
    end

    local LocalPlayer = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 

    -- Only Air
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

    -- Show Speed
    local fSpeed = VecLenght2D(LocalPlayer:GetPropVector(vVelocity_Offset))
    local iSpeed = math.floor(fSpeed)

    local Raz = (MaxSpeed - fSpeed)
    local col = Color.new(0, 255, 0, 255)

    if Raz > 49 then
        col.r = col.r + (Raz / 1.18)
        col.g = (col.g - (Raz / 1.18)) / 1.25
    elseif Raz > 0 and Raz < 49 then
        col.r = col.r + (Raz / 1.18)
        col.g = (col.g - (Raz / 1.18))
    end

    Render.Text_TahomaBd(tostring(iSpeed), SpeedPos.x, SpeedPos.y, 18, col, true, true)

   -- For Only Air
    if (Menu.GetBool("bShowSpeed_OnlyAir") == true) then 
        TicksShow = TicksShow - 1
    end

    -- Show Grapth
    if (Menu.GetBool("bShowGraph") == false) then 
        return
    end

    for i = 2, SpeedArraySize do
        SpeedArray[i - 1] = SpeedArray[i]
    end
    SpeedArray[SpeedArraySize] = MaxSpeed / Mnoj - iSpeed / Mnoj

    for i = 2, SpeedArraySize do
        if (SpeedArray[i]) then
            local Raz = SpeedArray[i] * 5
            local col2 = Color.new(0, 255, 0, 255)
        
            if Raz > 49 then
                col2.r = col2.r + (Raz / 1.18)
                col2.g = (col2.g - (Raz / 1.18)) / 1.25
            elseif Raz > 0 and Raz < 49 then
                col2.r = col2.r + (Raz / 1.18)
                col2.g = (col2.g - (Raz / 1.18))
            end
            Render.Line(GraphPos.x + i - 1, GraphPos.y + SpeedArray[i - 1], GraphPos.x + i, GraphPos.y + SpeedArray[i], col2, 2)
        else
            break
        end
    end
    Render.Line(GraphPos.x + SpeedArraySize, GraphPos.y, GraphPos.x + SpeedArraySize, GraphPos.y + MaxSpeed / Mnoj, Color.new(255, 255, 255, 255), 2)

    SpeedArrayStep = SpeedArrayStep + 1
    if (SpeedArrayStep >= SpeedArraySize) then
        SpeedArrayStep = 0
    end
end

Hack.RegisterCallback("PaintTraverse", RenderSpeed)