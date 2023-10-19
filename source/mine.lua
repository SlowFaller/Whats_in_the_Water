import "obstacle"

local gfx <const> = playdate.graphics
local pd <const> = playdate

class("Mine").extends(Obstacle)

function Mine:init(x, y)
	local image = gfx.image.new("image/mine")
	assert(image)
	Sub.super.init(self, x, y, image)
	self:moveTo(x,y)
end