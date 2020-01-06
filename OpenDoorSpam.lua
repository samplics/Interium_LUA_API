-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.KeyBind("Open Door Spam", "iDoorSpamKey", 0)

local IN_USE = 5 -- bit of IN_USE for cmd.buttons
local IsUsed = false

function DoorSpam(pCmd, pSendPacket)
    if InputSys.IsKeyDown(Menu.GetInt("iDoorSpamKey")) then
        if (IsUsed) then
          pCmd.buttons = SetBit(pCmd.buttons, IN_USE)
        else
            pCmd.buttons = DelBit(pCmd.buttons, IN_USE)
        end

        IsUsed = not IsUsed
    end 
end   

Hack.RegisterCallback("CreateMove", DoorSpam)