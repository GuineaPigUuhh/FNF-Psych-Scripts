local bfSings = false
local speed = 15

function onUpdatePost(e)    
    if stringStartsWith((getProperty("boyfriend.animation.curAnim.name")), "sing") then
        bfSings = true
    else
        bfSings = false
    end

    if bfSings then return end

    if keyPressed("left") then
        setProperty("boyfriend.x", getProperty("boyfriend.x") - speed)
    elseif keyPressed("right") then
        setProperty("boyfriend.x", getProperty("boyfriend.x") + speed)
    end
end