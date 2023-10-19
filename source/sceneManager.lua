local gfx <const> = playdate.graphics
local pd <const> = playdate

class("SceneManager").extends()

function SceneManager:switchScene(scene)
    self.newScene = scene

    self:loadNewScene()
end

function SceneManager:loadNewScene()
    self:sceneCleanup()
    self.newScene()
end

function SceneManager:sceneCleanup()
    gfx.sprite.removeAll()
    self:removeAllTimers()
    gfx.setDrawOffset(0, 0)
end

function SceneManager:removeAllTimers()
    local allTimers = pd.timer.allTimers()
    for _, timer in ipairs(allTimers) do
        timer:remove()
    end
end