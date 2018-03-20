
/*
 * index.js - Nicholas V. Giamblanco.
 * performs tasks required for the index of this website. 
 */

/* Global vars */
var cnvs;
var ctx;
var list;
var type;

/* Global Graphing Vars */
var margin;
var marginOverview;
var selectorHeight;
var width;
var height;
var heightOverview; 
var maxLength;
var barWidth;
var numBars;
var xscale;
var yscale;
var xAxis;
var yAxis;
var svg;
var diagram;
var bars;
var xOverview;
var subBars;
var displayed;
var tooltip;

/* Syn Suagr's Vars */
var text_decode 		= "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()~_-+,.:".split("");
var search_query 		= "";
var summary 			= {};
var summ_text 			= [];
var doc  				= {};

var sentence_len_map 	= {};
var entropy_map 		= {};

var sen_pairs 			= {};
var fields 				= {};
var sorted_bins 		= {};

var font_size 			= 45;
var columns;

//an array of drops - one per column
var drops 				= [];

// states: 0 = rand, 1 = query, 2 = results, 3 = loading (may not even occur.)
var draw_state 			= 0;
var rotation 			= 29;
var which_line 			= 0;


function hide_term() {
	$("#cnvs").slideUp("fast", function() {
		$("#hide_term").fadeOut('fast', function() {
			$("#show_term").fadeIn('fast', function() {			

			});
		});
	});
}

function go_to_in_doc(okay) {

	$(".doc_line").each(function() {
		if(this.id in summary) {
			$(this).css("background-color","#34BC6F"); 
		} else {
			$(this).css("background-color","#FFF");
		}
	});

	if(okay in summary) {
		$("#"+okay).css("background-color", "#87CEFA"); 
	} else {
		$("#"+okay).css("background-color", "#FFA07A"); 		
	}

	document.getElementById(okay).scrollIntoView({
		 behavior: "smooth",
		 block: "center", 
		 inline: "nearest"
	});
}

function show_term() {
	$("#cnvs").slideDown("fast", function() {
		$("#show_term").fadeOut('fast', function() {
			$("#hide_term").fadeIn('fast', function() {

			});
		});	
	});
}

function save_summary() {
	var text = "";
	for(var i=0; i< summ_text.length; ++i) {
		text=text+summ_text[i]+"\n";
	}

	var blob = new Blob([summ_text], {type: "text/plain;charset=utf-8"});
	//saveAs(blob, "filename.txt");
    var anchor = document.getElementById("file_download_ref");
    $("#file_download_ref").click(function() {
    	console.log("Save File?");
    });
	anchor.download = $("#doc_title").text()+"_summary.txt";
	anchor.href = (window.URL).createObjectURL(blob);
	anchor.dataset.downloadurl = ['text/plain', anchor.download, anchor.href].join(':');
	anchor.click();
}


function open_upload_modal() {
	$("#file_modal").fadeIn('slow', function() {
	});
}

function close_upload_modal() {
	$("#file_modal").fadeOut('fast', function() {
	});
}


function updateHeight() {
	
}

function load_doc(doc, summary) {
	var is_empty= true;
	
	summ_text = [];

	$("ul").fadeOut('fast', function(e) {
		$("#entropy_graph").empty();
		$("ul").empty();
		$("#summ_contents").empty();
		
		$("ul").fadeIn('fast', function(e) {
			for(var i in doc) {
				item = '<li class="doc_line" id="'+ i +'">'+doc[i]+'</li>'
				$("ul").append(item);
				if(i in summary) {
					summ_text.push(doc[i]);
					is_empty=false;
					s_item = '<p class="summ_line" id="s_'+ i +'" onclick="go_to_in_doc('+i+')">'+doc[i]+'</p>'
					$("#summ_contents").append(s_item)
					$("#"+i).css('background-color', '#34bc6f');
					$("#"+i).css('color', 'white');

				}
			}
			if(!is_empty) {
				$("#summary_display").fadeIn('fast', function() {
				});
			}

			if(Object.keys(entropy_map).length > 0) {
				console.log("~ entropy found.");
				$("#entropy_graph_p").fadeIn('fast', function(e) {
					load_bar_chart();
				});
			} else {
				console.log(entropy_map);
			}
		});
	});
}


