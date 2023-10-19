import "gameOverScene"
import "sub"
import "mine"
import "crate"

local gfx <const> = playdate.graphics
local pd <const> = playdate

class("GameScene").extends(gfx.sprite)

function GameScene:init()
    --[[
    local backgroundImage = gfx.image.new("image/background/sandyBottom")
    assert(backgroundImage)
    gfx.sprite.setBackgroundDrawingCallback(function ()
        backgroundImage:draw(0,0)
    end)
    --]]

    self.playerSub = Sub(20, 120)
    --[[
    local playerSprite = gfx.image.new("image/sub/subBlack")
    assert(playerSprite)
    self.player = gfx.sprite.new(playerSprite)
    self.player:moveTo(30, 30)
    self.player:add()

    self.playerSpeed = 2
    --]]

	randomTimerDuration = math.random(600, 1800)
	local t = playdate.timer.new(randomTimerDuration)
	t.repeats = true
	t.timerEndedCallback = function(timer)
		randomTimerDuration = math.random(600, 1800)
        timer:reset()
        timer.repeats = true
		timer.duration = randomTimerDuration
        Mine(410, math.random(self.playerSub.spriteY - 10, self.playerSub.spriteY + 10))
	end
    self:add()
end

function playdate.timer:resetWithDurationAndCallback(duration, callback)
	self:reset()
	self.duration = duration
	self.timerEndedCallback = callback
end

function GameScene:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        if self.playerSub.y - self.playerSub.speed <= 0 then
            self.playerSub.y = 0
        else
            self.playerSub:moveBy(0, -self.playerSub.speed)
        end
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        if self.playerSub.x + self.playerSub.speed >= 400 then
            self.playerSub.x = 400
        else
            self.playerSub:moveBy(self.playerSub.speed, 0)
        end
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        if self.playerSub.y + self.playerSub.speed >= 240 then
            self.playerSub.y = 240
        else
            self.playerSub:moveBy(0, self.playerSub.speed)
        end
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        if self.playerSub.x - self.playerSub.speed <= 0 then
            self.playerSub.x = 0
        else
            self.playerSub:moveBy(-self.playerSub.speed, 0)
        end
    end
end

function pd.AButtonDown()
	-- shoot
	print("A BUTTON, shoot")
end

function pd.BButtonDown()
	-- bomb
	print("B BUTTON, bomb")
end
