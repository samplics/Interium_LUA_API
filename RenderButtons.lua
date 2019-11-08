-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Show Buttons", "bShowButtons", true)

-- Init Global
local Screen = IEngine.GetScreenSize()

-- Customize
local x = Screen.x / 2
local y = Screen.y - 150
local ButonSize = 50
local Offset = 10
local TextSize = 18
local col1 = Color.new(100, 100, 100, 255)
local col2 = Color.new(255, 255, 255, 255)
local col3 = Color.new(0, 0, 0, 255)

--
local w = Offset * 2 + ButonSize * 3
local h = Offset * 2 + ButonSize * 3

function RenderButton(VK_ID, x1, y1, w, h, Text)
	if InputSys.IsKeyDown(VK_ID) then
		Render.RectFilled(x1, y1, x1 + w, y1 + h, col2, 5) 
	else
		Render.RectFilled(x1, y1, x1 + w, y1 + h, col1, 5)         
	end

	Render.Text_TahomaBd(Text, x1 + h / 2, y1 + h / 2 - TextSize / 2, TextSize, col3, true, false)
end

function RenderButtons()
    if (Menu.GetBool("bShowButtons") == false) then 
        return
    end

	RenderButton(0x01, x - w / 2, y - h / 2, ButonSize, ButonSize, "M1")
	RenderButton(0x57, x - w / 2 + ButonSize + Offset, y - h / 2, ButonSize, ButonSize, "W")
	RenderButton(0x02, x - w / 2 + ButonSize * 2 + Offset * 2, y - h / 2, ButonSize, ButonSize, "M2")

	RenderButton(0x41, x - w / 2, y - h / 2 + ButonSize + Offset, ButonSize, ButonSize, "A")
	RenderButton(0x53, x - w / 2 + ButonSize + Offset, y - h / 2 + ButonSize + Offset, ButonSize, ButonSize, "S")
	RenderButton(0x44, x - w / 2 + ButonSize * 2 + Offset * 2, y - h / 2 + ButonSize + Offset, ButonSize, ButonSize, "D")

	RenderButton(0x10, x - w / 2, y - h / 2 + ButonSize * 2 + Offset * 2, ButonSize, ButonSize, "Shift")
	RenderButton(0x20, x - w / 2 + ButonSize + Offset, y - h / 2 + ButonSize * 2 + Offset * 2, ButonSize, ButonSize, "Space")
	RenderButton(0x11, x - w / 2 + ButonSize * 2 + Offset * 2, y - h / 2 + ButonSize * 2 + Offset * 2, ButonSize, ButonSize, "Ctrl")
end
Hack.RegisterCallback("PaintTraverse", RenderButtons)

