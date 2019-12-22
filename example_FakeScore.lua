local iKill_Offset = Hack.GetOffset("DT_PlayerResource", "m_iKill") -- Get m_iKill offset

local Inited = 0
local Kills = 69

function TestFakeScore()
    if (not Utils.IsLocal()) then
       return
    end

    local pLocal = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
    local pLocalResource = pLocal:GetPlayerResource()

    pLocalResource:SetPropInt(iKill_Offset, Kills) 
end

function PT()
    if (Inited == 1) then
        return
    end

    TestFakeScore()
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