$(document).ready(function(){
	console.log("script.js ready & loaded");
	$('#image').click(function(e){
        var posX = e.pageX - $(this).offset().left,
            posY = e.pageY - $(this).offset().top;
		console.log((posX) + ' , ' + (posY));
		var target_box_X = e.pageX - 10;
		var target_box_Y = posY - 10;
		$(`<div class="target_box" id = "c${clickCounter}" style="top: ${target_box_Y}px; left: ${target_box_X}px;"></div>`).appendTo('#frame');
		tagQuery(posX, posY);
		clickCounter++;
	});
});

var clickCounter = 0;

var tagQuery = function(posX, posY){
	//console.log($('#title').val());
	$.ajax({
		url: window.location.href,
		data: {
			posX: posX,
			posY: posY
		},
		type: "GET",
		dataType: "json",
	}).done(function( json ) {
    	console.log(json.status)
    	if(json.status == "success"){
    		$(".target_box").css("border-color","green");
    		alert("Congratulations! Your time is "+json.time+"s");
    	} else{
    		$(".target_box").fadeOut( "slow" );
    	}
	}).fail(function( xhr, status, errorThrown ) {
	   console.log( "Error: " + errorThrown );
	   console.log( "Status: " + status );
	   console.dir( xhr );
	});
};