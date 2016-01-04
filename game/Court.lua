local Court = {}


local ft2m = 0.3048
-- **PARAMS**
Court.length = 78*ft2m
Court.singleWidth = 27*ft2m
Court.doubleWidth = 36*ft2m
Court.centreServiceLineLength = 21*ft2m

-- **Calculated**
Court.top={}
Court.bottom={}
--TODO: this

function Court.renderLines( scale )
	local courtLength, courtSingleWidth, courtDoubleWidth, centreServiceLineLength = 
	Court.length*scale, Court.singleWidth*scale, Court.doubleWidth*scale, Court.centreServiceLineLength*scale
	local line = love.graphics.line
	
	--sides
	line{ 0,0, 0,courtLength }
	line{ courtDoubleWidth,0, courtDoubleWidth,courtLength }
	
	--baselines
	line{ 0,0, courtDoubleWidth,0 }
	line{ 0,courtLength, courtDoubleWidth,courtLength }
	
	--half
	local halfLength = courtLength/2
	line{ 0,halfLength, courtDoubleWidth,halfLength }
	
	--single sideline
	local padding = (courtDoubleWidth-courtSingleWidth)/2
	line{ padding,0, padding,courtLength }
	padding = courtDoubleWidth-padding
	line{ padding,0, padding,courtLength }
	
	--centre service line
	local halfWidth = courtDoubleWidth/2
	line{ halfWidth,halfLength-centreServiceLineLength, halfWidth,halfLength+centreServiceLineLength }
	
	--service lines
	line{ padding,halfLength-centreServiceLineLength, courtDoubleWidth-padding,halfLength-centreServiceLineLength }
	line{ padding,halfLength+centreServiceLineLength, courtDoubleWidth-padding,halfLength+centreServiceLineLength }
end


return Court