function upload_file() {

	var filename = $("#upload-file").val();
	filename = (filename.split("C:\\fakepath\\"))[1];
	var form_data = new FormData($('#upload-file-form')[0]);
	var file_ext = filename.substring(filename.length-3, filename.length);
	
	if(file_ext != "pdf" && file_ext != "txt") {
		return;
	}

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
	    	if(ret) {
	    		if(ret["res"]) {
			    	console.log(ret["res"]);
			    	$("#doc_title").text(filename);
			    	$("#all_data").val(JSON.stringify(ret['res'])).change();
			    	summary 			= ret["res"][0];
			    	doc 				= ret["res"][1];
			    	sentence_len_map 	= ret["res"][2];
			    	entropy_map			= ret["res"][3];
			    	sen_pairs 			= ret["res"][4];
			    	fields 				= ret["res"][5];
			    	sorted_bins 		= ret["res"][6];

			    	load_doc(doc, summary);
			    	draw_state 			= 2;
	    		} else {
	    			draw_state = 0;	
	    		}
	    	} else {
	    		draw_state = 0;
	    	}
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
	draw_state 			= 0;
	summary 			= {};
	entropy_map 		= {}
	summary["empty"] 	= "No Document Uploaded!";
	doc 				= {};
	$("#summary_display").fadeOut('fast', function() {
			$("#doc_title").text("");
			$("#entropy_graph_p").fadeOut('fast', function(e) {
			});
	});
	start_up_coolness();
	hide_term();
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

		show_term();
		if("empty" in summary) {
			draw_state = 2;
		} else {
			if($("#search").val() || $("#search").val() != search_query) {
				if(draw_state == 0 || draw_state == 2) {
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
	var coolness= 'What is Syntactic Sugar?'+
				'-Basically you should just upload your document.'+
	 			'-We want to give you unprecedented access to information'+
	 			'-We want you to see what is most important in this.'+
	 			'-Give it a shot.'+
	 			'-Please.'+
	 			'-...'+
	 			'-..'+
	 			'-.'+
	 			'-Just do it.'+
	 			'-I know you want to'+
	 			'-Also, feel free to form me.'+
	 			'-...(only when this assignment is done of course.)'+
	 			'-(what the hell are licenses?)'+
	 			'-Signed By Yours Truly,'+
	 			'-giambla2'+
	 			'-PS: I love Com Truise?';
	 	var sentences = coolness.split("-");
	 	var pickle={}
	 	for(var i = 0; i < sentences.length; ++i) {
	 		pickle[i]=sentences[i];
	 	}
	 	load_doc(pickle, {});

}


function load_bar_chart() {

	var wid = document.getElementById("entropy_graph").parentElement.clientWidth;
	
	var _data 	= entropy_map;
	var data	= [];

	var i =0;
	for(var key in _data) {
	    if(_data.hasOwnProperty(key)) {
	    	data.push({"xval":key , "yval":_data[key]})
	    	i++;
	    }
	}
	margin =  {top: 20, right: 45, bottom: 20, left: 45};
	marginOverview = {top: 30, right: 10, bottom: 20, left: 40};
	selectorHeight = 50;
	width = wid - margin.left - margin.right;
	height = 350 - margin.top - margin.bottom - selectorHeight;
	heightOverview = 90 - marginOverview.top - marginOverview.bottom;
	       
	maxLength = 4+ d3.max(data, function (d) { return (""+d.xval).length; });
	barWidth = maxLength * 7;
	numBars = Math.round(width/barWidth);
	isScrollDisplayed = barWidth * data.length > width;
       
	tooltip = d3.select("body").append("div").attr("class", "tooltip");

	xscale = d3.scale.ordinal()
	                .domain(data.slice(0,numBars).map(function (d) { return d.xval; }))
	                .rangeBands([0, width], .2);

	yscale = d3.scale.linear()
								.domain([0, d3.max(data, function (d) { return d.yval; })])
	              .range([height, 0]);
	  
	xAxis  = d3.svg.axis().scale(xscale).orient("bottom");
	yAxis  = d3.svg.axis().scale(yscale).orient("left");
	  
	svg = d3.select("#entropy_graph")
				.attr("width", width + margin.left + margin.right)
	        	.attr("height", height + margin.top + margin.bottom + selectorHeight);
	  
	diagram = svg.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	  
	diagram.append("g")
	  		 	.attr("class", "x axis")
	       		.attr("transform", "translate(0, " + height + ")")
	       		.call(xAxis);
	  
	diagram.append("g")
	       .attr("class", "y axis")
	       .call(yAxis);
	  
	bars = diagram.append("g");
	  
	bars.selectAll("rect")
	            .data(data.slice(0, numBars), function (d) {return d.xval; })
	            .enter().append("rect")
	            .attr("class", "bar")
	            .attr("x", function (d) { return xscale(d.xval); })
	            .attr("y", function (d) { return yscale(d.yval); })
	            .attr("width", xscale.rangeBand())
	            .style("cursor", "pointer")
	            .style("fill", function(d) {
	            	if(d.xval in summary) {
	            		return "#34BC6F";
	            	}
	            })
	            .on("click", function(d){
					go_to_in_doc(d.xval);
	            })
				.on("mouseenter", function(d){
					tooltip
					.style("left", d3.event.pageX - 50 + "px")
					.style("top", d3.event.pageY - 70 + "px")
					.style("display", "inline-block")
					.html("Sentence: "+ (d.xval) + ", Entropy: " + (d.yval));
				})
    			.on("mouseleave", function(d){ tooltip.style("display", "none");})
	            .attr("height", function (d) { return height - yscale(d.yval); });

	  
	if (isScrollDisplayed)
	{
	  xOverview = d3.scale.ordinal()
	                  .domain(data.map(function (d) { return d.xval; }))
	                  .rangeBands([0, width], .2);
	  yOverview = d3.scale.linear().range([heightOverview, 0]);
	  yOverview.domain(yscale.domain());

	  subBars = diagram.selectAll('.subBar')
	      .data(data)

	  subBars.enter().append("rect")
	      .classed('subBar', true)
	      .attr({
	          height: function(d) {
	              return heightOverview - yOverview(d.yval);
	          },
	          width: function(d) {
	              return xOverview.rangeBand()
	          },
	          x: function(d) {
	              return xOverview(d.xval);
	          },
	          y: function(d) {
	              return height + heightOverview + yOverview(d.yval)
	          }
	      })

	  displayed = d3.scale.quantize()
	              .domain([0, width])
	              .range(d3.range(data.length));

	  diagram.append("rect")
				.attr("transform", "translate(0, " + (height + margin.bottom) + ")")
				.attr("class", "mover")
				.attr("x", 0)
				.attr("y", 0)
				.attr("height", selectorHeight)
				.attr("width", Math.round(parseFloat(numBars * width)/data.length))
				.attr("pointer-events", "all")
				.attr("cursor", "ew-resize")
	            .call(d3.behavior.drag().on("drag", display));
	}
} 

function display () {
	
	var _data 	= entropy_map;
	var data	= [];

	var i =0;
	for(var key in _data) {
	    if(_data.hasOwnProperty(key)) {
	    	data.push({"xval":key , "yval":_data[key]})
	    	i++;
	    }
	}

    var x = parseInt(d3.select(this).attr("x")),
        nx = x + d3.event.dx,
        w = parseInt(d3.select(this).attr("width")),
        f, nf, new_data, rects;

    if ( nx < 0 || nx + w > width ) return;

    d3.select(this).attr("x", nx);

    f = displayed(x);
    nf = displayed(nx);

    if ( f === nf ) return;

    new_data = data.slice(nf, nf + numBars);
    xscale.domain(new_data.map(function (d) { return d.xval; }));
    diagram.select(".x.axis").call(xAxis);

    rects = bars.selectAll("rect")
	    .data(new_data, function (d) {return d.xval; });


	 	rects.attr("x", function (d) { return xscale(d.xval); });

    rects.enter().append("rect")
		.attr("class", "bar")
		.attr("x", function (d) { return xscale(d.xval); })
		.attr("y", function (d) { return yscale(d.yval); })
		.style("cursor", "pointer")
		.style("fill", function(d) {
			if(d.xval in summary) {
				return "#34BC6F";
			}
		})
		.on("click", function(d){
			go_to_in_doc(d.xval);
		})
		.on("mouseenter", function(d){
			tooltip
				.style("left", d3.event.pageX - 50 + "px")
				.style("top", d3.event.pageY - 70 + "px")
				.style("display", "inline-block")
				.html("Sentence: "+ (d.xval) + ", Entropy: " + (d.yval));
		})
		.on("mouseleave", function(d){ tooltip.style("display", "none");})
		.attr("width", xscale.rangeBand())
		.attr("height", function (d) { return height - yscale(d.yval); });

    rects.exit().remove();
}


$(function() {

	start_up_coolness();
	$("#cleanup_btn").on("click", function(e) {
		reset_sugar();
	});

	$("#upload_btn").on("click", function(e) {
		show_term();
		open_upload_modal();
	});

	$("#modal_close").on("click", function(e) {
		close_upload_modal();
	});

	$("#hide_term").on("click", function(e) {
		hide_term();
	});

	$("#show_term").on("click", function(e) {
		show_term();
	})

	summary["empty"] = "No Document Uploaded!";

	window.addEventListener( 'resize', updateHeight, false );

	updateHeight();

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

	setInterval(function() {rand_draw(cnvs, ctx, font_size, text_decode, drops)}, 30);
	get_search_contents()

});


