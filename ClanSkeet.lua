local a1 = 0
local a2 = 0
local a3 =
{
  [0]  =  "                  ",
  [1]  =  "                 g",
  [2]  =  "                ga",
  [3]  =  "               gam",
  [4]  =  "              game",
  [5]  =  "             games",
  [6]  =  "            gamese",
  [7]  =  "           gamesen",
  [8]  =  "          gamesens",
  [9]  =  "         gamesense",
  [10]  =  "        gamesense ",
  [11]  =  "       gamesense  ",
  [12]  =  "      gamesense   ",
  [13]  =  "     gamesense    ",
  [14]  =  "    gamesense     ",
  [15]  =  "   gamesense      ",
  [16]  =  "  gamesense       ",
  [17]  =  " gamesense        ",
  [18]  =  "gamesense         ",
  [19]  =  "amesense          ",
  [20]  =  "mesense           ",
  [21]  =  "esense            ",
  [22]  =  "sense             ",
  [23]  =  "sens              ",
  [24]  =  "sen               ",
  [25]  =  "se                ",
  [26]  =  "s                 "
}

function DoClanTag()
    if Utils.IsLocal() then
        if a1 < GetTickCount() then     
            a2 = a2 + 1
            if a2 > 30 then
                a2 = 0
            end
            Utils.SetClantag(a3[a2])
            a1 = GetTickCount() + 240
        end  
    end
end

Hack.RegisterCallback("PaintTraverse", DoClanTag)