-- CoreLibs
import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Library
import "lib/libfile"

-- Game Specific
import "globals"
import "sceneManager"
import "scene/gameScene"
import "scene/titleScene"

local pd <const> = playdate
local gfx <const> = playdate.graphics

SCENE_MANAGER = SceneManager()

TitleScene()

local function loadGame()
	pd.display.setRefreshRate(30) -- Sets framerate to 50 fps
	math.randomseed(playdate.getSecondsSinceEpoch()) -- seed for math.random
	--print(libfile.Multiply(2, 3))
	--print(libfile:Square(2, 8))
end

local function updateGame()

end

local function drawGame()
	--gfx.clear() -- clears the screen
end

loadGame()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	updateGame()
	drawGame()
	-- playdate.drawFPS(0,0) -- FPS widget
end
