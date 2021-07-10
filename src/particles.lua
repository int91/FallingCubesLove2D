local entity = require "entity"
local player = require "player"

local Particles = {}
    function Particles:new(x, y, am, spd, color, lifeTime)
        local particles = entity:new(x, y, 2, 2)
        particles.amount = am
        particles.speed = spd
        particles.parts = {}
        particles.width = 2
        particles.height = 2
        particles.sprite = nil
        particles.tag = "noclip"
        particles.color = color
        
        local despawnTime = lifeTime or 0.75
        local lifeTime = 0

        function particles:load()
            for i = 0, particles.amount do
                local part = {}
                local dir = math.random(1, 4)
                part.x = particles.x
                part.y = particles.y
                part.dir = dir
                part.angle = math.random(0, 360)
                table.insert(particles.parts, part)
            end
        end

        particles:load()

        function particles:update(dt)
            if (lifeTime < despawnTime) then
                lifeTime = lifeTime + 1 * deltaTime
            else
                particles:destroy()
            end
            for i in pairs(particles.parts) do
                local p = particles.parts[i]
                p.x = p.x + particles.speed * math.sin(math.rad(p.angle)) * deltaTime
                p.y = p.y + particles.speed * math.cos(math.rad(p.angle)) * deltaTime
            end
        end

        function particles:draw()
            love.graphics.setColor(particles.color)
            for i in pairs(particles.parts) do
                local p = particles.parts[i]
                love.graphics.rectangle("fill", p.x, p.y, particles.width, particles.height)
            end
        end
    end

return Particles