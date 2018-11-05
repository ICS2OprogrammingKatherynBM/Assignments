-----------------------------------------------------------------------------------------
-- Title: Animated Images
-- Name: Katheryn B.M
-- Course: ICS2O
--Description: In  this program I make 3 different objects move 3 different ways
-----------------------------------------------------------------------------------------
 

-- remove status bar
display.setStatusBar(display.HiddenStatusBar)


--global variables
scrollSpeed = 3 

--background Image with width and height
local background = display.newImageRect("Images/background.jpg", 2048,1536)

--characters image with width and height
local flounder = display.newImageRect("Images/flounder.png", 300, 300)

local stitch = display.newImageRect("Images/stitch.png", 300, 300)

local mood = display.newImageRect("Images/mood.png",300, 300)

--set initial x and y position of mood
mood.x = display.contentWidth/2
mood.y = 350

--set initial x and y position of stitch
stitch.x = display.contentWidth/1.2
stitch.y = 800

--set initial x and y position of flounder
flounder.x = 0
flounder.y = display.contentHeight/3

-- make flounder transparent
flounder.alpha = 0

-- make stitch transparent
stitch.alpha = 1

-- Function: MoveFlounder
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of flounder
local function MoveFlounder(event)
	--add the scroll speed to the x-value of flounder
	flounder.x = flounder.x + scrollSpeed 
	--change the transparency of flounder every time he moves so that it fades out
	flounder.alpha = flounder.alpha + 0.01
end 

--MoveFlounder will be called over and over again 
Runtime:addEventListener("enterFrame", MoveFlounder)


-- Function: MoveStitch
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function subtracts the scroll speed to the x-value of stitch
local function MoveStitch(event)
	--subtracts the scroll speed to the x-value of Stitch
	stitch.y = stitch.y - scrollSpeed
	stitch.x = stitch.x - scrollSpeed
	--change the transparency of Stitch every time he moves so that it fades out
	stitch.alpha = stitch.alpha - 0.0001
end 

--MoveStitch will be called over and over again 
Runtime:addEventListener("enterFrame", MoveStitch)

-- Function: RotateMood
-- Input: ths function accepts an event listener
-- Output: none
-- Description: this function rotates the Mood
local function RotateMood(event)
	--rotate mood
	mood.rotation = mood.rotation + 3
end

--run the rotation over and over
Runtime:addEventListener("enterFrame", RotateMood)

--Function: ExpandMood
-- Input: accepts an event listener
-- Output: none
-- Discription: this function expands the Mood
local function ScaleMood(event)
	--scale the image by 150% (x) and 40% (y)
	mood:scale(1.002, 1.002)
end 

--ScaleMood will be called over and over again 
Runtime:addEventListener("enterFrame", ScaleMood)

-- add text 
textObject = display.newText("Hard Work!!", 500, 400, nil, 80)
 
 --add color to text 
 textObject: setFillColor( 200/255, 0/255, 200/255 )


