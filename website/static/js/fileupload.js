/*
filedrag.js - Asynchronous File Upload
Developed by: Nicholas Giamblanco
*/

function upload_file() {

	var form_data = new FormData($('#upload-file-form')[0]);
	console.log(form_data)
	$.ajax({
	    type: "POST",
	    url: "/uploads",
	    data: form_data,
        contentType: false,
        cache: false,
        processData: false,
        async: false,
	    success: function(ret) {

	    },
	    error: function(request, status, err) {
	        console.log(status);
	        console.log(err);
	    }
	});
}