-----------------------------------------------------------------------------------------
--Title: CompanyLogo 
-- Name:Katheryn B M
--Course: ICS2O
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--load phisics
local physics = require("physics")

--start phisics
physics.start()
-----------------------------------------------------------------------------------------
-- Objects
-----------------------------------------------------------------------------------------
--ground
local ground = display.newImage("Images/ground.png", 0, 0)

--put the ground at the bottom
ground.x = display.contentWidth/2
ground.y = display.contentHeight/1

-- change the wisth to be the same as the screen
ground.width = display.contentWidth * 2

--add  to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})
-----------------------------------------------------------------------------------------




