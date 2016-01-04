local Player = require'class''Player'
local Court = require'game.Court'
local Vector2 = require'Vector2'


function Player:initialize( bottom )
	self.position = Vector2:new( 0, CourtCourt.length/2+Court.centreServiceLineLength )*(bottom and 1 or -1)
	self.forward = Vector2.forward*(bottom and -1 or 1)
	self.right = Vector2.right*(bottom and 1 or -1)
end