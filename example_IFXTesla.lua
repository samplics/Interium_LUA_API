local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin")

local function CreateMove(pCmd, p_bSendPacket)
    if (not Utils.IsLocalAlive()) then 
        return
    end

	local LocalPlayer = IEntityList.GetPlayer(IEngine.GetLocalPlayer())
	local LocalPlayerOrigin = LocalPlayer:GetPropVector(vOrigin_Offset)
	LocalPlayerOrigin.z = LocalPlayerOrigin.z + 5

	local TeslaInfo = CTeslaInfo.new()
	TeslaInfo.m_flBeamWidth = 3
	TeslaInfo.m_flRadius = 425
	TeslaInfo.m_nEntIndex = IEngine.GetLocalPlayer()
	TeslaInfo.m_vColor.x = 1
	TeslaInfo.m_vColor.y = 0
	TeslaInfo.m_vColor.z = 0
	TeslaInfo.m_vPos = LocalPlayerOrigin
	TeslaInfo.m_flTimeVisible = 1.0
	TeslaInfo.m_nBeams = 12
	TeslaInfo.m_pszSpriteName = "sprites/white.vmt"
	IFX.Tesla(TeslaInfo)
end   
Hack.RegisterCallback("CreateMove", CreateMove)
