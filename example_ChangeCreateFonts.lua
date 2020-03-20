local ISurfaceFont = 0 -- Not Inited, CreateFont_ creating Font to this Var
Render.DelFont("FontNameLol")

local PathToFont = "C:\\Cramaten.ttf"
local FontName = "Cramaten"

local HackFontPlace = 0
local FontInited = false
function InitFont()
	if (not FontInited) then

		if (not Render.IsFont("FontNameLol")) then
			-- Init Render. Font
			Render.LoadFont("FontNameLol", PathToFont, 32)
		end
		
		if (ISurfaceFont == 0) then
			-- Create ISurface. Font
			ISurfaceFont = ISurface.CreateFont_()
			-- Init ISurface. Font
			ISurface.SetFontGlyphSet(ISurfaceFont, FontName, 32, 600, 0, 0, 0x080, 0, 0)
		end
		

		-- Change Hack Fonts (0 = Default, 1 = Second, 2 = Icon, 3 = Roboto, 4 = MenuMain, 5 = MenuTabMain, 6 = MenuTabIcon)
		if (HackFontPlace == 0) then
			Render.ChangeHackFont(0, PathToFont, 14) -- Change HackFont (Default) to *PathToFont* with size 14 (this size is quality of load)
		elseif (HackFontPlace == 1) then
			Render.ChangeHackFont(1, PathToFont, 14) -- Change HackFont (Second) to *PathToFont* with size 14 (this size is quality of load)
		--elseif (HackFontPlace == 2) then
		--	Render.ChangeHackFont(2, PathToFont, 14)
		elseif (HackFontPlace == 3) then
			Render.ChangeHackFont(3, PathToFont, 14) -- Change HackFont (Roboto) to *PathToFont* with size 14 (this size is quality of load)
		elseif (HackFontPlace == 4) then
			Render.ChangeHackFont(4, PathToFont, 14) -- Change HackFont (MenuMain) to *PathToFont* with size 14 (this size is quality of load)
		elseif (HackFontPlace == 5) then
			Render.ChangeHackFont(5, PathToFont, 14) -- Change HackFont (MenuTabMain) to *PathToFont* with size 14 (this size is quality of load)
		end
		
		HackFontPlace = HackFontPlace + 1
		if (HackFontPlace > 5) then
			FontInited = true
		end
	end
end

function Draw()
	InitFont()

	-- Clasic Hack Render (Better)
	Render.Text("Text1", 100, 100, 32, Color.new(255, 255, 255, 255), true, true, "FontNameLol")
	
	-- ISurface Render 
	ISurface.DrawText(ISurfaceFont, 150, 150, Color.new(255, 255, 255, 255), 0, "Text2")
end
Hack.RegisterCallback("PaintTraverse", Draw)
