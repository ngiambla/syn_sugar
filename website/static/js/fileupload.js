/*
filedrag.js - Asynchronous File Upload
Developed by: Nicholas Giamblanco
*/

function upload_file() {

	var form_data = new FormData($('#upload-file-form')[0]);
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
	    },
	    error: function(request, status, err) {
	        console.log(status);
	        console.log(err);
	    }
	});
}