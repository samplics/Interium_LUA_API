-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.Checkbox("Hit Sound", "bHitSound", true)

local function Func(Event)
    if Menu.GetBool("bHitSound") == false then
        return
    end 
    if (Utils.IsLocal() == false) then 
        return
    end

    if (Event:GetName() == "player_hurt") then
        local IsLocalShot = IEngine.GetPlayerForUserID(Event:GetInt("attacker", 0)) == IEngine.GetLocalPlayer()
        if IsLocalShot then
            PlaySound(GetAppData() .. "/INTERIUM/CSGO/HitSound.wav")
        end
    end 
end

Hack.RegisterCallback("FireEventClientSideThink", Func)