<<<<<<< HEAD

-----------------------------------------------------------------------------------------
-- Title: Math Quiz
-- Name: KatherynB.M
-- Course: ISC2O
-- This program displays a math question and asks the user to answer in a numeric textField.
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background color
local background = display.newImageRect("Images/background.jpg", 2048, 1536)
-----------------------------------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------------------------------

--create local VARIABLES    				
local questionObject			
local incorrectObject
local correctObject

local numericField

local userAnswer
local correctAnswer

local randomOperator
local randomAdd1
local randomAdd2
local randomSub1
local randomSub2
local randomMult1
local randomMult2
local randomDiv1
local randomDiv2

local numberOfPoints = 0
local pointsObjects

-----------------------------------------------------------------------------------------
--LCOAL VARIABLES FOR TIMER AND LIVES
-----------------------------------------------------------------------------------------
local totalSeconds = 10 
local secondsLeft = 10
local clockText 

local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

local gameOver
local youWin

--*** ADD LOCAL VARIABLES FOR : INCORRECT OBJECT, POINTS OBJECT, POINTS
-----------------------------------------------------------------------------------------
--SOUNDS
-----------------------------------------------------------------------------------------

--correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to a MP3 file

local correctSoundChannel

--Incorrect Sound
local incorrectSound = audio.loadSound("Sounds/incorrectSound.mp3")

local incorrectSoundChannel 

local gameOverSound = audio.loadSound("Sounds/gameOverSound.mp3")

local gameOverSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
--function for when you win
local function YouWin()
	if (numberOfPoints == 5) then
		youWin.isVisible = true
		--get rid of objects

		numericField.isVisible = false
	end
end

local function AskQuestion()
	--make 4 random operators between a max. and a min. number
	randomAdd1 = math.random(1, 20)
	randomAdd2 = math.random(1, 20)

	randomSub1 = math.random(1, 20)
	randomSub2 = math.random(1, 20)

	randomMult1 = math.random(1, 10)
	randomMult2 = math.random(1, 10)

	randomDiv1 = math.random(1, 10)
	randomDiv2 = math.random(1, 10)

	-- create random operator
	randomOperator = math.random(1,4)

	-- generate random number from 1 to 4
	if (randomOperator== 1) then
		--correct answer
		correctAnswer = randomAdd1 + randomAdd2

		--crete question in the text objct
		questionObject.text = (randomAdd1 .. " + " .. randomAdd2 .. " = ")

		--otherwise if random operator is 2 then do subtraction
	elseif (randomOperator == 2) then 

		if (randomSub1 > randomSub2 ) then
		 -- correct answer

			correctAnswer = randomSub1 - randomSub2

		 	-- create question in a text object
		 	questionObject.text = randomSub1 .. " - " .. randomSub2 .. " = "

		else
		 	-- correct answer

			correctAnswer = randomSub2 - randomSub1

		 	-- create queston in text object
		 	questionObject.text = randomSub1 .. " - " .. randomSub2 .. " = "

		end

	elseif (randomOperator == 3) then 

		-- correct answer

		correctAnswer = randomMult1 * randomMult2

		--make question in a text object 

		questionObject.text = randomMult1 .. " * " .. randomMult2 .. " = "

	elseif (randomOperator == 4) then 

		-- make sure there are no decimals
		temp = randomDiv1 * randomDiv2

		correctAnswer = temp / randomDiv2

		-- make question in a text object 

		questionObject.text = temp .. " / " .. randomDiv2 .. " = "
	end
end



local function UpdateLives()

	if (lives == 2) then 
		heart3.isVisible = false

	elseif (lives == 1) then 
		heart2.isVisible = false

	elseif (lives == 0) then
		heart1.isVisible = false
		gameOver.isVisible = true

		
		numericField.isVisible = false
		gameOverSoundChannel = audio.play(gameOverSound)
	end
end


local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives()
		AskQuestion()


		--***CALL THE FUNCTION TO ASK A NEW QUESTIION
	end
end



--function that calls the timer
local function StartTimer()
	--create a countdown timer that loops infinitely 
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end




local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end



local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end 




