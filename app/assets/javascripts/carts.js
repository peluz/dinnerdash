$(document).ready(function() {
	$('.add-cart-button').click(function(event){
		event.preventDefault();
		
		var urlAdd = $(this).attr("href");
		$.ajax({
			url: urlAdd,
			method: "GET",
			dataType: "json",
			success: function(data){
				$('#quant').html(data);
			}
		});
	});
});
$(document).ready(function(){
	$('.minus-cart-button').click(function(event){
		event.preventDefault();
		var urlMinus = $(this).attr("href");
		$.ajax({
			url: urlMinus,
			type: "GET",
			dataType: "JSON",
			success: function(data){
				console.log(data);
			}
		});
	});	
});
