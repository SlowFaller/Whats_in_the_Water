import "gameScene"

local gfx <const> = playdate.graphics
local pd <const> = playdate

class("GameOverScene").extends(gfx.sprite)

function GameOverScene:init()
    local text = "Game Over"
    local gameOverImage = gfx.image.new(gfx.getTextSize(text))
    gfx.pushContext(gameOverImage)
        gfx.drawText(text, 0, 0)
    gfx.popContext()
    local gameOverSprite = gfx.sprite.new(gameOverImage)
    gameOverSprite:moveTo(200, 120)
    gameOverSprite:add()

    self.add()
end

function GameOverScene:update()
    if pd.buttonIsPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(GameScene)
    end
    
end