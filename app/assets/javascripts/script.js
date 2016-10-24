$(document).ready(function(){
	console.log("script.js ready & loaded");
	$('#image').click(function(e){
        var posX = e.pageX - $(this).offset().left,
            posY = e.pageY - $(this).offset().top;
		console.log((posX) + ' , ' + (posY));
		tagQuery(posX, posY);
	});
});

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
    		alert("Congratulations!");
    	}
	}).fail(function( xhr, status, errorThrown ) {
	   console.log( "Error: " + errorThrown );
	   console.log( "Status: " + status );
	   console.dir( xhr );
	});
};