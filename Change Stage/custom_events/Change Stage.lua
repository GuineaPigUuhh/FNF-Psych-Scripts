--[[
    Script by GuineaPigUuhh
    Json Parser & Encoder by Drawoon_
]]

--[[
    ------ IMPORTANT ------
    Place a function with the name of onRemoveStage in the stage scripts,
    place the sprites you want to remove or a function that you want executed when you remove the stage within this function
]]


local Json = require "Lua_libs.json"

function jsonToGame(file)
    local fileText = getTextFromFile(file..".json")
    local parse = Json.parse(fileText)

    local bfCharPos = getProperty('boyfriend.positionArray')
    setProperty("boyfriend.x", parse.boyfriend[1] + bfCharPos[1])
    setProperty("boyfriend.y", parse.boyfriend[2] + bfCharPos[2])

    local dadCharPos = getProperty('dad.positionArray')
    setProperty("dad.x", parse.opponent[1] + dadCharPos[1])
    setProperty("dad.y", parse.opponent[2] + dadCharPos[2])

    local girlCharPos = getProperty('gf.positionArray')
    setProperty("gf.x", parse.girlfriend[1] + girlCharPos[1])
    setProperty("gf.y", parse.girlfriend[2] + girlCharPos[2])
    setProperty("gf.visible", not parse.hide_girlfriend)

    setProperty("defaultCamZoom", parse.defaultZoom)
    setProperty("cameraSpeed", parse.camera_speed)

    setProperty("boyfriendCameraOffset", parse.camera_boyfriend)
    setProperty("opponentCameraOffset", parse.camera_opponent)
    setProperty("girlfriendCameraOffset", parse.camera_girlfriend)
end

function onEvent(name, _1, _2)
    if name == "Change Stage" then
        local curStage,newStage = "stages/".._1,"stages/".._2

        callScript(curStage, "onRemoveStage")
        removeLuaScript(curStage, true)

        addLuaScript(newStage, true)
        jsonToGame(newStage)
    end
end