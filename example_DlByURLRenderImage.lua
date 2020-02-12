Render.DelImage("ImageNameXd")

local ImageInited = false
function InitImage()
	if (not ImageInited) then
		-- Download from url to path
		URLDownloadToFile("https://i.imgur.com/qo1D8j8.png", "D:\\lol.png")
	
		-- Init Render. Image
		if (not Render.IsImage("ImageNameXd")) then
			Render.LoadImage("ImageNameXd", "D:\\lol.png")
		end
		
		ImageInited = true
	end
end

function Draw()
	InitImage()
	
	-- Render Image
	Render.RenderImage("ImageNameXd", 300, 500, 1000, 1000, Color.new(255, 255, 255, 255), 0, 0, 1, 1) 
end
Hack.RegisterCallback("PaintTraverse", Draw)
