$(document).on('turbolinks:load', function() {
    $('#btn-admin').on('click', function () {
        // var currentLocation = window.location.href;
        // alert(currentLocation)
        // var nextLocation = currentLocation.replace("","/books/new");
        // alert(nextLocation)
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
    $("#exampleFormControlSelect1").change(function(){
        var selectedCountry = $(this).children("option:selected").val();
        alert("You have selected the country - " + selectedCountry);
         $.ajax({
			url : '/books/get_type',
			method : 'GET',
			data : {
				type : selectedCountry,
			},
			success: function(data) {
				alert(data);
	        }, 
		});
    });

    // function loadWelcom() {
    //     var currentLocation = window.location.href;
    //     if((currentLocation == 'http://localhost:3000/')){
    //         alert("Welcom to Blog App")
    //     }
    // }
    // loadWelcom() ;
});