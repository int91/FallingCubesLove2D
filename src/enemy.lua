local Enemy = {}

function Enemy:new(x, y, w, h)
    local enemy = require("entity"):new(x, y, w, h)
    enemy.x = x
    enemy.y = y
    enemy.width = w
    enemy.height = h
    enemy.sprite = love.graphics.newImage("/media/EntityBox.png")
    enemy.tag = "enemy"

    function enemy:load() end

    function enemy:update(dt)
		enemy.y = enemy.y + 180 * deltaTime
        if (enemy.y > 600) then
            enemy:destroy()
            p.score = p.score + 50
        end
    end

    function enemy:draw()
        if (enemy.y + 32 >= 0) then
            love.graphics.setColor(ToRGB(255), ToRGB(0), ToRGB(0), 1)
		    love.graphics.draw(enemy.sprite, enemy.x, enemy.y, math.rad(180), 1, 1, 32, 32)
        end
        if (debugMode) then
			love.graphics.setColor(1, 1, 1, 1)
			love.graphics.rectangle("line", enemy.x, enemy.y, enemy.width, enemy.height)
		end
    end

    function enemy:particles()
        require("particles"):new(enemy.x + (enemy.width/2), enemy.y + (enemy.height/2), math.random(12, 24), 300, {1, 0, 0, 1}, 0.3)
    end

    return enemy
end

return Enemy