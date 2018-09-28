-----------------------------------------------------------------------------------------
-- Name :Katheryn B.M
-- Course: ICS20
-- This program will make shapes with colour. The background will also be coloured.
-----------------------------------------------------------------------------------------

--create my local variables for my polygon
local halfWTri = display.contentWidth * 0.2
local halfHTri = display.contentHeight * 0.2
local verticesTriangle = { 500,370, 150,-225, 25,250, 300,512 }
local triangle
local myTriangle = display.newPolygon( halfWTri,halfHTri, verticesTriangle )
