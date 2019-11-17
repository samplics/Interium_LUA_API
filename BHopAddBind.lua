-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.KeyBind("BHop Add New Key", "iBHopAddBind", 0)

local IN_JUMP = 1 -- bit of IN_JUMP for cmd.buttons

local function BHopAddBind(pCmd, pSendPacket)
    if InputSys.IsKeyDown(Menu.GetInt("iBHopAddBind")) then
        pCmd.buttons = SetBit(pCmd.buttons, IN_JUMP)
    end 
end   

Hack.RegisterCallback("CreateMove", BHopAddBind)