local losescreen = {}
    local width, height = 800, 600

    function losescreen:load()
        losescreen.score = p.score
        p = nil
    end

    function losescreen:update(dt)
        if (love.keyboard.isDown("space")) then
            changeScene(1)
        end
        if (love.keyboard.isDown("escape")) then
            changeScene(0)
        end
    end

    function losescreen:draw()
        love.graphics.setColor({1, 1, 1, 1})
        love.graphics.printf("Game Over", mmainfont, width/2-190, 0, 400, "center", math.rad(0))
        love.graphics.printf("Press [Space] to restart", underfont, width/2-190, 80, 400, "center", math.rad(0))
        love.graphics.printf("Press [Escape] to go to main menu", underfont, width/2-230, 120, 460, "center", math.rad(0))

        love.graphics.printf("Score: "..losescreen.score, underfont, width/2-200, 170, 400, "center", math.rad(0))
        love.graphics.printf("Highscore: " ..scores[gameDifficulty], underfont, width/2-200, 210, 400, "center", math.rad(0))
        love.graphics.printf("You survived for "..scores[gameDifficulty+5].." seconds", underfont, width/2-400, 250, 800, "center", math.rad(0))
        love.graphics.printf("Difficulty: "..gameDifficultyNames[gameDifficulty], underfont, width/2-200, 290, 400, "center", math.rad(0))
    end

return losescreen