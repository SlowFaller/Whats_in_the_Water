local gfx <const> = playdate.graphics
local pd <const> = playdate

class("Obstacle").extends(gfx.sprite)

function Obstacle:init(x, y, image)
	self:setImage(image)
	self:moveTo(x, y)
	self:add()
	self.spriteX = x
	self.spriteY = y
	self.speed = 10
	-- collision rect setup here
	self:setCollideRect(0,0,image:getSize())
	self:setGroups(GROUPS.ObstacleG)
	self:setCollidesWithGroups(GROUPS.PlayerG)
	self:setZIndex(LAYERS.GameplayL)
	Obstacle.super.init(self)
end

function Obstacle:update()
	Obstacle.super.init(self)
	self.spriteX = self.spriteX - self.speed
	self:moveBy(self.speed, self.spriteY)
	if self.spriteX < - 10 then
		self:remove()
	end
end