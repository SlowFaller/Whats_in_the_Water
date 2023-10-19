local gfx <const> = playdate.graphics
local pd <const> = playdate

GROUPS = {
	PlayerG = 1,
	ObstacleG = 2,
	PickupG = 3,
	NoActionG = 4,
	UIG = 5,
}

LAYERS = {
	BackgroundL = 0,
	GameplayL = 100,
	ForegroundL = 200,
	UIL = 500,
	TopL = 999,
}