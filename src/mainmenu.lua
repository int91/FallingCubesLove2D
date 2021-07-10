local mainmenu = {}
    local width, height = 800, 600

    function mainmenu:load()
        p = nil
    end

    function mainmenu:update(dt)
        if (love.keyboard.isDown("escape")) then
            love.event.quit()
        end
        if (love.keyboard.isDown("space")) then
            changeScene(1)
        end
    end

    function mainmenu:draw()
        love.graphics.printf("Falling Cubes", mmainfont, width/2-200, 0, 400, "center", math.rad(0))
        love.graphics.printf("Press [Space] to play", underfont, width/2-200, 80, 400, "center", math.rad(0))
        love.graphics.printf("Press [Escape] to exit", underfont, width/2-200, 120, 400, "center", math.rad(0))
        love.graphics.printf("Use left and right arrows to change difficulty", underfont, width/2-200, 160, 400, "center", math.rad(0))
        love.graphics.printf("Difficulty: "..gameDifficultyNames[gameDifficulty], underfont, width/2-200, 240, 400, "center", math.rad(0))
        love.graphics.printf("The first person to survive one minute on IMPOSSIBLE will get my next game for free! ", underfont, width/2-200, 400, 400, "center", math.rad(0))
    end

    function love.keypressed(key, scancode, isrepeat)
        if (key == keybinds.changediffleft) then
            if (gameDifficulty > 1) then
                gameDifficulty = gameDifficulty - 1
            end 
        elseif (key == keybinds.changediffright) then
            if (gameDifficulty < 5) then
                gameDifficulty = gameDifficulty + 1
            end
        end
    end

return mainmenu