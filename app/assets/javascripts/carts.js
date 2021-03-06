$(document).ready(function() {
	$('.plus-cart-button').click(function(event){
		event.preventDefault();
		
		var urlPlus = $(this).attr("href");
		$.ajax({
			url: urlPlus,
			method: "GET",
			dataType: "json",
			success: function(data){
				var length;
				var pos;
				console.log(data);
				var total = 0;
				length = data[0].length;
				for(i=0;i<length;i++){
					if(data[0][i].id === data[1]){
						pos = i;
					}
				}
				$('.count#' + data[1]).html('Quantidade: ' + data[0][pos].quantity);
				$('.' + data[1]).html('Subtotal: R$ ' + (data[0][pos].quantity * data[2]).toFixed(2));
				$('.total').html('Total: R$ ' + (data[3]).toFixed(2));
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
				var length;
				var pos;
				length = data[0].length;
				for(i=0;i<length;i++){
					if(data[0][i].id === data[1]){
						pos = i;
					}
				}
				$('.count#' + data[1]).html('Quantidade: ' + data[0][pos].quantity);
				$('.' + data[1]).html('Subtotal: R$ ' + (data[0][pos].quantity * data[2]).toFixed(2));
				$('.total').html('Total: R$ ' + (data[3]).toFixed(2));
			}
		});
	});	
});

$(document).ready(function(){
	$('.add-cart-button').click(function(event){
		event.preventDefault();
		var urlAdd = $(this).attr("href");
		$.ajax({
			url: urlAdd,
			type: "GET",
			dataType: "JSON",
			success: function(data){
				alert("item colocado no carrinho");
			}
		});
	});	
});
