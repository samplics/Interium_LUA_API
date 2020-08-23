local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin")

local function CreateMove(pCmd, p_bSendPacket)
    if (not Utils.IsLocalAlive()) then 
        return
    end
	
	local LocalPlayer = IEntityList.GetPlayer(IEngine.GetLocalPlayer())
	local LocalPlayerOrigin = LocalPlayer:GetPropVector(vOrigin_Offset)
	LocalPlayerOrigin.z = LocalPlayerOrigin.z + 100

	local pElight = CEffectData.new()
	pElight.m_fFlags = 6
	pElight.m_vOrigin = LocalPlayerOrigin;
	pElight.m_vNormal = Vector.new(-1, 1, -2)
	pElight.m_flScale = 7
	pElight.m_nColor = 2

	IFX.BloodSpray(pElight)
end   
Hack.RegisterCallback("CreateMove", CreateMove)