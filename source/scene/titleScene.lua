import "gameScene"

local gfx <const> = playdate.graphics
local pd <const> = playdate

class("TitleScene").extends(gfx.sprite)

function TitleScene:init()
    ---[[
    local backgroundImage = gfx.image.new("image/background/wiw_title_bkgnd")
    assert(backgroundImage)
    gfx.sprite.setBackgroundDrawingCallback(function ()
        backgroundImage:draw(0,0)
    end)
    --]]

    local font = gfx.font.new('/font/Mini Sans 2X') -- default template font
	gfx.setFont(font) -- DEMO
	
    self.title = {
		x = 200,
		y = 40,
		width = 280,
		height = 20,
		text = "What's in the Water?",
	}
    
    ---[[
    local buttonAImage = gfx.image.new("image/uiux/buttonASmall")
    --assert(buttonAImage)
    self.buttonASprite = gfx.sprite.new(buttonAImage)
    self.buttonASprite:moveTo(200, 120)
    self.buttonASprite:add()
    --]]

    local titleImage = gfx.image.new(gfx.getTextSize(self.title.text))
    gfx.pushContext(titleImage)
        gfx.drawText(self.title.text, 0, 0)
    gfx.popContext()
    local titleSprite = gfx.sprite.new(titleImage)
    titleSprite:moveTo(self.title.x, self.title.y)
    titleSprite:add()

    self:add()
end

function TitleScene:update()
    if pd.buttonIsPressed(pd.kButtonA) then
        print("Button A was pressed!!!")
        SCENE_MANAGER:switchScene(GameScene)
    end
    
    self:draw()
end

function TitleScene:draw()

end