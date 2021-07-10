local Ammocrate = {}

function Ammocrate:new(x, y, w, h, id)
    local ammocrate = require("entity"):new(x, y, w, h)
    --Size is 28, 28
    ammocrate.speed = 240
    ammocrate.sprite = love.graphics.newImage("/media/PlaceHolderAmmoBox.png")
    ammocrate.tag = "ammocrate"

    function ammocrate:load() end

    function ammocrate:update(dt) 
        ammocrate.y = ammocrate.y + ammocrate.speed * deltaTime
        if (ammocrate.y > 600) then
            ammocrate:destroy()
        end
    end
    function ammocrate:draw() 
        love.graphics.setColor(ToRGB(255), ToRGB(255), ToRGB(255), 1)
        love.graphics.draw(ammocrate.sprite, ammocrate.x, ammocrate.y, math.rad(0), 1, 1)
    end

    function ammocrate:destroy()
        for q in pairs (entities) do
            if (entities[q] == ammocrate) then
                if (entities[q].id == ammocrate.id) then
                    table.remove(entities, q)
                end
            end
        end
    end

    return ammocrate
end

return Ammocrate