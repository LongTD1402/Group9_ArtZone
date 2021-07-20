var Cart = {
	addItemToCart: function(productId) {
	var data = {
			"productId": productId,
			//"quanlity": $("#" + quantityElementId).val()
		};
		$.ajax({
			url: "/cart_add",
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(data),

			dataType: "json",
			success: function(jsonResult) {
				$("#totalItemsInCart").html(jsonResult.totalItems);
				alert('Check your cart!');
			}
		});
	},
}