local ISurfaceFont = 0 -- Do not Init, CreateFont_ creating Font to this Var

local PathToFont = "C:\\verdana.ttf"

local FontInited = false
function InitFont()
	if (not FontInited) then
		-- Init Render. Font
		if (not Render.IsFont("FontNameLol")) then
			Render.LoadFont("FontNameLol", PathToFont, 32)
		end
		
		-- Create ISurface. Font
		ISurfaceFont = ISurface.CreateFont_()
		
		-- Init ISurface. Font
		ISurface.SetFontGlyphSet(ISurfaceFont, "Tahoma", 32, 600, 0, 0, 0x080, 0, 0)
		
		-- Change Hack Fonts (0 = Default, 1 = Second, 2 = Icon, 3 = Roboto, 4 = MenuMain, 5 = MenuTabMain, 6 = MenuTabIcon)
		Render.ChangeHackFont(0, PathToFont, 14) -- Change HackFont (Default) to *PathToFont* with size 14 (this size is quality of load)
		Render.ChangeHackFont(1, PathToFont, 14) -- Change HackFont (Second) to *PathToFont* with size 14 (this size is quality of load)
		Render.ChangeHackFont(3, PathToFont, 14) -- Change HackFont (Roboto) to *PathToFont* with size 14 (this size is quality of load)
		Render.ChangeHackFont(4, PathToFont, 14) -- Change HackFont (MenuMain) to *PathToFont* with size 14 (this size is quality of load)
		Render.ChangeHackFont(5, PathToFont, 14) -- Change HackFont (MenuTabMain) to *PathToFont* with size 14 (this size is quality of load)
		FontInited = true
	end
end

function Draw()
	InitFont()

	-- Clasic Hack Render (Better)
	Render.Text("Text1", 100, 100, 32, Color.new(255, 0, 0, 255), true, true, "FontNameLol")
	
	-- ISurface Render 
	ISurface.DrawText(ISurfaceFont, 150, 150, Color.new(255, 0, 0, 255), 0, "Text2")
end
Hack.RegisterCallback("PaintTraverse", Draw)
