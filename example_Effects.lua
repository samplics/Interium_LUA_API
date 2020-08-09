local vOrigin_Offset = Hack.GetOffset("DT_BaseEntity", "m_vecOrigin")

local function CreateMove(pCmd, p_bSendPacket)
    if (not Utils.IsLocalAlive()) then 
        return
    end
	
	local LocalPlayer = IEntityList.GetPlayer(IEngine.GetLocalPlayer())
	local LocalPlayerOrigin = LocalPlayer:GetPropVector(vOrigin_Offset)
	LocalPlayerOrigin.z = LocalPlayerOrigin.z + 5

	local pElight = IEffects.CL_AllocDlight(IEngine.GetLocalPlayer())
	pElight.r = 255
	pElight.g = 255
	pElight.b = 255
	pElight.exponent = 8
	pElight.m_Direction = LocalPlayerOrigin
	pElight.origin = LocalPlayerOrigin
	pElight.radius = 200.0
	pElight.die = IGlobalVars.curtime + 0.1
	pElight.decay = 1.0
	pElight.key = IEngine.GetLocalPlayer()
end   
Hack.RegisterCallback("CreateMove", CreateMove)