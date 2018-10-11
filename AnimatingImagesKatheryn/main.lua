-----------------------------------------------------------------------------------------
-- Title : Animating Images
-- Name : Katheryn B M
--  Course : ICS2O
-- This program will have 3 object moving in different directions
-----------------------------------------------------------------------------------------
-- Get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)

--global Variables
scrollSpeed = 3

--the background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--character images with width and height
local ghost = display.newImageRect("Images/ghost.png", 300, 300)

--set ghost to be transparent
ghost.alpha = 0

--set initial position of ghost
ghost.x = display.contentWidth/1
ghost.y = 3

--Function : MoveShip
-- Input : This function accepts an event listener
-- Output : none 
--Discription : This function adds the scroll speed for the Ghost
local function MoveGhost(event)
	--add the scroll speed of the ghost
	ghost.y = ghost.x - scrollSpeed
	ghost.x = ghost.y - scrollSpeed
	--change the transparency of the ghost every time it moves so that it fades out
	ghost.alpha = ghost.alpha + 0.001
end

--MoveGhost will be called over and over again 
Runtime:addEventListener("enterFrame",MoveGhost)


