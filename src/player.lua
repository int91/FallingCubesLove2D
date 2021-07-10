local Player = {}

function Player:new(x, y, w, h, id)
    local player = require("entity"):new(x, y, w, h)
    player.speed = 180
    player.canDash = true
    player.canShoot = true
    player.shootTime = 120
    player.shootCur = 0
    player.dashTime = 0.25
    player.dashCur = 0
    player.lives = 3
    player.layer = 3
    player.sprite = love.graphics.newImage("/media/EntityBox.png")
    player.ammo = 3
    player.score = 0
    player.tag = "player"
    player.timeSurvived = 0
    gamePaused = false

    local profile = playerName or "default"
    local savename = profile.."_data.gamedata"

    local hurtsound = love.audio.newSource("media/audio/sfx/playerhurt.wav", "static")
    local shootsound = love.audio.newSource("media/audio/sfx/playershoot.wav", "static")
    local ammopickup = love.audio.newSource("media/audio/sfx/ammocratepickup.wav", "static")
    
    if (love.filesystem.getInfo(savename)) then
        local loadedData = {}
        loadedData = TSerial.unpack(love.filesystem.read(savename))
        scores = loadedData[1]
        keybinds = loadedData[2]
    end

    function player:load()end

    function player:update(dt)
        if (not gamePaused) then
            player.timeSurvived = player.timeSurvived + (1 * deltaTime)
        end

        if (player.canDash == false) then
            if (player.dashCur <= player.dashTime) then
                player.dashCur = player.dashCur + 1 * deltaTime
                player.speed = 700
            else
                player.dashCur = 0
                player.canDash = true
            end
        end
        if (player.canShoot == false) then
            if (player.shootCur <= player.shootTime) then
                player.shootTime = player.shootCur + 1 * deltaTime
            else
                player.shootCur = 0
                player.canShoot = true
            end
        end

        if (love.keyboard.isDown(keybinds.msprint) and player.canDash == true) then
            player.speed = 500
        elseif (player.canDash == true) then
            player.speed = 320
        end
        if (love.keyboard.isDown(keybinds.mright)) then
		    player.x = player.x + player.speed * deltaTime
        elseif (love.keyboard.isDown(keybinds.mleft)) then
            player.x = player.x - player.speed * deltaTime
        end

        if (player.x + 32> 800) then
            player.x = 800-32
        elseif (player.x < 0) then
            player.x = 0
        end

        for i in pairs(entities) do
            if (entities[i] ~= player.tag) and (entities[i].tag ~= "noclip") then
                local e = entities[i]
                if (checkCollision(player.x, player.y, player.width, player.height, e.x, e.y, e.width, e.height)) then
                    if (e.tag == "enemy")then
                        e:destroy()
                        require("particles"):new(player.x + (player.width/2), player.y + (player.height/2), math.random(4, 8), 200, {ToRGB(17), ToRGB(247), ToRGB(80), 1}, 0.4)
                        hurtsound:play()
                        player.lives = player.lives - 1
                    elseif (e.tag == "ammocrate") then
                        e:destroy()
                        ammopickup:play()
                        player.score = player.score + 15
                        player.ammo = player.ammo + 3
                    end
                end
            end
        end
        if (player.lives <= 0) then
            if (player.score > scores[gameDifficulty]) then
                scores[gameDifficulty] = player.score
            end
            if (player.timeSurvived > scores[gameDifficulty+5]) then
                scores[gameDifficulty+5] = player.timeSurvived
            end

            love.filesystem.write(savename, TSerial.pack({scores, keybinds}))
            changeScene(2) --Change this to 2 once loss screen is created
        end
    end

    function love.keypressed(key, scancode, isrepeat)
        if (key == keybinds.pause) then
            gamePaused = not gamePaused
            --TODO: Change this to main menu / create pause screen
        end
        if (key == keybinds.exitpause) and (gamePaused) then
            gamePaused = false
            mapID = 0
            player.restart()
        end
        if (key == keybinds.dash) then
            player.canDash = false
        end
        if (key == keybinds.shoot) and (player.ammo > 0) and (not gamePaused) then
            player.shoot()
            player.ammo = player.ammo - 1
        end
        if (key == keybinds.devmode) then
            debugMode = not debugMode
        end
    end

    function player:draw()
        love.graphics.setColor(ToRGB(17), ToRGB(247), ToRGB(80), 1)
		love.graphics.draw(player.sprite, player.x, player.y, math.rad(0), 1, 1)
        love.graphics.setColor(ToRGB(255), ToRGB(255), ToRGB(255), 1)
        if (debugMode) then
			love.graphics.setColor(1, 1, 1, 1)
			love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
		end
    end

    function player:shoot()
        bul = require("bullet"):new((player.x + 16) - (4), player.y - 24, 8, 16)
        if (bul) then
            shootsound:play()
        end
    end

    function player:restart()
        player.score = 0
        player.timeSurvived = 0
    end

    return player
end

return Player