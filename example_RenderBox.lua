local function RenderBox()
    if Utils.IsLocal() == false then 
        return
    end

    for i = 1, 64 do
        if i == IEngine.GetLocalPlayer() then
            goto continue
        end

        local Player = IEntityList.GetPlayer(i) 

        if Player and Player:GetClassId() == 40 and Player:IsAlive() and Player:IsDormant() == false then 
            local Box = Player:GetBox()
            local col = Color.new(25, 255, 25, 255)
            Render.Line(Box.left, Box.bottom, Box.left, Box.top, col, 2)
            Render.Line(Box.left, Box.top, Box.right, Box.top, col, 2)
            Render.Line(Box.right, Box.top, Box.right, Box.bottom, col, 2)
            Render.Line(Box.right, Box.bottom, Box.left, Box.bottom, col, 2)
        end

        ::continue::
    end
end

Hack.RegisterCallback("PaintTraverse", RenderBox)