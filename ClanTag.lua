-- Init Menu
Menu.Spacing()
Menu.Separator()
Menu.Spacing()
Menu.InputText("Clan Tag", "sClanTag", "Interium")
Menu.Button("Change Clan Tag", "bClanTag")

-- Init global
local IsSeted = false
local NeedSet = false

-- func
local function ClanTag()
    if (Menu.GetBool("bClanTag")) then 
        IsSeted = true
        NeedSet = true
    end
    if (Utils.IsLocal() == false and IsSeted) then 
        NeedSet = true
        return
    end

    if NeedSet then
        Utils.SetClantag(Menu.GetString("sClanTag"))
        NeedSet = false
    end
end

Hack.RegisterCallback("PaintTraverse", ClanTag)