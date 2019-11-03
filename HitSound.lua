-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Hit Sound", "bHitSound", false)

local function Func(Event)
    if Menu.GetBool("bHitSound") and Event:GetName("player_hurt", 0) == "player_hurt" then
        PlaySound("C:/Interium/HitSound.wav")
    end 
end

Hack.RegisterCallback("FireEventClientSideThink", Func)