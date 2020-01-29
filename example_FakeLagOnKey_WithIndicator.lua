-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("FakeLag", "bFakeLag", true)
Menu.KeyBind("FakeLag Key", "iFakeLagKey", 0)

local Screen = IEngine.GetScreenSize()
local function AntiLag(Strong)
	return (120.0 / Utils:GetFps());
end

local function Rainbow(Strong, Type, r, g, b)
	
	
	local NewStrong = Strong * AntiLag(Strong)

	if (Type == 0) then
		if (g < 255) then
			if (g + NewStrong > 255) then
				g = 255
			else
				g = g + NewStrong
			end
		else
			Type = Type + 1
		end
	elseif (Type == 1) then
		if (r > 0) then
			if (r - NewStrong < 0) then
				r = 0
			else
				r = r - NewStrong
			end
		else
			Type = Type + 1
		end
	elseif (Type == 2) then
		if (b < 255) then
			if (b + NewStrong > 255) then
				b = 255
			else
				b = b + NewStrong
			end
		else
			Type = Type + 1
		end
	elseif (Type == 3) then
		if (g > 0) then
			if (g - NewStrong < 0) then
				g = 0
			else
				g = g - NewStrong
			end
		else
			Type = Type + 1
		end
	elseif (Type == 4) then
		if (r < 255) then
			if (r + NewStrong > 255) then
				r = 255
			else
				r = r + NewStrong
			end
		else
			Type = Type + 1
		end
	elseif (Type == 5) then
		if (b > 0) then
			if (b - NewStrong < 0) then
				b = 0
			else
				b = b - NewStrong
			end
		else
			Type = 0
		end
	end

	return Strong, Type, r, g, b
end

    
Menu.SliderFloat("Speed1", "fStrongFakeLag", 0, 10, "%.1f", 1)
local Type = { 0, 0, 0, 0 }
local R = { 255, 0, 0, 0 }
local G = { 0, 255, 0, 0 }
local B = { 0, 0, 255, 0 }
text2 = "off"
function Indicator()
    local Strong = Menu.GetFloat("fStrongFakeLag")
    Strong, Type[1], R[1], G[1], B[1] = Rainbow(Strong, Type[1], R[1], G[1], B[1])
	Strong, Type[2], R[2], G[2], B[2] = Rainbow(Strong, Type[2], R[2], G[2], B[2])
	Strong, Type[3], R[3], G[3], B[3] = Rainbow(Strong, Type[3], R[3], G[3], B[3])
    Strong, Type[4], R[4], G[4], B[4] = Rainbow(Strong, Type[4], R[4], G[4], B[4])
    local col1 = Color.new(25, 25, 25, 155) -- цвет нижней полосочки
    local col3 = Color.new(255, 255, 255, 255) -- цвет текста
    Render.RectFilled(50, Screen.y / 2 - 30, 200, Screen.y / 2 + 20, col1, 0) -- нижняя полосочка
    Render.RectFilledMultiColor(
		50, Screen.y / 2 - 34, 200, Screen.y / 2 -30,
        Color.new(R[1], G[1], B[1], 255), --upper left
        Color.new(R[2], G[2], B[2], 255), --upper right
        Color.new(R[2], G[2], B[2], 255), --bottom right
        Color.new(R[1], G[1], B[1], 255)--bottom left

    )

   
    Render.Text_TahomaBd("FakeLag   -", 70, Screen.y / 2 - 15, 17, col3, false, false) -- текст
    Render.Text_TahomaBd(text2, 170, Screen.y / 2 - 15, 17, col3, true, false) -- текст
end


local function FakeLag(cmd, p_bSendPacket)

    if (Menu.GetBool("bFakeLag") == false) then 
        return
    end
   
    local bSendPacket = GetBool(p_bSendPacket)
    if InputSys.IsKeyDown(Menu.GetInt("iFakeLagKey")) then
        SetBool(p_bSendPacket, false)      
        text2 = "on"
    else
        text2 = "off"
    end
    
end   
Hack.RegisterCallback("PaintTraverse", Indicator)
Hack.RegisterCallback("CreateMove", FakeLag)