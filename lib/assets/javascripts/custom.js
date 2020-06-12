$(document).on('turbolinks:load', function() {
    function delay() {
        setTimeout(() => {
			/*alert(quantityCheck)*/
            console.log("OK");
            alert("1234");
		}, 2000);
    }
    delay();
});