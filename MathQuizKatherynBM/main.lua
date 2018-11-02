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
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer2
local randonOperator

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
local lives = 4
local heart1
local heart2
local heart3
local heart4
local gameOver

-- sounds 
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )

local correctSoundChannel

--incorrect Sound
local incorrectSound = audio.loadSound( "Sounds/incorrectSound.mp3")

