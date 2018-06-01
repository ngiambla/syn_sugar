/*
 * graphing.js
 * -- Written By Nick
 */

// global variables.

// ~ all data
var all_data;

// graphing variables
var width 				= 700;
var height 				= 450;
var padding 			= 1.5; 	// separation between same-color nodes
var clusterPadding 		= 6; 	// separation between different-color nodes
var maxRadius 			= 55;
var color;
var clusters;
var nodes;
var force;
var svg;
var node;

var n=0; // total number of nodes
var m; // number of distinct clusters


function show_sim_modal(sim_data) {

	$("#sim_content").empty();
	var sentence = all_data[1][sim_data]
	var content  = "<p>"+sentence+"</p>"
	$("#sim_content").append(content);

	
	$("#sim_modal").fadeIn('slow', function(e){
		$("#sim_content").fadeIn('fast', function(e){

		});
	});
}

function close_sim_modal() {
	$("#sim_modal").fadeOut('slow', function(e){
	});
}


function plot_sim() {

	var doc = all_data[1];
	var entropy_map = all_data[3];
	var sen_pairs = all_data[4];
	var truncate = false;

	var items = Object.keys(sen_pairs).map(function(key) {
	    return [key, sen_pairs[key]];
	});

	// Sort the array based on the second element
	items.sort(function(first, second) {
	    return second[1] - first[1];
	});	
		
	m=Object.keys(sen_pairs).length

	if(m > 20) {
		color = d3.scale.category20()
		    .domain(d3.range(20));
		    truncate = true;
		    m = 20;
	} else {
		color = d3.scale.category20()
		    .domain(d3.range(m));
	}

	nodes 		= [];
	clusters 	= new Array(m);

	var index 				= 0;
	var nodes_per_cluster 	= 0;
	var sorted_keys 		= {}
	var is_init				= true;
	var g_max 				= items[0][1];

	for(var i = 0; i < m; ++i ) {
		sorted_keys[items[i][0]] = items[i][1];
	}	

	console.log(g_max);
	console.log(sorted_keys);

	for(var key in sorted_keys) {
		if(sorted_keys.hasOwnProperty(key)) {
			r= (maxRadius * sorted_keys[key])/(g_max);
			d={cluster: index, radius: r, key: key}
			nodes.push(d);
			clusters[index] = d;
			index++;
		}
	}

	// Use the pack layout to initialize node positions.

	d3.layout.pack()
	    .sort(null)
	    .size([width, height])
	    .children(function(d) { return d.values; })
	    .value(function(d) { return d.radius * d.radius; })
	    .nodes({values: d3.nest()
	      .key(function(d) { return d.cluster; })
	      .entries(nodes)});

	force = d3.layout.force()
	    .nodes(nodes)
	    .size([width, height])
	    .gravity(.03)
	    .charge(0)
	    .on("tick", tick)
	    .start();

	svg = d3.select("#structure_sim")
	    .attr("width", width)
	    .attr("height", height);
	node = svg.selectAll("circle")
	    .data(nodes)
	    .enter().append("circle")
	   	.style("cursor", "pointer")
        .on("click", function(d){
			var sentence_limit = 3;
			var _s = "";
			var similar_sentences = d.key;
			show_sim_modal(similar_sentences);
        })
		.on("mouseenter", function(d){


				tooltip
				.style("left", d3.event.pageX + 15 + "px")
				.style("top", d3.event.pageY + 15 + "px")
				.style("display", "inline-block")
				.html("Cluster: "+d.index+", Similarity: "+ sorted_keys[d.key]/g_max+"%");				
			
		})
		.on("mouseleave", function(d){ tooltip.style("display", "none");})	    
	    .style("fill", function(d) { return color(d.cluster); })
	    .call(force.drag);

	node.transition()
	    .duration(375)
	    .delay(function(d, i) { return i * 5; })
	    .attrTween("r", function(d) {
	      var i = d3.interpolate(0, d.radius);
	      return function(t) { return d.radius = i(t); };
	    });
	}

function tick(e) {
  node
      .each(cluster(10 * e.alpha * e.alpha))
      .each(collide(.5))
      .attr("cx", function(d) { return d.x; })
      .attr("cy", function(d) { return d.y; });
}

// Move d to be adjacent to the cluster node.
function cluster(alpha) {
  return function(d) {
    var cluster = clusters[d.cluster];
    if (cluster === d) return;
    var x = d.x - cluster.x,
        y = d.y - cluster.y,
        l = Math.sqrt(x * x + y * y),
        r = d.radius + cluster.radius;
    if (l != r) {
      l = (l - r) / l * alpha;
      d.x -= x *= l;
      d.y -= y *= l;
      cluster.x += x;
      cluster.y += y;
    }
  };
}

// Resolves collisions between d and all other circles.
function collide(alpha) {
  var quadtree = d3.geom.quadtree(nodes);
  return function(d) {
    var r = d.radius + maxRadius + Math.max(padding, clusterPadding),
        nx1 = d.x - r,
        nx2 = d.x + r,
        ny1 = d.y - r,
        ny2 = d.y + r;
    quadtree.visit(function(quad, x1, y1, x2, y2) {
      if (quad.point && (quad.point !== d)) {
        var x = d.x - quad.point.x,
            y = d.y - quad.point.y,
            l = Math.sqrt(x * x + y * y),
            r = d.radius + quad.point.radius + (d.cluster === quad.point.cluster ? padding : clusterPadding);
        if (l < r) {
          l = (l - r) / l * alpha;
          d.x -= x *= l;
          d.y -= y *= l;
          quad.point.x += x;
          quad.point.y += y;
        }
      }
      return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
    });
  };
}

$(function() {

	tippy(document.querySelector('#sim_prop_i'), {
		size: 'large',
		animation: 'scale',
        arrow: true
	});
	tippy(document.querySelector('#sim_sim_i'), {
		size: 'large',
		animation: 'scale',
        arrow: true
   	});


	$("#all_data").bind("change", function() {
		all_data = JSON.parse($(this).val());
		plot_sim();
	});

});