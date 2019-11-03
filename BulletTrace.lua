-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Bullet Trace", "bBuletTrace", false)
Menu.ColorPicker("Bullet Trace Color", "cBuletTrace", 255, 0, 0, 255)

-- Init Event
IGameEventListener.AddEvent("bullet_impact", false)
    
-- Func
local function Func(Event)
    if (Menu.GetBool("bBuletTrace") == false) then
        return
    end 
    if (Event:GetName("bullet_impact") ~= "bullet_impact") or (Event:GetInt("x", 0) == 0) then
        return
    end 

    local IsLocalShot = IEngine.GetPlayerForUserID(Event:GetInt("userid", 0)) == IEngine.GetLocalPlayer()
    if (IsLocalShot == false) then
        return
    end 

    local Player = IEntityList.GetPlayer(IEngine.GetLocalPlayer())
    local col = Menu.GetColor("cBuletTrace")

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
    BeamInfo.m_flBrightness = col.a * 255
    BeamInfo.m_flSpeed = 0.5
    BeamInfo.m_nStartFrame = 0.
    BeamInfo.m_flFrameRate = 0.
    BeamInfo.m_flRed = col.r * 255
    BeamInfo.m_flGreen = col.g * 255
    BeamInfo.m_flBlue = col.b * 255
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

-- Hook
Hack.RegisterCallback("FireEventClientSideThink", Func)