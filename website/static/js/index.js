
/*
 * index.js - Nicholas V. Giamblanco.
 * performs tasks required for the index of this website. 
 */

/* Global Bars */
var cnvs;
var ctx;

var text_decode = "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()~_-+,.:";
text_decode = text_decode.split("");

var search_query = "";
var summary=[]

var font_size = 45;
var columns;

//an array of drops - one per column
var drops = [];

// states: 0 = rand, 1 = query, 2 = results, 3 = loading (may not even occur.)
var draw_state = 0;

var rotation = 29;
var which_line =0;


function open_upload_modal() {
	$("#file_modal").fadeIn('slow', function() {

	});
}

function close_upload_modal() {
	$("#file_modal").fadeOut('fast', function() {

	});
}

/*
filedrag.js - Asynchronous File Upload
Developed by: Nicholas Giamblanco
*/

function upload_file() {

	var form_data = new FormData($('#upload-file-form')[0]);
	draw_state = 3;
	close_upload_modal()
	$.ajax({
	    type: "POST",
	    url: "/uploads",
	    data: form_data,
        contentType: false,
        cache: false,
        processData: false,
        async: true,
	    success: function(ret) {
	    	console.log(ret["res"])
	    	summary=ret["res"];
	    	draw_state = 2;
	    },
	    error: function(request, status, err) {
	        console.log(status);
	        console.log(err);
	        draw_state = 0;
	    }
	});
}


/*reset the view */
function reset() {

}


function send_query(query) {
	var status = 1;

	draw_state = 3;
	$.post("/queries", {name: ""}, function( data ) {
	console.log(data)
	  if(data) {
	  	console.log(data)
	  	draw_state = 2;
	  } else {
	  	draw_state = 0;
	  }
	});	

	return status;
}

function get_search_contents() {
	$("#search").on("change keyup paste",function(e) {
		if($("#search").val() || $("#search").val() != search_query) {
			if(draw_state == 0) {
				draw_state = 	1;
			}
			search_query 	=	$("#search").val();
			if(e.which == 13 && $("#search").val()) {
	        	send_query(search_query);
	    	}
			search_query 	= 	search_query.split("");
		} else {
			if(draw_state == 1 || draw_state == 2) {
				draw_state = 	0;
			}			
		}
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
			ctx.fillStyle = "#F00";
			status_q = " Querying ["+$("#search").val()+"]...";
			status_q = status_q.split("");
			for(var qi = 0; qi < status_q.length; ++ qi) {
				t=status_q[qi];
				ctx.fillText(t, qi*font_size,2*font_size);
			}
			ctx.fillStyle = "#0F0";
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
			xoffset = font_size*window.innerWidth*0.001;
			yoffset = font_size*10;
			if(rotation == 29) {
				ctx.fillStyle = "#FFF";
				ctx.fillText(">>",xoffset-2*font_size, yoffset);
			}

			i=which_line

			for(var j=0; j < summary[i].length; ++j) {
				
				var text = summary[i][j];
				ctx.fillStyle = "#FF0";
				ctx.fillText(text, j*font_size+xoffset, i*font_size+yoffset);
			}

			which_line = which_line + 1
			which_line = which_line % summary.length
			rotation = rotation +1;
			rotation = rotation % 30;
			break;

		case 3:
			//looping over drops
			ctx.fillStyle = "#0F0";
			status_q = " Loading ...";
			status_q = status_q.split("");
			for(var qi = 0; qi < status_q.length; ++ qi) {
				t=status_q[qi];
				ctx.fillText(t, qi*font_size,2*font_size);
			}
			for(var i = 0; i < drops.length; i++) {
				if(Math.random() > 0.98) {
					ctx.fillText("%", 0, i*font_size);
					for(var where = 0; where < status_q.length; ++where) {
						var text = status_q[where];
						ctx.fillText(text, drops[i]*font_size, i*font_size);
						
						if(drops[i]*font_size > cnvs.width && Math.random() > 0.975){
							drops[i] = 0;
						}
						drops[i]++;
					}
				}
			}
			break;
	}
}


$(function() {

	$("#cleanup_btn").on("click", function(e) {
		reset();
	});

	$("#upload_btn").on("click", function(e) {
		open_upload_modal();
	});

	$("#modal_close").on("click", function(e) {
		close_upload_modal();
	})


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

	setInterval(function() {rand_draw(cnvs, ctx, font_size, text_decode, drops)}, 33);
	get_search_contents()

});


