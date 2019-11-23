local CvarX = ICvar.FindVar("viewmodel_offset_x")
local CvarY = ICvar.FindVar("viewmodel_offset_y")
local CvarZ = ICvar.FindVar("viewmodel_offset_z")
local x_old = CvarX:GetFloat()
local y_old = CvarY:GetFloat()
local z_old = CvarZ:GetFloat()

-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.SliderFloat("View Model X", "viewmodel_offset_x", -50, 50, "%.1f", CvarX:GetFloat())
Menu.SliderFloat("View Model Y", "viewmodel_offset_y", -50, 50, "%.1f", CvarY:GetFloat())
Menu.SliderFloat("View Model Z", "viewmodel_offset_z", -50, 50, "%.1f", CvarZ:GetFloat())

function ChangeVar()
    ICvar.FindVar("sv_competitive_minspec"):SetInt(0)
    ICvar.FindVar("cl_bobcycle"):SetFloat(1)

    CvarX:SetFloat(Menu.GetFloat("viewmodel_offset_x"))
    CvarY:SetFloat(Menu.GetFloat("viewmodel_offset_y"))
    CvarZ:SetFloat(Menu.GetFloat("viewmodel_offset_z"))

    x_old = CvarX:GetFloat()
    y_old = CvarY:GetFloat()
    z_old = CvarZ:GetFloat()
end

function PaintTraverse()
    if (x_old == Menu.GetFloat("viewmodel_offset_x")) and (y_old == Menu.GetFloat("viewmodel_offset_y")) and (z_old == Menu.GetFloat("viewmodel_offset_z")) then 
        return
    end

    ChangeVar()
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)

function FireEventClientSideThink(Event)
	if (Event:GetName() ~= "cs_pre_restart") and (Event:GetName() ~= "game_newmap") then
		return
	end

	ChangeVar()
end
Hack.RegisterCallback("FireEventClientSideThink", FireEventClientSideThink)
