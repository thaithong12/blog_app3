$(document).on('turbolinks:load', function() {
    $('#btn-admin').on('click', function () {
        // var currentLocation = window.location.href;
        // alert(currentLocation)
        // var nextLocation = currentLocation.replace("","/books/new");
        // alert(nextLocation)
        nextLocation= "http://localhost:3000/books/new"
        window.location = nextLocation;
        alert("Oke")
        // $.ajax({
		// 	url : "/books/get_one",
		// 	method : "GET",
		// 	data : {
		// 		user_id : 1,
		// 	},
		// 	success: function(data) {
		// 		alert(data);
	    //     }, 
		// });
    })
    $('#datetimepicker').datepicker({
        todayHighlight: true,
        format: 'dd/mm/yyyy',
        startDate: new Date()   
    });
});