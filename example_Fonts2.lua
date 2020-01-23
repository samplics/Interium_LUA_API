local FontInited = false
function Fonts()
	if (not FontInited) then
		-- Change Hack Fonts (0 = Default, 1 = Second, 2 = Icon, 3 = Roboto, 4 = MenuMain, 5 = MenuTabMain, 6 = MenuTabIcon)
		--Render.ChangeHackFont(0, "C:\\Windows\\Fonts\\tahomabd.ttf", 16)
		--Render.ChangeHackFont(4, "C:\\Windows\\Fonts\\tahomabd.ttf", 16)
		Render.ChangeHackFont(0, "C:\\DroidSansBold.ttf", 16)
		Render.ChangeHackFont(4, "C:\\DroidSansBold.ttf", 16)
		--Render.ChangeHackFont(0, "C:\\DroidSans.ttf", 16)
		--Render.ChangeHackFont(4, "C:\\DroidSans.ttf", 16)
		
		FontInited = true
	end
end
Hack.RegisterCallback("PaintTraverse", Fonts)




