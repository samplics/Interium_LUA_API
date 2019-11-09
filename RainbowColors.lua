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

-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()

Menu.SliderFloat("Strong", "fStrong", 0, 10, "%.1f", 1)

Menu.Spacing()
Menu.Spacing()

Menu.Checkbox("Rainbow Chams Enemy Visible", "color_chams_enemy_visible", false)
Menu.Checkbox("Rainbow Chams Enemy Hidden", "color_chams_enemy_hidden", false)
Menu.Checkbox("Rainbow Chams Team Visible", "color_chams_team_visible", false)
Menu.Checkbox("Rainbow Chams Team Hidden", "color_chams_team_hidden", false)
Menu.Checkbox("Rainbow Glow Enemy Visible", "color_glow_enemy_visible", false)
Menu.Checkbox("Rainbow Glow Enemy Hidden", "color_glow_enemy_hidden", false)
Menu.Checkbox("Rainbow Glow Team Visible", "color_glow_team_visible", false)
Menu.Checkbox("Rainbow Glow Team Hidden", "color_glow_team_hidden", false)

Menu.Spacing()
Menu.Spacing()

Menu.Checkbox("Rainbow Chams Local Weapon", "color_chams_local_weapon", false)
Menu.Checkbox("Rainbow Chams Local Sleeve", "color_chams_local_sleeve", false)
Menu.Checkbox("Rainbow Chams Local Arms", "color_chams_local_arms", false)
Menu.Checkbox("Rainbow Glow Local Weapon", "color_glow_local_weapon", false)
Menu.Checkbox("Rainbow Glow Local Sleeve", "color_glow_local_sleeve", false)
Menu.Checkbox("Rainbow Glow Local Arms", "color_glow_local_arms", false)

Menu.Spacing()
Menu.Spacing()

Menu.Checkbox("Rainbow Sound ESP", "color_esp_sound", false)

-- Init Vars
local ChamsType = 0
local ChamsR = 0.0
local ChamsG = 0.0
local ChamsB = 0.0

function PaintTraverse()
	local Strong = Menu.GetFloat("fStrong")
	Strong, ChamsType, ChamsR, ChamsG, ChamsB = Rainbow(Strong, ChamsType, ChamsR, ChamsG, ChamsB)

	if (Menu.GetBool("color_chams_enemy_visible")) then
		SetColor(Vars.color_chams_enemy_visible, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_chams_enemy_hidden")) then
		SetColor(Vars.color_chams_enemy_hidden, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_chams_team_visible")) then
		SetColor(Vars.color_chams_team_visible, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_chams_team_hidden")) then
		SetColor(Vars.color_chams_team_hidden, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_enemy_visible")) then
		SetColor(Vars.color_glow_enemy_visible, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_enemy_hidden")) then
		SetColor(Vars.color_glow_enemy_hidden, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_team_visible")) then
		SetColor(Vars.color_glow_team_visible, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_team_hidden")) then
		SetColor(Vars.color_glow_team_hidden, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end

	if (Menu.GetBool("color_chams_local_weapon")) then
		SetColor(Vars.color_chams_local_weapon, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_chams_local_sleeve")) then
		SetColor(Vars.color_chams_local_sleeve, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_chams_local_arms")) then
		SetColor(Vars.color_chams_local_arms, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_local_weapon")) then
		SetColor(Vars.color_glow_local_weapon, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_local_sleeve")) then
		SetColor(Vars.color_glow_local_sleeve, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
	if (Menu.GetBool("color_glow_local_arms")) then
		SetColor(Vars.color_glow_local_arms, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end

	if (Menu.GetBool("color_esp_sound")) then
		SetColor(Vars.color_esp_sound, Color.new(ChamsR, ChamsG, ChamsB, 255))
	end
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)