/* Generating a Visualization */




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

//drawing the characters
function draw(cnvs, ctx, font_size, text_decode, drops) {

	//Black BG for the canvas
	//translucent BG to show trail
	ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
	ctx.fillRect(0, 0, cnvs.width, cnvs.height);
	
	ctx.fillStyle = "#AFF"; //green text
	ctx.font = font_size + "px monospace";

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
}

$(function() {
	var cnvs = document.getElementById("cnvs");
	var ctx = cnvs.getContext("2d");

	//making the canvas full screen
	cnvs.height = 400;
	cnvs.width = window.innerWidth;

	var text_decode = "abcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()~_-+,.:";
	//converting the string into an array of single characters
	text_decode = text_decode.split("");


	var font_size = 10;
	var columns = cnvs.width/font_size;

	//an array of drops - one per column
	var drops = [];

	//x below is the x coordinate
	//1 = y co-ordinate of the drop(same for every drop initially)
	for(var x = 0; x < columns; x++) {
		drops[x] = (Math.random()*1000)%columns; 
	}

	setInterval(function() {draw(cnvs, ctx, font_size, text_decode, drops)}, 33);
});


