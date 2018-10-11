-----------------------------------------------------------------------------------------
-- Title : Animating Images
-- Name : Katheryn B M
--  Course : ICS2O
-- This program will have 3 object moving in different directions
-----------------------------------------------------------------------------------------
-- Get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)

--global Variables
scrollSpeed = 4

--the background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--characters images with width and height
local ghost = display.newImageRect("Images/ghost.png", 300, 300)

local butterfly =  display.newImageRect("Images/butterfly.png", 300, 300)

local turtle = display.newImageRect("Images/turtle.png",300, 300)

--set initial position of turtle
turtle.x = 1
turtle.y = display.contentHeight/2
--set initial position of the butterfly
butterfly.x = 1100
butterfly.y = 100

--set ghost to be transparent
ghost.alpha = 0

--set the transparency of butterfly
butterfly.alpha = 1

--set initial position of ghost
ghost.x = display.contentWidth/1
ghost.y = 3

--Function : MoveGhost
-- Input : This function accepts an event listener
-- Output : none 
--Discription : This function adds the scroll speed for the Ghost
local function MoveGhost(event)
	--add the scroll speed of the ghost
	ghost.y = ghost.x - scrollSpeed
	ghost.x = ghost.y - scrollSpeed
	--change the transparency of the ghost every time it moves so that it fades out
	ghost.alpha = ghost.alpha + 0.01
end

--MoveGhost will be called over and over again 
Runtime:addEventListener("enterFrame",MoveGhost)


--Function : Movebutterfly
-- Input : This function accepts an event listener
-- Output : none 
--Discription : This function adds the scroll speed for the Butterfly
local function MoveButterfly(event)
	--add the scroll speed of the butterfly
	butterfly.x = butterfly.x - scrollSpeed
	--change the transparency of the ghost every time it moves so that it fades in
	butterfly.alpha = butterfly.alpha - 0.001
end

--MoveGhost will be called over and over again 
Runtime:addEventListener("enterFrame",MoveButterfly)

