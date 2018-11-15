-----------------------------------------------------------------------------------------
--Title: CompanyLogo 
-- Name:Katheryn B M
--Course: ICS2O
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--background
display.setDefault("background", 0/255, 160/255, 0/255)

--global variable
scrollspeed = 3
--the character
local pizzaMan = display.newImageRect("Images/CompanyLogoKatheryn@2x.png", 400, 400)

--make pizza man transparent
pizzaMan.alpha = 0

--set the position for the pizza man
pizzaMan.x = display.contentWidth/8
pizzaMan.y = display.contentHeight/2

--local function
local function MovePizzaMan(event)
	-- scroll speed
	pizzaMan.x = pizzaMan.x + scrollspeed
	--change the transparency
	pizzaMan.alpha = pizzaMan.alpha + 0.01
end

--call function 
Runtime:addEventListener("enterFrame", MovepizzaMan)




