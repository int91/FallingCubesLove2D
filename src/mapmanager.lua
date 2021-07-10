local GM = require "gamemanager"
local MM = require "mainmenu"
local LS = require "losescreen"

local mapmanager = {}
    function mapmanager:load()
    end

    function mapmanager:update(_dt)
        if (mapID == 0) then
            MM.update(deltaTime)
        end
        if (mapID == 1) then
            GM.update(deltaTime)
        end
        if (mapID == 2) then
            LS.update(deltaTime)
        end
    end

    function mapmanager:draw()
        if (mapID == 0) then
            MM.draw()
        end
        if (mapID == 1) then
            GM.draw()
        end
        if (mapID == 2) then
            LS.draw()
        end
    end

    function changeScene(scene)
        if (mapID == 1) then
            
        else
            entities = {}
            entityNumber = 0
        end
        mapID = scene
        if (mapID == 0) then
            MM.load()
        end
        if (mapID == 1) then
            GM.load()
        end
        if (mapID == 2) then
            LS.load()
        end
    end

return mapmanager