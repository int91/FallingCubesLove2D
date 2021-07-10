local player = require "player"
local Bullet = {}

function Bullet:new(x, y, w, h, id)
    local bullet = require("entity"):new(x, y, w, h)
    bullet.speed = 400
    bullet.sprite = love.graphics.newImage("/media/PlaceHolderBullet.png")
    bullet.tag = "bullet"

    function bullet:load()end

    function bullet:update(dt)
        bullet.y = bullet.y - bullet.speed * deltaTime
        for i in pairs (entities) do
            if (entities[i].tag ~= "player") and (entities[i].tag ~= bullet.tag) and (entities[i].tag ~= "noclip")  then
                local e = entities[i]
                if (checkCollision(bullet.x, bullet.y, bullet.width, bullet.height, e.x, e.y, e.width, e.height)) then
                    e:destroy()
                    e:particles()
                    bullet:destroy()
                    hitsound:play()
                    p.score = p.score + 75
                end
            end
        end
        if (bullet.y < 0) then
            bullet:destroy()
        end
    end

    function bullet:draw()
        love.graphics.setColor(ToRGB(255), ToRGB(255), ToRGB(255), 1)
		love.graphics.draw(bullet.sprite, bullet.x, bullet.y, math.rad(0), 1, 1)
        if (debugMode) then
			love.graphics.setColor(1, 1, 1, 1)
			love.graphics.rectangle("line", bullet.x, bullet.y, bullet.width, bullet.height)
		end
    end

    return bullet
end

return Bullet