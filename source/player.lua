local gfx <const> = playdate.graphics
local pd <const> = playdate

class("Player").extends(gfx.sprite)

function Player:init(x, y, image)
	--local subTable = playdate.graphics.imagetable.new("wiwSub")
	self:setImage(image)
	self:setZIndex(LAYERS.GameplayL + 1)
	self:moveTo(x, y)
	self:add()
	self.spriteX = x
	self.spriteY = y
	self.speed = 5
	-- collision rect  == image dimensions
	self:setCollideRect(0,0,image:getSize())
	self:setGroups(GROUPS.PlayerG)
	self:setCollidesWithGroups(GROUPS.ObstacleG, GROUPS.PickupG)
	Player.super.init(self)
end

function Player:update()

end

function Player:handleCollision(finalX, finalY, colList, colLen)
	-- need to complete
	print("DEBUG - handleCollisions Called")
end

function Player:collisionResponse(other)
	--[[
		we don't want to bounce off of a pickup
		we want to bounce off an obstacle	
	--]]
	if other:isA(Obstacle) then
		return "bounce"
	elseif other:isA(Pickup) then
		return "overlap"
	end
end


