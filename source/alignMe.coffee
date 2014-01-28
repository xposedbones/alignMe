(($)->

	$.fn.alignMe = (options) ->
		defaults = 
			horizontal: "center" 	# left center or right
			vertical: "center"		# top center bottom
			offsetX: 0
			offsetY: 0

		options = $.extend defaults, options

		switch options['horizontal']
			when "left","center" then posX = "left"
			when "right" then posX = "right"
			else posX = "left"

		switch options['vertical']
			when "top", "center", "middle" then posY = "top"
			when "bottom" then posY = "bottom"
			else posY = "top"

		if options['horizontal'] is "left" or options['horizontal'] is "right"
			nX = 0
		else
			nX = -((@outerWidth() / 2) - options['offsetX'])

		if options['vertical'] is "top" or options['vertical'] is "bottom"
			nY = 0
		else
			nY = -((@outerHeight() / 2) - options['offsetY']) 

		@parent().css "position", "relative"
		@css "position", "absolute"

		console.log("posX = " + posX + ", posY = " + posY + ", nX = " + nX + ", nY = " + nY)

		if options['horizontal'] is "center" and options['vertical'] isnt "center"
			@css				
				"left": "50%"
				posY: 0 + options['offsetY'] + "px"
				"margin-left": nX + "px"

		else if options['horizontal'] isnt "center" and options['vertical'] is "center"
			@css				
				"top": "50%"
				"margin-top": nY + "px"
		else if options['horizontal'] is "center" and options['vertical'] is "center"
			@css				
				"top": "50%"
				"left": "50%"
				"margin-top": nY + "px"
				"margin-left": nX + "px"

		if options['horizontal'] is "left"
			@css
				"left" : 0 + options['offsetX'] + "px"
		else if options['horizontal'] is "right"
			@css
				"right" : 0 + options['offsetX'] + "px"

		if options['vertical'] is "top"
			@css
				"top" : 0 + options['offsetX'] + "px"
		else if options['vertical'] is "bottom"
			@css
				"bottom" : 0 + options['offsetX'] + "px"
) jQuery