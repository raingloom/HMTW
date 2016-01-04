package.loaded.middleclass = require'lib.middleclass'--so that other libs can find it too
package.loaded.class = package.loaded.middleclass

local Court = require'game.Court'

--hoisting declarations
local screenWidth, screenHeight, screenLimit, isHeightLimit, m2px


function love.load()
	love.resize()
end


function love.resize()
	screenWidth,screenHeight = love.graphics.getDimensions()
	isHeightLimit = false
	if screenHeight > screenWidth then
		screenLimit = screenWidth
	else
		screenLimit = screenHeight
		isHeightLimit = true
	end
	m2px = math.min( screenWidth/Court.doubleWidth, screenHeight/Court.length )
end


function love.draw()
	local tx,ty = screenWidth/2-Court.doubleWidth/2*m2px,screenHeight/2-Court.length/2*m2px
	love.graphics.translate( tx, ty )
	Court.renderLines( m2px )
end