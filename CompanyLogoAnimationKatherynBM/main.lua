-----------------------------------------------------------------------------------------
--Title: CompanyLogo 
-- Name:Katheryn B M
--Course: ICS2O
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--background
display.setDefault("background", 0/255, 160/255, 0/255)

--display text 
local text = display.newText("Jumping Animations", 400, 400, nil, 70)

--position of text
text.x = 1048
text.y = display.contentHeight/3
--set colour
text:setTextColor(216/255, 19/255, 19/255)

--global variable
scrollspeed = 3
--the character
local pizzaMan = display.newImageRect("Images/CompanyLogoKatheryn@2x.png", 400, 400)

--make pizza man transparent
pizzaMan.alpha = 0
text.alpha = 1
--set the position for the pizza man
pizzaMan.x = 0
pizzaMan.y = display.contentHeight/2

--local function
local function MovePizzaMan(event)
	-- scroll speed
	pizzaMan.x = pizzaMan.x + scrollspeed
	--change the transparency
	pizzaMan.alpha = pizzaMan.alpha + 0.01
end

--call function 
Runtime:addEventListener("enterFrame", MovePizzaMan)

local function MoveText(event)
	--scroll speed
	text.x = text.x - scrollspeed
	--change the transparency
	text.alpha = text.alpha - 0.001
end
--call function
Runtime:addEventListener("enterFrame", MoveText)


local function RotatePizzaMan(evemt)
	--rotate pizza man
	pizzaMan.rotation = pizzaMan.rotation + 3
end
--call function
Runtime:addEventListener("enterFrame", RotatePizzaMan)

local function ScaleText(event)
	--scale the text
	text:scale(1.002, 1,002)
end

--call function
Runtime:addEventListener("enterFrame", ScaleText)
