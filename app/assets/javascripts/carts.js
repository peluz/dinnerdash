$(.add-cart-button).click(function(){
	var urlAdd = $(this).attr("href");
	$.ajax({
		url: urlAdd,
		type: "GET",
		dataType: "JSON",
		success: function(data){
			console.log(data);
		}
	});
});
$(.minus-cart-button).click(function(){
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
