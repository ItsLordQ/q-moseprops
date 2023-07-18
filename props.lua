local Objects = {
    { ["x"] = -19.8, ["y"] = -1647.88, ["z"] = 29.48, ["h"] = 139.68, ["model"] = "imp_prop_tool_draw_01d" },
    { ["x"] = -21.2, ["y"] = -1647.88, ["z"] = 28.48, ["h"] = 318.12, ["model"] = "imp_prop_tool_draw_01d" },

    { ["x"] = -19.06, ["y"] = -1649.82, ["z"] = 29.48, ["h"] = 316.44, ["model"] = "imp_prop_tool_draw_01b" },
    { ["x"] = -21.65, ["y"] = -1646.08, ["z"] = 29.48, ["h"] = 144.61, ["model"] = "imp_prop_tool_draw_01b" },   

    { ["x"] = -19.9, ["y"] = -1647.97, ["z"] = 30.58, ["h"] = 330.51, ["model"] = "h4_prop_h4_tool_box_02" }, 
    { ["x"] = -20.04, ["y"] = -1648.84, ["z"] = 30.58, ["h"] = 322.16, ["model"] = "xs_prop_x18_tool_chest_01a" }, 

    { ["x"] = -16.28, ["y"] = -1644.97, ["z"] = 29.48, ["h"] = 319.2, ["model"] = "prop_toolchest_03" },
  
    { ["x"] = -22.16, ["y"] = -1646.95, ["z"] = 30.58, ["h"] = 336.55, ["model"] = "prop_rub_cardpile_07" }, 

    { ["x"] = -16.19, ["y"] = -1644.96, ["z"] = 30.46, ["h"] = 315.83, ["model"] = "prop_bucket_01a" }, 
  
    { ["x"] = -18.91, ["y"] = -1648.83, ["z"] = 30.58, ["h"] = 282.93, ["model"] = "prop_tool_drill" },
--[[     { ["x"] = -20.48, ["y"] = -1647.49, ["z"] = 30.58, ["h"] = 243.03, ["model"] = "prop_tool_hammer" },
    { ["x"] = -21.8, ["y"] = -1647.23, ["z"] = 30.58, ["h"] = 222.61, ["model"] = "prop_tool_adjspanner" },
    { ["x"] = -20.92, ["y"] = -1647.96, ["z"] = 30.58, ["h"] = 154.86, ["model"] = "prop_tool_wrench" }, ]]
    { ["x"] = -31.92, ["y"] = -1658.1, ["z"] = 29.48, ["h"] = 322.64, ["model"] = "prop_parking_sign_1" },
    { ["x"] = -29.23, ["y"] = -1653.56, ["z"] = 29.48, ["h"] = 321.66, ["model"] = "prop_parking_sign_1" },
    { ["x"] = -36.04, ["y"] = -1654.58, ["z"] = 29.48, ["h"] = 314.0, ["model"] = "prop_parking_sign_1" },
    { ["x"] = -33.3, ["y"] = -1656.55, ["z"] = 29.48, ["h"] = 319.73, ["model"] = "prop_parking_sign_1" },

    { ["x"] = -21.73, ["y"] = -1647.3, ["z"] = 30.58, ["h"] = 268.09, ["model"] = "v_res_desklamp" },
    { ["x"] = -20.41, ["y"] = -1647.47, ["z"] = 30.58, ["h"] = 337.39, ["model"] = "v_15_shrm_promotional" },
    { ["x"] = -21.06, ["y"] = -1647.8, ["z"] = 30.58, ["h"] = 317.33, ["model"] = "v_24_rct_lamptablestuff" },
    { ["x"] = -20.89, ["y"] = -1646.95, ["z"] = 30.58, ["h"] = 171.9, ["model"] = "v_ind_cs_drill" },
     { ["x"] = -21.53, ["y"] = -1646.26, ["z"] = 30.54, ["h"] = 224.95, ["model"] = "v_ind_cs_toolbox3" },   
    { ["x"] = -18.61, ["y"] = -1648.97, ["z"] = 30.58, ["h"] = 49.01, ["model"] = "prop_radio_01" },
    { ["x"] = -19.16, ["y"] = -1649.55, ["z"] = 30.54, ["h"] = 13.65, ["model"] = "ng_proc_sodacup_01a" },
    { ["x"] = -18.96, ["y"] = -1650.01, ["z"] = 30.54, ["h"] = 212.32, ["model"] = "ng_proc_sodacup_02a" },
}vector4(-18.61, -1648.97, 30.58, 49.01)

Citizen.CreateThread(function()
    for i = 1, #Objects, 1 do
        while not HasModelLoaded(GetHashKey(Objects[i]["model"])) do
            RequestModel(GetHashKey(Objects[i]["model"]))

            Citizen.Wait(5)
        end

        Objects[i]["objectId"] = CreateObject(GetHashKey(Objects[i]["model"]), Objects[i]["x"], Objects[i]["y"], Objects[i]["z"], false)

        PlaceObjectOnGroundProperly(Objects[i]["objectId"])
        SetEntityHeading(Objects[i]["objectId"], Objects[i]["h"])
        FreezeEntityPosition(Objects[i]["objectId"], true)
        SetEntityAsMissionEntity(Objects[i]["objectId"], true, true)
    end

    print("Spawned Props! Lol Q Sucks")
end)