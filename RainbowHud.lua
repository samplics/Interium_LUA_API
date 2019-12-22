local a1 = 0
local a2 = 0
local a3 =
{
  [0]  =  "cl_hud_color 0",
  [1]  =  "cl_hud_color 1",
  [2]  =  "cl_hud_color 2",
  [3]  =  "cl_hud_color 3",
  [4]  =  "cl_hud_color 4",
  [5]  =  "cl_hud_color 5",
  [6]  =  "cl_hud_color 6",
  [7]  =  "cl_hud_color 7",
  [8]  =  "cl_hud_color 8",
  [9]  =  "cl_hud_color 9",

}

function DoRepeat()
    if Utils.IsLocal() then
        if a1 < GetTickCount() then     
            a2 = a2 + 1
            if a2 > 9 then
                a2 = 0
            end
            IEngine.ExecuteClientCmd(a3[a2])
            a1 = GetTickCount() + 500
        end  
    end
end

Hack.RegisterCallback("PaintTraverse", DoRepeat)
