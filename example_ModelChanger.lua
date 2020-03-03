Utils.AttachConsole()

function FindMDL(pFilePath)
	local sFilePath = GetString(pFilePath)

	if (sFilePath:find("v_knife", 0)) then
		Utils.ConsolePrint(string.format("%s %s", sFilePath, "\n"));

		SetString(pFilePath, "models/weapons/v_minecraft_pickaxe.mdl")
	end
end
Hack.RegisterCallback("FindMDL", FindMDL)
