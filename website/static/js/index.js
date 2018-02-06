
/* Global Bars */
var cnvs;
var ctx;

var text_decode = "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()~_-+,.:";
text_decode = text_decode.split("");

var search_query = "";
var summary=[]

var font_size = 50;
var columns;

//an array of drops - one per column
var drops = [];
var draw_state = 0;

var rotation = 0;


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

function send_query(query) {
	var status = 1;
	draw_state = 2;
	return status;
}

function get_search_contents() {
	$("#search").on("change keyup paste",function(e) {
		if($("#search").val()) {
			if(draw_state == 0) {
				draw_state = 	1;
			}
		} else {
			if(draw_state == 1 || draw_state == 2) {
				draw_state = 	0;
			}			
		}
		search_query 	=	$("#search").val();
		if(e.which == 13 && $("#search").val()) {
        	send_query(search_query);
    	}
		search_query 	= 	search_query.split("");
	});
}

//drawing the characters
function rand_draw(cnvs, ctx, font_size, text_decode, drops) {

	//Black BG for the canvas
	//translucent BG to show trail

	ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
	ctx.fillRect(0, 0, cnvs.width, cnvs.height);
	
	ctx.font = font_size + "px monospace";

	switch(draw_state) {
		case 0:
			ctx.fillStyle = "#AFF";
			//looping over drops
			for(var i = 0; i < drops.length; i++) {
				var text = text_decode[Math.floor(Math.random()*text_decode.length)];

				//y = i*font_size, x = value of drops[i]*font_size
				ctx.fillText(text, drops[i]*font_size, i*font_size);
				
				//sending the drop back to the top randomly after it has crossed the screen
				//adding a randomness to the reset to make the drops scattered on the X axis
				if(drops[i]*font_size > cnvs.width && Math.random() > 0.975)
					drops[i] = -1;
				
				//incrementing X coordinate
				drops[i]++;
			}
			break;

		case 1:
			//looping over drops
			ctx.fillStyle = "#0F0";
			status_q = " Querying ["+$("#search").val()+"]...";
			status_q = status_q.split("");
			for(var qi = 0; qi < status_q.length; ++ qi) {
				t=status_q[qi];
				ctx.fillText(t, qi*font_size, 1*font_size);
			}
			for(var i = 0; i < drops.length; i++) {
				if(Math.random() > 0.98) {
					ctx.fillText("*", 0, i*font_size);

					

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
			break;

		case 2:
			ctx.font = font_size + "px monospace";
			xoffset = font_size*window.innerWidth*0.04;
			yoffset = font_size*10;
			ctx.fillStyle = "rgba(0, 0, 0, 0.01)";
			ctx.fillRect(0, yoffset-1*font_size, font_size, font_size*summary.length);
			if(rotation == 29) {
				ctx.fillStyle = "#FFF";
				ctx.fillRect(0, yoffset-1*font_size, font_size, font_size*summary.length);
			}			
			for(var i=0; i < summary.length; ++i) {


				for(var j=0; j < summary[i].length; ++j) {
					
					var text = summary[i][j];
					ctx.fillStyle = "#FF0";
					ctx.fillText(text, j*font_size+xoffset, i*font_size+yoffset);
				}


			}
			rotation = rotation +1;
			rotation = rotation % 30;
			break;
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

	for(var i = 0; i < 20; ++i) {
		summary[i] = "This is a sentence "+i+".";
	}

	font_size = 10;
	columns = cnvs.width/font_size;

	//x below is the x coordinate
	//1 = y co-ordinate of the drop(same for every drop initially)
	for(var x = 0; x < columns; x++) {
		drops[x] = (Math.random()*1000)%columns; 
	}

	setInterval(function() {rand_draw(cnvs, ctx, font_size, text_decode, drops)}, 35);
	get_search_contents()
});


