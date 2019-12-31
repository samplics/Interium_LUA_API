-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Move Ind", "bMoveInd", true)

-- Func
local function RenderSpeed()
    if (Menu.GetBool("bMoveInd") == false) then 
        return
    end
    if (Utils.IsLocalAlive() == false) then 
        return
    end

    local Count = 1

	local Pos = { 0, 0, 0 }
	if (GetBool(Vars.misc_jumpbug) and (Globals.IsJumpBug())) then
		Pos[0] = 25 * Count
		Count = Count + 1
    end

	if (GetBool(Vars.misc_autostrafe) and GetInt(Vars.misc_autostrafe_enabletype) and (Globals.IsAutoStrafe())) then
		Pos[1] = 25 * Count
		Count = Count + 1
    end

	if (GetBool(Vars.misc_autoduck) and GetInt(Vars.misc_autoduck_enabletype) and (Globals.IsAutoDuck())) then
		Pos[2] = 25 * Count
		Count = Count + 1
    end

	if (GetBool(Vars.misc_jumpbug) and (Globals.IsJumpBug())) then
        Render.Text_TahomaBd("JB", (Globals.ScreenWidth()) / 2, (Globals.ScreenHeight()) / 2 + (25 + Pos[0]), 24, Color.new(255, 50, 50, 255), true, true)
    end

	if (GetBool(Vars.misc_autostrafe) and GetInt(Vars.misc_autostrafe_enabletype) and (Globals.IsAutoStrafe())) then
        Render.Text_TahomaBd("AS", (Globals.ScreenWidth()) / 2, (Globals.ScreenHeight()) / 2 + (25 + Pos[1]), 24, Color.new(50, 255, 50, 255), true, true)
    end

	if (GetBool(Vars.misc_autoduck) and GetInt(Vars.misc_autoduck_enabletype) and (Globals.IsAutoDuck())) then
        Render.Text_TahomaBd("AD", (Globals.ScreenWidth()) / 2, (Globals.ScreenHeight()) / 2 + (25 + Pos[2]), 24, Color.new(50, 50, 255, 255), true, true)
    end
end

Hack.RegisterCallback("PaintTraverse", RenderSpeed)