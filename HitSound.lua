-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Hit Sound", "bHitSound", false)

local function Func(Event)
    if Menu.GetBool("bHitSound") == false then
        return
    end 

    if Event:GetName("player_hurt", 0) == "player_hurt" then
        local IsLocalShot = IEngine.GetPlayerForUserID(Event:GetInt("attacker", 0)) == IEngine.GetLocalPlayer()
        if IsLocalShot then
            PlaySound("C:/Interium/HitSound.wav")
        end
    end 
end

Hack.RegisterCallback("FireEventClientSideThink", Func)