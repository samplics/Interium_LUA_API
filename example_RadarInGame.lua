-- global variable
local bSpotted_Offset = Hack.GetOffset("DT_BaseEntity", "m_bSpotted") -- Get m_bSpotted offset

local function RadarInGame(stage) -- Func RadarInGame with Param stage (getting from FrameStageNotify hook)
    if stage ~= 1 or Utils.IsLocal() == false then -- stage != FAME_NET_UPDATE_START || !IsLocal
        return
    end

    for i = 1, 64 do -- Cycle 1 to 64 (Player List)
        local Player = IEntityList.GetPlayer(i) -- GetPlayerByIndex
        if Player and Player:GetClassId() == 40 and Player:IsAlive() and Player:IsDormant() == false then -- Player && IsPlayer && IsAlive && !IsDormant
                Player:SetPropBool(bSpotted_Offset, true) -- variable m_bSpotted = true
        end
    end
end

Hack.RegisterCallback("FrameStageNotify", RadarInGame) -- Func RadarInGame to FrameStageNotify hook