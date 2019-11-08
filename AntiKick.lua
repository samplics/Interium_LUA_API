-- Init Event
IGameEventListener.AddEvent("vote_options", true)

-- Func
local function Func(Event)
    if (Event:GetName() ~= "vote_options") then
        return
    end

    IEngine.ExecuteClientCmd("callvote swapteams")
    IEngine.ExecuteClientCmd("callvote scrambleteams")
end

-- Hook
Hack.RegisterCallback("FireEventClientSideThink", Func)