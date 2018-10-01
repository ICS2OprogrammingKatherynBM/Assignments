-----------------------------------------------------------------------------------------
 --Title: Drawing Shapes
-- Name :Katheryn B.M
-- Course: ICS20
-- This program will make shapes with colour. The background will also be coloured.
-----------------------------------------------------------------------------------------

--Set background color
display.setDefault("background", 229/255, 204/255,255/255 )

-- Hide status bar 
display.setStatusBar(display.HiddenStatusBar ) 

--Make rounded rectangle
local roundedRect = display.newRoundedRect( 185, 165, 275, 154, 35 )
roundedRect.path.radius = 150

--Set color for rounded rectangle
roundedRect:setFillColor( 0/255, 127/255, 127/255  )

--Make a polygon
local myPolygon
local polygonVertices = {10,-90, 80,-25, 33,0, 40,80, 10,35 }
local myPolygon = display.newPolygon(520, 292, polygonVertices )

--Set color for Polygon
myPolygon.fill = { 0/255, 127/255, 127/255 }
 
 -- Make a Triangle
 local myTriangle
 local triangleVertices = { 75,50, 25,200, 130,200 }
 local myTriangle = display.newPolygon(300,550, triangleVertices ) 

 --Set color for Triangle 
 myTriangle.fill = { 0/255, 127/255, 127/255 }
textObject = display.newText("Rounded Rectangle", 215, 330, native.systemFont, 43 )
textObject:setFillColor( 204/255, 0/255, 102/255 )
textObject = display.newText(" Random Polygon", 635, 175, native.systemFont, 43 )
textObject:setFillColor( 204/255, 0/255, 102/255)
textObject = display.newText(" Triangle", 300, 670, native.systemFont, 43 )
textObject:setFillColor(204/255, 0/255, 102/255)

