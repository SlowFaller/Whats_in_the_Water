import "player"

local gfx <const> = playdate.graphics
local pd <const> = playdate

class("Sub").extends(Player)

function Sub:init(x, y)
	local image = gfx.image.new("image/sub/subBlack")
	assert(image)
	Sub.super.init(self, x, y, image)
	self:moveTo(x,y)
end
