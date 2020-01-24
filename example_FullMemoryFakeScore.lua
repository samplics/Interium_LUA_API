local iKill_Offset = 3116  -- Offset for m_iKill
local dwPlayerResource = 51822652 -- Address for PlayerResource pointer

local Inited = 0
local Kills = 69

function TestHardFakeScore()
    if (not Utils.IsLocal()) then
       return
    end

    local ClientDLL = Hack.GetModuleHandle("client_panorama.dll"); -- Get client_panorama.dll module from csgo.exe
    Print(tostring(ClientDLL))

    local pPlayerResource = GetIntA(ClientDLL + dwPlayerResource) -- Get pointer for geting value (Address) from it
    Print(tostring(pPlayerResource))

    local LocalKillsAddress = pPlayerResource + iKill_Offset + IEngine.GetLocalPlayer() * 4 -- Geted address + offset (iKill_Offset + g_LocalPlayer ID in EntList * size of struct)
    local LocalKillsReadOnly = GetIntA(LocalKillsAddress) -- geting value (Kills) from variable in this address
    Print(tostring(LocalKillsReadOnly))

    SetIntA(LocalKillsAddress, Kills) -- seting value (Kills) from variable in this address
end

function PT()
    if (Inited == 1) then
        return
    end

    TestHardFakeScore()
    Inited = Inited + 1
end
Hack.RegisterCallback("PaintTraverse", PT)

local function Func(Event)
    if (not Utils.IsLocal()) then
        return
     end

    if (Event:GetName() == "player_death") then
        local IsLocalKilled = IEngine.GetPlayerForUserID(Event:GetInt("attacker", 0)) == IEngine.GetLocalPlayer()
        if (IsLocalKilled) then
            Kills = Kills + 1
            Inited = -64
        end
    end 
end

Hack.RegisterCallback("FireEventClientSideThink", Func)