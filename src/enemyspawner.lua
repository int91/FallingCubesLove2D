local enem = require "enemy"
local ammoc = require "ammocrate"

local enemyspawner = {}
    
    function enemyspawner:load()
        enemyspawner.spawnDiffs = {
            0.00001,
            0.0001,
            0.00015,
            0.00045,
            0.01,
        }
        enemyspawner.spawnTime = 0.35
        enemyspawner.timeCur = 0
        
        enemyspawner.ammoDiffs = {
            math.random(16, 20),
            math.random(19, 25),
            math.random(21, 39),
            math.random(25, 45),
            math.random(10, 20),
        }
        enemyspawner.ammoCur = 0
        enemyspawner.ammoSpawnTime = 0
        enemyspawner.ammoDiffs[gameDifficulty] = enemyspawner.ammoDiffs[gameDifficulty]
        enemyspawner.ammoSpawnTime = enemyspawner.ammoDiffs[gameDifficulty]
    end

    function enemyspawner:update(_dt)

        if (enemyspawner.timeCur < enemyspawner.spawnTime) then
            enemyspawner.timeCur = enemyspawner.timeCur + 1 * deltaTime
        else
            enem:new(math.random(0, 768), math.random(-64, 0), 32, 32)
            enemyspawner.timeCur = 0
            if (enemyspawner.spawnTime > 0.045) then
                enemyspawner.spawnTime = enemyspawner.spawnTime - enemyspawner.spawnDiffs[gameDifficulty]
            end
        end

        if (enemyspawner.ammoCur < enemyspawner.ammoSpawnTime) then
            enemyspawner.ammoCur = enemyspawner.ammoCur + 1 * deltaTime
        else
            ammoc:new(math.random(0, 768), math.random(-64, 0), 28, 28)
            enemyspawner.ammoCur = 0
            enemyspawner.ammoSpawnTime = enemyspawner.ammoDiffs[gameDifficulty]
            enemyspawner. ammoDiffs[gameDifficulty] = enemyspawner.ammoDiffs[gameDifficulty]

            --[[if (gameDifficulty == 1) then
                ammoSpawnTime = math.random(16, 20)
            elseif (gameDifficulty == 2) then
                ammoSpawnTime = math.random(19, 25)
            elseif (gameDifficulty == 3) then
                ammoSpawnTime = math.random(21, 39)
            elseif (gameDifficulty == 4) then
                ammoSpawnTime = math.random(25, 45)
            end]]    
            
            math.randomseed(os.clock()*100000000000)
            for i=1,3 do
                math.random(10000, 65000)
            end
        end
    end

    function enemyspawner:draw()end

return enemyspawner