$(document).ready(function(){
	console.log("script.js ready & loaded");
	$('#image').click(function(e){
        var posX = $(this).offset().left,
            posY = $(this).offset().top;
		console.log((e.pageX - posX) + ' , ' + (e.pageY - posY));
	});
});