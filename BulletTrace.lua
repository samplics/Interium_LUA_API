IGameEventListener.AddEvent("bullet_impact", false)
    
local function Func(Event)
    local Player = IEntityList.GetPlayer(IEngine.GetLocalPlayer())
    local IsLocalShot = IEngine.GetPlayerForUserID(Event:GetInt("userid", 0)) == IEngine.GetLocalPlayer()

    if Event:GetName("bullet_impact") and IsLocalShot and Event:GetInt("x", 0) ~= 0 then
        local BeamInfo = BeamInfo_t.new()
        BeamInfo.m_nType = 0
        BeamInfo.m_pszModelName = "sprites/purplelaser1.vmt"
        BeamInfo.m_nModelIndex = -1
        BeamInfo.m_flHaloScale = 0.0
        BeamInfo.m_flLife = 3.0
        BeamInfo.m_flWidth = 5.0
        BeamInfo.m_flEndWidth = 3.0
        BeamInfo.m_flFadeLength = 0.0
        BeamInfo.m_flAmplitude = 2.0
        BeamInfo.m_flBrightness = 255
        BeamInfo.m_flSpeed = 0.5
        BeamInfo.m_nStartFrame = 0.
        BeamInfo.m_flFrameRate = 0.
        BeamInfo.m_flRed = 255
        BeamInfo.m_flGreen = 0
        BeamInfo.m_flBlue = 0
        BeamInfo.m_nSegments = 2
        BeamInfo.m_bRenderable = true
        BeamInfo.m_nFlags = 0
        BeamInfo.m_vecStart = Player:GetEyePos()
        BeamInfo.m_vecEnd = Vector.new(Event:GetInt("x", 0), Event:GetInt("y", 0), Event:GetInt("z", 0))

        local Beam = IRenderBeams.CreateBeamPoints(BeamInfo)
        if Beam then
            IRenderBeams.DrawBeam(Beam)
        end
    end
end

Hack.RegisterCallback("FireEventClientSideThink", Func)