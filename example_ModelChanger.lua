function FindMDL(pFilePath)
	local sFilePath = GetString(pFilePath)

	if (sFilePath:find("v_knife", 0)) then -- find all viewmodel knifes
		SetString(pFilePath, "models/weapons/v_minecraft_pickaxe.mdl") -- Set Knife Model to Minecraft Pickaxe (need model file in this path)
	end
end
Hack.RegisterCallback("FindMDL", FindMDL)