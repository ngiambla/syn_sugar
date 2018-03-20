/*
 * graphing.js
 * -- Written By Nick
 */

// global variables.

// ~ all data
var all_data;

// graphing variables
var width 				= 960;
var height 				= 500;
var padding 			= 1.5; 	// separation between same-color nodes
var clusterPadding 		= 6; 	// separation between different-color nodes
var maxRadius 			= 12;
var color;
var clusters;
var nodes;
var force;
var svg;
var node;

var n=0; // total number of nodes
var m; // number of distinct clusters


function plot_sim() {

	var sen_pairs = all_data[4];
	var truncate = false;
	
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

	var index 		= 0;
	var nodes_per_cluster = 0;
	for(var key in sen_pairs) {
		if(sen_pairs.hasOwnProperty(key)) {
			index++;
			for(var key2 in sen_pairs[key]) {
				nodes_per_cluster++;
				r = Math.min(maxRadius, 10*sen_pairs[key][key2])
				d={cluster: index, radius: r}
				nodes.push(d);
				if (!clusters[index] || (r > clusters[index].radius)) {
					clusters[index] = d;
				}
				if(nodes_per_cluster > 20) {
					break;
				}
			}
		}
		if(index == 20 && truncate) {
			break;
		}
	}

	if(nodes !== null && typeof nodes === 'object') {
		console.log(nodes);
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

	$("#all_data").bind("change", function() {
		console.log($(this).val()); 
		all_data = JSON.parse($(this).val());
		console.log(all_data);
		$("#similarity_graph_p").fadeIn('fast', function(e) {
			plot_sim();
		});
	});

});