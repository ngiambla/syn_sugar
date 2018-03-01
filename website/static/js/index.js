
/*
 * index.js - Nicholas V. Giamblanco.
 * performs tasks required for the index of this website. 
 */

/* Global Bars */
var cnvs;
var ctx;
var list;
var type;


var text_decode 	= "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()~_-+,.:".split("");
var search_query 	= "";
var summary 		= {};
var doc  			= {};

var summary_h;
var sentence_len_map;
var entropy_map;

var font_size 		= 45;
var columns;

//an array of drops - one per column
var drops 			= [];

// states: 0 = rand, 1 = query, 2 = results, 3 = loading (may not even occur.)
var draw_state 		= 0;
var rotation 		= 29;
var which_line 		= 0;


function open_upload_modal() {
	$("#file_modal").fadeIn('slow', function() {

	});
}

function close_upload_modal() {
	$("#file_modal").fadeOut('fast', function() {

	});
}


function updateHeight() {
	stroll.bind('ul', { live: true } );
}

function load_doc(doc, summary) {
	$("ul").fadeOut('fast', function(e) {
		$("ul").empty();
		$("ul").fadeIn('fast', function(e) {
			for(var i in doc) {
				item = '<li id="'+ i +'">'+doc[i]+'</li>'
				$("ul").append(item);
				if(i in summary) {
					$("#"+i).css('background-color', 'green');
				}
			}	
		});
	});
}


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
	    	summary 			= ret["res"][0];
	    	doc 				= ret["res"][1];
	    	sentence_len_map 	= ret["res"][2];
	    	entropy_map			= ret["res"][3];
	    	load_doc(doc, summary);
	    	draw_state 			= 2;
	    },
	    error: function(request, status, err) {
	        console.log(status);
	        console.log(err);
	        draw_state = 0;
	    }
	});
}


/*reset the view */
function reset_sugar() {
	draw_state=0;
	doc={};
	load_doc(doc, doc);
	$("#cnvs").slideUp("fast", function() {

	});
}


function query_doc(query) {
	var status = 1;
	draw_state = 3;	

	setTimeout(function () {
		draw_state = 2;
	}, 5000);

	return status;
}

function get_search_contents() {
	$("#search").on("change keyup paste",function(e) {
		$("#cnvs").slideDown("fast", function() {
		});		
		if($("#search").val() || $("#search").val() != search_query) {
			if(draw_state == 0) {
				draw_state = 	1;
			}
			search_query 	=	$("#search").val();
			if(e.which == 13 && $("#search").val()) {
	        	query_doc(search_query);
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
			xoffset = font_size*window.innerWidth*0.002;
			yoffset = font_size*10;
			limit 	= 18
			if(rotation == limit-1) {
				ctx.fillStyle = "#FFF";
				ctx.fillText(">>",xoffset-2*font_size, yoffset);
				i=0;
				for(var sentence in summary) {
					for(var j=0; j < summary[sentence].length; ++j) {
						var text = summary[sentence][j];
						ctx.fillStyle = "#0F0";
						ctx.fillText(text, j*font_size+xoffset, i*font_size+yoffset);
					}
					i=i+1;
				}
			}

			rotation = rotation +1;
			rotation = rotation % limit;
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

function start_up_coolness() {
	var count =0;
	$("ul").fadeIn('slow', function() {
		$('ul li').each(function(i) {
		   $(this).attr('id', ""+count); // This is your rel value
		   	++count;
		});

		$("#1").css('background-color', 'yellow');
		$("#4").css('background-color', 'green');
	})

}

$(function() {

	start_up_coolness();

	$("#cleanup_btn").on("click", function(e) {
		reset_sugar();
	});

	$("#upload_btn").on("click", function(e) {
		$("#cnvs").slideDown("fast", function() {
			open_upload_modal();
		});
	});

	$("#modal_close").on("click", function(e) {
		close_upload_modal();
	})


	window.addEventListener( 'resize', updateHeight, false );

	updateHeight();

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

	setInterval(function() {rand_draw(cnvs, ctx, font_size, text_decode, drops)}, 30);
	get_search_contents()

});


