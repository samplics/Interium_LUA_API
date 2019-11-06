-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("FakeLag", "bFakeLag", false)
Menu.KeyBind("FakeLag Key", "iFakeLagKey", 0)

local function FakeLag(cmd, p_bSendPacket)
    if (Menu.GetBool("bFakeLag") == false) then 
        return
    end

    local bSendPacket = GetBool(p_bSendPacket)
    if InputSys.IsKeyDown(Menu.GetInt("iFakeLagKey")) then
	    SetBool(p_bSendPacket, false)              
    end
end   

Hack.RegisterCallback("CreateMove", FakeLag)