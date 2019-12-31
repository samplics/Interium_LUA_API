-- Create Var this Font for ISurface.
local ISurfaceFont = 0 -- Do not Init, CreateFont_ creating Font to this Var
-- Init to Var ID [0...15] for Render.
local RenderFontID = 7 -- [0..15], only 16 Fonts can use for Render.

local FontInited = false
function InitFont()
	if (not FontInited) then
		-- Init Render. Font
		Render.LoadFont(RenderFontID, "C:\\Windows\\Fonts\\tahomabd.ttf", 32)
		
		-- Create ISurface. Font
		ISurfaceFont = ISurface.CreateFont_()
		-- Init ISurface. Font
		ISurface.SetFontGlyphSet(ISurfaceFont, "Tahoma", 32, 600, 0, 0, 0x080, 0, 0)
		
		
		-- Change Hack Fonts (0 = Default, 1 = Second, 2 = Icon, 3 = Roboto, 4 = MenuMain, 5 = MenuTabMain, 6 = MenuTabIcon)
		Render.ChangeHackFont(4, "C:\\Windows\\Fonts\\tahomabd.ttf", 32)
		
		FontInited = true
	end
end

function Draw()
	InitFont()
	
	-- Clasic Hack Render (Better)
	Render.Text("Lol", 100, 100, 32, Color.new(255, 0, 0, 255), true, true, RenderFontID)
	
	-- ISurface Render 
	ISurface.DrawText(ISurfaceFont, 200, 200, Color.new(255, 0, 0, 255), 0, "Lol")
end
Hack.RegisterCallback("PaintTraverse", Draw)


