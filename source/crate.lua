import "pickup"

local gfx <const> = playdate.graphics
local pd <const> = playdate

class("Crate").extends(Pickup)

function Crate:init(x, y)
	local image = gfx.image.new("image/crate")
	assert(image)
	Sub.super.init(self, x, y, image)
	self:moveTo(x,y)
end