-----------------------------------------------------------------------------------------
--
-- main.lua
-- created David Sly 2/8/2015
-----------------------------------------------------------------------------------------

--Globals
WDTH = display.contentWidth
HGHT = display.contentHeight
w = 100
h = w * 292 / 340

-- Define reference points locations anchor ponts
local TOP_REF = 0
local BOTTOM_REF = 1
local LEFT_REF = 0
local RIGHT_REF = 1
local CENTER_REF = 0.5
local groundlevel = 310
--hiding the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Creating my background
local sky = display.newImageRect("sky.jpg", 427 * 1.4 , 305 *1.7)
sky.x = WDTH / 2
sky.y = HGHT / 1.4

-- solid ground, doesn't need to move
local ground = display.newImageRect("ground.png",798 * 1.35, 18 )
ground.x = 0
ground.y = 318

-- Create a bunch of foliage
local tree = {}
tree[1] = display.newImage( "Palm-arecaceae.png" )
tree[1].xScale = 0.7; tree[1].yScale = 0.7
tree[1].anchorY = BOTTOM_REF
tree[1].x = 20; tree[1].y = groundlevel
tree[1].dx = 0.1
tree[2] = display.newImage( "Flower21.png" )
tree[2].xScale = 0.2; tree[2].yScale = 0.2
tree[2].anchorY = BOTTOM_REF
tree[2].x = 190; tree[2].y = groundlevel +10
tree[2].dx = 0.2
tree[3] = display.newImage( "Greenhouse-Palm-cycas01.png" )
tree[3].xScale = 0.8; tree[3].yScale = 0.3
tree[3].anchorY = BOTTOM_REF
tree[3].x = 500; tree[3].y = groundlevel +10
tree[3].dx = 0.3
tree[4] = display.newImage( "Ginger.png" )
tree[4].xScale = 0.3; tree[4].yScale = 0.3
tree[4].anchorY = BOTTOM_REF
tree[4].x = groundlevel; tree[4].y = groundlevel +10
tree[4].dx = 0.4
tree[5] = display.newImage( "Bamboo-rgba.png" )
tree[5].xScale = 0.8; tree[5].yScale = 0.8
tree[5].anchorY = BOTTOM_REF
tree[5].x = 420; tree[5].y = groundlevel
tree[5].dx = 0.8
tree[6] = display.newImage( "Bamboo-rgba.png" )
tree[6].xScale = 0.8; tree[6].yScale = 0.8
tree[6].anchorY = BOTTOM_REF
tree[6].x = 10; tree[6].y = groundlevel
tree[6].dx = 0.8


--Creating an archer tower 
archer_tower = display.newImageRect("Archer_Tower2.png", w, h)
archer_tower.rotation = 0
archer_tower.x = 75
archer_tower.y = 285

--Creating an archer 
archer = display.newImageRect("archer.png", w, h)
archer.rotation = -10
archer.x = 75
archer.y = 230

--Creating a fire dragon
dragon = display.newImageRect("Dragon-6.png", w, h)
dragon.rotation =15
dragon.x = 600
dragon.y = 130

--Creating a dragon
dragon2 = display.newImageRect("Dragon.png", w, h)
dragon2.x = 600
dragon2.y = 50


-- Make an array to hold the arrows
arrows = {}   -- array is empty to start with
--Position the arrows shooting out of the bow
function fireArrows()
    local x = 120 
	local y = 205
	arrow = display.newRect( x, y, 50, 2 )

	arrow.rotation = 335
	return arrow
end

-- Make a set of 8 photon torpedos
for i = 1, 12 do
	arrows[i] = fireArrows()
end

-- Animation function (will get called at each new frame)
function run()
	-- Move the fire dragon to the right across the screen
	dragon.x = dragon.x + 2
    if dragon.x > WDTH + 100 then
		dragon.x = -100
	end

    -- Move the pink dragon to the left across the screen
    dragon2.x = dragon2.x - 2
	if dragon2.x < - 100 then  
        dragon2.x =  600
	end

	-- Move all of the arrows to the right
	for i = 1, 12 do
		arrows[i].x = arrows[i].x + 3
		arrows[i].y = arrows[i].y - 1.7
	end
end -- This is the end of the newFrame function


-- Tell Corona to call newFrame before each new animation frame
Runtime:addEventListener( "enterFrame", run )
