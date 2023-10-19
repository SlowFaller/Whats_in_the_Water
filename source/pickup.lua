local gfx <const> = playdate.graphics
local pd <const> = playdate

class("Pickup").extends(gfx.sprite)

function Pickup:init(x, y, image)
	self:setImage(image)
	self:moveTo(x, y)
	self.spriteX = x
	self.spriteY = y
	self.speed = 10
	-- collision rect setup here
	self:setCollideRect(0,0,image:getSize())
	self:setGroups(GROUPS.PickupG)
	self:setCollidesWithGroups(GROUPS.PlayerG)
	self:setZIndex(LAYERS.GameplayL)
	Pickup.super.init(self)
end

function Pickup:update()
	Pickup.super.init(self)
	self:moveBy(-self.speed, 0)
	if self.position.x < - 10 then
		self:remove()
	end
end