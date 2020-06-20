local MatSettings = 
[[ 
    "VertexlitGeneric" 
    {
		"$additive" "1"
		"$envmap" "models/effects/cube_white"
		"$envmaptint" "[1 1 1]"
		"$envmapfresnel" "1"
		"$envmapfresnelminmaxexp" "[0 1 2]"
		"$alpha" "1"
    }
]]
IMaterialSystem.ChangeHackChams(1, "Mat1", MatSettings)
