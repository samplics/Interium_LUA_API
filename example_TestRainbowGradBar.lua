-- FUNCS FOR RAINBOW
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

-- Init Vars
local Type = { 0, 0, 0, 0 }
local R = { 255, 0, 0, 0 }
local G = { 0, 255, 0, 0 }
local B = { 0, 0, 255, 0 }

function PaintTraverse()
	local Strong = 1

	Print("1")

	Strong, Type[1], R[1], G[1], B[1] = Rainbow(Strong, Type[1], R[1], G[1], B[1])
	Strong, Type[2], R[2], G[2], B[2] = Rainbow(Strong, Type[2], R[2], G[2], B[2])
	Strong, Type[3], R[3], G[3], B[3] = Rainbow(Strong, Type[3], R[3], G[3], B[3])
	Strong, Type[4], R[4], G[4], B[4] = Rainbow(Strong, Type[4], R[4], G[4], B[4])

	Print("2")

	Render.RectFilledMultiColor(50, 50, 1000, 55, Color.new(R[1], G[1], B[1], 255), Color.new(R[2], G[2], B[2], 255), Color.new(R[2], G[2], B[2], 255), Color.new(R[1], G[1], B[1], 255))

	Print("3")
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)