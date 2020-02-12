function PaintTraverse()

    Render.AddPoly(0, 50, 50)
    Render.AddPoly(1, 550, 580)
    Render.AddPoly(2, 50, 350)
    Render.PolyFilled(3, Color.new(255, 255, 255, 255), true, 2)

    Render.AddPoly(0, 689, 746)
    Render.AddPoly(1, 967, 689)
    Render.AddPoly(2, 1000, 350)
    Render.Poly(3, Color.new(255, 0, 255, 255), true, 2)
end
Hack.RegisterCallback("PaintTraverse", PaintTraverse)
