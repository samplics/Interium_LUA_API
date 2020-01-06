-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Jump Trail", "bJumpTrail", true)
Menu.ColorPicker("Jump Trail Color", "cJumpTrail", 0, 255, 0, 255)

local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin") -- Get m_vecOrigin offset
local fFlags_Offset = Hack.GetOffset("DT_BasePlayer", "m_fFlags")

local ON_GROUND = 0
local LocalOrigin_Old = Vector.new(0, 0, 0)

local IgonreTicks = 4 -- Optimize (More == Better FPS)
local Tick = 0

local function BHopAddBind(pCmd, pSendPacket)
    if Utils.IsLocalAlive() == false then 
        return
    end

    local pLocal = IEntityList.GetPlayer(IEngine.GetLocalPlayer()) 
    local LocalOrigin = pLocal:GetPropVector(vOrigin_Offset)
    local LocalFlags = pLocal:GetPropInt(fFlags_Offset)

    if (not IsBit(LocalFlags, ON_GROUND) and Tick == 0) then
        local col = Menu.GetColor("cJumpTrail")

        local BeamInfo = BeamInfo_t.new()
        BeamInfo.m_nType = 0
        BeamInfo.m_pszModelName = "sprites/purplelaser1.vmt"
        BeamInfo.m_nModelIndex = -1
        BeamInfo.m_flHaloScale = 0.0
        BeamInfo.m_flLife = 2.0
        BeamInfo.m_flWidth = 5
        BeamInfo.m_flEndWidth = 5
        BeamInfo.m_flFadeLength = 0.0
        BeamInfo.m_flAmplitude = 2.0
        BeamInfo.m_flBrightness = col.a
        BeamInfo.m_flSpeed = 0.5
        BeamInfo.m_nStartFrame = 0.
        BeamInfo.m_flFrameRate = 0.
        BeamInfo.m_flRed = col.r
        BeamInfo.m_flGreen = col.g
        BeamInfo.m_flBlue = col.b
        BeamInfo.m_nSegments = 2
        BeamInfo.m_bRenderable = true
        BeamInfo.m_nFlags = 0
        BeamInfo.m_vecStart = LocalOrigin_Old
        BeamInfo.m_vecEnd = LocalOrigin

        local Beam = IRenderBeams.CreateBeamPoints(BeamInfo)

    end 

    if (Tick == 0) then
        LocalOrigin_Old = LocalOrigin
        Tick = IgonreTicks
    end
    Tick = Tick - 1
end   

Hack.RegisterCallback("CreateMove", BHopAddBind)