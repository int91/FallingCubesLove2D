require "utilities"
require "TSerial"
local MaM = require "mapmanager"

--TODO: Move Player vars to a global variable / table to access in different maps / scenes
--TODO: Make Videos
--TODO: Clean Up Code

require "gameglobals"

function love.load()
	math.randomseed(os.clock()*100000000000)
	for i=1,3 do
		math.random(10000, 65000)
	end
	MaM.load()
end

function love.update(dt)
	if (limitFPS) then
		deltaTime = math.min(love.timer.getDelta(), 1/fps)
	else
		deltaTime = love.timer.getDelta()
	end
	if (slowMo) then
		deltaTime = deltaTime / 2
	end
	if (gamePaused) then
		deltaTime = 0
	end
	MaM.update(deltaTime)
end

function love.draw()
	if (debugMode) then
		love.graphics.print("FPS: "..love.timer.getFPS(), 0, 50)
	end
	MaM.draw()	
end