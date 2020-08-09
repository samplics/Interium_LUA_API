local ChatType = ""
local ChatName = ""
local ChatText = ""

function GetChat(msg_data)
	local SpaceIdx = 0
	for i = 1, string.len(msg_data) do
		if (string.byte(string.sub(msg_data, i, i)) == 34) then -- lmao, idk why lua cant find " ", 34 = char byte
			SpaceIdx = i
			break
		end
	end

	ChatName = string.sub(msg_data, 1, SpaceIdx)
	ChatText = string.sub(msg_data, SpaceIdx)

	-- Output
	Print(" ")
	Print(ChatType)
	Print(ChatName)
	Print(ChatText)
end

function ChatHook(type, a3, length, msg_data)
	if (msg_data:find("Cstrike_Chat_All", 0)) then
		ChatType = "Cstrike_Chat_All"
		msg_data = string.sub(msg_data, string.find(msg_data, "Cstrike_Chat_All") + string.len("Cstrike_Chat_All") + 1)
		GetChat(msg_data)
	elseif (msg_data:find("Cstrike_Chat_CT", 0)) then
		ChatType = "Cstrike_Chat_CT"
		msg_data = string.sub(msg_data, string.find(msg_data, "Cstrike_Chat_CT") + string.len("Cstrike_Chat_CT") + 1)
		GetChat(msg_data)
	elseif (msg_data:find("Cstrike_Chat_T", 0)) then
		ChatType = "Cstrike_Chat_T"
		msg_data = string.sub(msg_data, string.find(msg_data, "Cstrike_Chat_T") + string.len("Cstrike_Chat_T") + 1)
		GetChat(msg_data)
	end
end
Hack.RegisterCallback("DispatchUserMessage", ChatHook)
