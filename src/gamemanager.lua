local espawner = require "enemyspawner"

local gamemanager = {}
    function gamemanager:load()
        entities = {}
        entityNumber = 0
        espawner.load()
        p = require("player"):new((800/2)-32, 500, 32, 32, 32)
    end

    function gamemanager:update(dt)
        espawner.update()

        for i in pairs (entities) do
            entities[i].update(dt)
        end
    end

    function gamemanager:draw()
        for i in pairs (entities) do
            entities[i].draw()
        end

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.printf("Lives: "..tostring(p.lives), mainfont, 0, 10, 200, "left", math.rad(0))
        love.graphics.printf("Ammo: "..tostring(p.ammo), mainfont, 0, 30, 200, "left", math.rad(0))

        if (gamePaused) then
            love.graphics.printf("Game Paused", underfont, 800/2-200, 0, 400, "center", math.rad(0))
            love.graphics.printf("Press [1] to exit to menu", underfont, 800/2-200, 40, 400, "center", math.rad(0))
        end

        if (debugMode) then
            local count = 0
            for _ in pairs(entities) do count = count + 1 end 
            love.graphics.print("Entities: "..tostring(count), 0, 90)
        end
    end

return gamemanager