local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if( event.phase == " began " ) then
		

	elseif (event.phase == "submitted") then 

		--when the answer (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer the same:
		if (userAnswer == correctAnswer) then 
			numberOfPoints = numberOfPoints + 1
			correctObject.isVisible = true

			correctSoundChannel = audio.play(correctSound)

			pointsObjects.text = "points = ".. numberOfPoints

			timer.performWithDelay(1000, HideCorrect)
			
			secondsLeft = totalSeconds 

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			lives = lives - 1

			 --call the function
			 UpdateLives()
			 print(lives)
			 YouWin()

			incorrectSoundChannel = audio.play(incorrectSound)

			timer.performWithDelay(1000, HideIncorrect)

			secondsLeft = totalSeconds

		end

		event.target.text = ""
	end
end

-----------------------------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------------------------

--display a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor( 1, 1, 1)


--display number of points
pointsObjects = display.newText("", display.contentWidth/2, display.contentHeight/4, nil, 50)
pointsObjects.text = ("points = " .. numberOfPoints)


--create the correct text object and make it invisible 
correctObject = display.newText(" Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor( 255/255, 255/255, 102/255)
correctObject.isVisible = false

clockText = display.newText("", display.contentWidth * 4 / 5, display.contentHeight * 3/ 5, nil, 50)

--create the incorrect text object and make it invisible
incorrectObject = display.newText(" Incorrect ", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor( 255/255, 210/255, 40/255)
incorrectObject.isVisible = false 

-- Create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
gameOver.x = display.contentWidth * 1/2
gameOver.y = display.contentHeight * 1/2
gameOver.isVisible = false

youWin = display.newImageRect("Images/youWin.jpg", display.contentWidth, display.contentHeight)
youWin.x = display.contentWidth * 1/2
youWin.y = display.contentHeight * 1/2
youWin.isVisible = false

--create the lives to display on screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8 
heart1.y = display.contentHeight * 1 / 7


heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8 
heart2.y = display.contentHeight * 1 / 7


heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8 
heart3.y = display.contentHeight * 1 / 7

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------


--call the function to ask the questions
AskQuestion()

--call the functions
StartTimer()
=======
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide status bar 
display.setStatusBar(display.HiddenStatusBar)

-- put background
local background = display.newImageRect("Images/background.jpg", 2048, 1536)

--create local variables 
local questionObject 
local incorrectObject
local correctObject
local numericTextField
local numericField
local randomAdd1
local randomAdd2
local randomSub1
local randomSub2
local randomMult1
local randomMult2
local randomDiv1
local randomDiv2
local userAnswer
local correctAnswer
local incorrectAnswer2
local randomOperator
local temp

--sounds
local correctSound
local incorrectSound
local incorrectSoundChannel

--points
local correctAnswer
local numberOfPoints = 0
local pointsObjects
local points

--timer
local totalSeconds = 10 
local secondsLeft = 10
local clockText 
local countDownTimer

--lives
local lives = 2
local heart1
local heart2
local heart3
local gameOver

-- sounds 
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )

local correctSoundChannel

--incorrect Sound
local incorrectSound = audio.loadSound( "Sounds/incorrectSound.mp3")

--local functions
local function AskQuestion()
	--make 4 random operators between a max. and a min. number
	randomAdd1 = math.random(1, 20)
	randomAdd2 = math.random(1, 20)

	randomSub1 = math.random(1, 20)
	randomSub2 = math.random(1, 20)

	randomMult1 = math.random(1, 10)
	randomMult1 = math.random(1, 10)

	randomDiv1 = math.random(1, 10)
	randomDiv2 = math.random(1, 10)
	-- generate random number from 1 to 4
	if (randomOperator== 1) then
		--correct answer
		correctAnswer = randomAdd1 + randomAdd2

		--crete question in the text objct
		questionObject.text = randomAdd1 .. " + " .. randomAdd2 .. " = "

		--otherwise if random operator is 2 then do subtraction
	elseif (randomOperator == 2) then 

		if (randomSub1 > randomSub2 ) then
		 -- correct answer

			correctAnswer = randomSub1 - randomSub2

		 -- create question in a text object
		 questionObject.text = randomSub1 .. " - " .. randomSub2 .. " = "

		else
		 -- correct answer

			correctAnswer = randomSub2 - randomSub1

		 -- create queston in text object
		 questionObject.text = randomSub1 .. " - " .. randomSub2 .. " = "

		end

	elseif (randomOperator == 3) then 

		-- correct answer

		correctAnswer = randomMult1 * randomMult2

		--make question in a text object 

		questionObject.text = randomMult1 .. " * " .. randomMult2 .. " = "

	elseif (randomOperator == 4) then 

		-- make sure there are no decimals
		temp = randomDiv1 * randomDiv2

		correctAnswer = temp / randomDiv2

		-- make question in a text object 

		questionObject.text = temp .. " / " .. randomDiv2 .. " = "
	end
end

local function UpdateLives()

	if (lives == 2) then 
		heart3.isVisible = false

	elseif (lives == 1) then
		heart2.isVisible = false

	elseif (lives == 0) then
		heart1.isVisible = false

		gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
		gameOver.x = display.contentWidth * 1/2
		gameOver.y = display.contentHeight * 1/2
		numericField.isVisible = false
		gameOverSoundChannel = audio.play(gameOverSound)
	end
end

local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives()
		AskQuestion()


		--***CALL THE FUNCTION TO ASK A NEW QUESTIION
	end
end



--function that calls the timer
local function StartTimer()
	--create a countdown timer that loops infinitely 
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end




local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end



local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end 




local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if( event.phase == " began " ) then
		elseif (event.phase == "submitted") then 

		--when the answer (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer the same:
		if (userAnswer == correctAnswer) then 
			numberOfPoints = numberOfPoints + 1
			correctObject.isVisible = true

			correctSoundChannel = audio.play(correctSound)

			pointsObjects.text = "points = ".. numberOfPoints

			timer.performWithDelay(1000, HideCorrect)

		else
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			lives = lives - 1

			 --call the function
			 UpdateLives()
			 print(lives)


			incorrectSoundChannel = audio.play(incorrectSound)

			timer.performWithDelay(1000, HideIncorrect)

			event.target.text = ""
		end
	end
end
	


-----------------------------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------------------------

--display a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor( 100/255, 0/255, 120/255)


--display number of points
pointsObjects = display.newText("", display.contentWidth/2, display.contentHeight/4, nil, 50)
pointsObjects.text = ("points = " .. numberOfPoints)


--create the correct text object and make it invisible 
correctObject = display.newText(" Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor( 255/255, 255/255, 102/255)
correctObject.isVisible = false

clockText = display.newText("", display.contentWidth * 4 / 5, display.contentHeight * 3/ 5, nil, 50)

--create the incorrect text object and make it invisible
incorrectObject = display.newText(" Incorrect ", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor( 255/255, 210/255, 40/255)
incorrectObject.isVisible = false 

-- Create numeric field 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"


--create the lives to display on screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8 
heart1.y = display.contentHeight * 1 / 7


heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8 
heart2.y = display.contentHeight * 1 / 7


heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8 
heart3.y = display.contentHeight * 1 / 7

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-----------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------


--call the function to ask the questions
AskQuestion()

--call the functions
StartTimer()
>>>>>>> 82ff8a9274604b656c7b996aee6054ee6b454fec
