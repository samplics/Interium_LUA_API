local SpoofType = 0

-- Func
local function Func(Event)
    if (Event:GetName() ~= "vote_cast") then
        return
    end

    if (SpoofType == 0) then
        IEngine.ExecuteClientCmd("callvote swapteams")
        SpoofType = 1
    else
        IEngine.ExecuteClientCmd("callvote scrambleteams")
        SpoofType = 0
    end
end

-- Hook
Hack.RegisterCallback("FireEventClientSideThink", Func)