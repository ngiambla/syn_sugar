
/* Global Bars */
var cnvs;
var ctx;

var text_decode = "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()~_-+,.:";
text_decode = text_decode.split("");

var search_query = "";

var font_size = 10;
var columns;

//an array of drops - one per column
var drops = [];
var pause_rand_draw = false;



/* Load Document */
function load_document(filename) {

}

/*reset the view */
function reset() {

}

/* get relations between sentences */
function get_relationship() {
	var relationships = $("#relationships").val()
}

/* draw out document */
function draw_document() {
	
}

function get_search_contents() {
	$("#search").on("change keyup paste",function() {
		if($("#search").val()) {
			if(!pause_rand_draw) {
				pause_rand_draw = 	true;
			}
		} else {
			if(pause_rand_draw) {
				pause_rand_draw = 	false;
			}			
		}
		search_query 	=	$("#search").val();
		console.log(search_query);
		search_query 	= 	search_query.split("");
		console.log(search_query);
	});
}

//drawing the characters
function rand_draw(cnvs, ctx, font_size, text_decode, drops) {

	//Black BG for the canvas
	//translucent BG to show trail
	ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
	ctx.fillRect(0, 0, cnvs.width, cnvs.height);
	
	ctx.fillStyle = "#AFF"; //green text
	ctx.font = font_size + "px monospace";

	if(!pause_rand_draw) {

		//looping over drops
		for(var i = 0; i < drops.length; i++) {
			var text = text_decode[Math.floor(Math.random()*text_decode.length)];

			//y = i*font_size, x = value of drops[i]*font_size
			ctx.fillText(text, drops[i]*font_size, i*font_size);
			
			//sending the drop back to the top randomly after it has crossed the screen
			//adding a randomness to the reset to make the drops scattered on the X axis
			if(drops[i]*font_size > cnvs.width && Math.random() > 0.975)
				drops[i] = 0;
			
			//incrementing X coordinate
			drops[i]++;
		}
	} else {
		//looping over drops
		for(var i = 0; i < drops.length; i++) {
			if(Math.random() > 0.975) {
				for(var where = 0; where < search_query.length; ++where) {

					var text = search_query[where];

					//y = i*font_size, x = value of drops[i]*font_size
					ctx.fillText(text, drops[i]*font_size, i*font_size);
					
					if(drops[i]*font_size > cnvs.width && Math.random() > 0.975)
						drops[i] = 0;
					
					//incrementing X coordinate
					drops[i]++;
				}
			}
		}
		

	}
}


function draw_summary() {

}


$(function() {
	cnvs = document.getElementById("cnvs");
	ctx = cnvs.getContext("2d");

	//making the canvas full screen
	cnvs.height = 400;
	cnvs.width = window.innerWidth;


	font_size = 10;
	columns = cnvs.width/font_size;

	//x below is the x coordinate
	//1 = y co-ordinate of the drop(same for every drop initially)
	for(var x = 0; x < columns; x++) {
		drops[x] = (Math.random()*1000)%columns; 
	}

	setInterval(function() {rand_draw(cnvs, ctx, font_size, text_decode, drops)}, 33);
	get_search_contents()
});


