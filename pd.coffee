window.onload = ->
	icell = $(window).innerWidth()
	iwidth = 200
	ispace = 10
	lwidth = iwidth+ispace
	inum = 0
	ipage = 0
	alwd = Array()
	altp = Array()
	url = 'http://www.wookmark.com/api/json/popular?callback=?'
	pd = 2
	onlod = (p)->
		if pd>1
			pd = 0
			$("#loading").show()
			$.getJSON url , "page=#{p}" ,(data)->
				$.each data , (index,obj)->
					omg = $ '<img/>'
					omg.attr "src",obj.preview
					$("#container").append omg
					miheigh = iwidth/obj.width*obj.height
					omg.css "width",iwidth
					omg.css "height",miheigh
					minidex = getmin()
					 
					omg.css "left", alwd[minidex] 
					omg.css "top", altp[minidex]
					altp[minidex]= altp[minidex] + miheigh + 10
			$("#loading").hide()
			pd = 2
		console.log()  
	setcell = ->
		inum = Math.floor icell/lwidth
		document.title= inum
		$("#container").css "width" , lwidth*inum-ispace
		console.log()
	setcell()
	for i in [0...inum]
		altp.push 0
		alwd.push i*lwidth
	console.log(alwd)
	onlod(ipage)
		
	console.log()
	getmin = ->
		mi = altp[0]
		index = 0
		for x in [0...altp.length]
			if mi > altp[x]
				mi = altp[x]
				index = x
		index
	$(window).on "scroll" , ->
		hi = $(window).innerHeight()+$(window).scrollTop()
		hdex = getmin()
		console.log($("#container").offset()) 
		if altp[hdex]< hi - 50
			
			onlod(ipage++)



	
	console.log()