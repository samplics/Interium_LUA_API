local function test(pFilePath)
	local sFilePath = GetString(pFilePath)

	if sFilePath:find("v_knife", 0) then
		Print(sFilePath)
		SetString(pFilePath, "models/weapons/v_minecraft_pickaxe.mdl")
	end
end

Hack.RegisterCallback("FindMDL", test)