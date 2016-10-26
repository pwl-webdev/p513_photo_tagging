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
	$('#close').click(function(e){
		$(".high_score_box").hide();
		$("#image").off();
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
    		//alert("Congratulations! Your time is "+json.time+"s");
    		showHighScoreBox(json.time, posX, posY);
    	} else{
    		$(".target_box").fadeOut( "slow" );
    	}
	}).fail(function( xhr, status, errorThrown ) {
	   console.log( "Error: " + errorThrown );
	   console.log( "Status: " + status );
	   console.dir( xhr );
	});
};

function showHighScoreBox(time, posX, posY){
			$(".congratulations").html(`Wow, you did it in ${time} seconds!`);
			$(".high_score_box").show();
			$("#button").click(function(e){
				e.preventDefault();
					$.ajax({
						url: window.location.href,
						data: {
							posX: posX,
							posY: posY,
							name: $("#user_name_input").val()
						},
						type: "GET",
						dataType: "json",
					}).done(function( json ) {
				    	console.log(json.status)
				    	if(json.status == "success"){
				    		console.log("się udało!!!");
				    		$(".to_hide").show();
				    		json.records.forEach(function(entry){
				    			$(`<tr><td>${entry.name}</td><td>${entry.guess_time}s</td></tr>`).appendTo('table')
				    		});
				    		$("#user_name_input").prop('disabled', false);
				    		$("#button").prop('disabled', false);
				    		$(".target_box").fadeOut( "slow" );
				    	} else{
				    		console.log("się nie udało!!!!")
				    	}
					}).fail(function( xhr, status, errorThrown ) {
					   console.log( "Error: " + errorThrown );
					   console.log( "Status: " + status );
					   console.dir( xhr );
					});
			});
}