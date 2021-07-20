<div class="col-auto">
	<label class="sr-only" for="subscribeEmail">Email address</label>
	<div class="input-group mb-2">
		<input type="text" class="form-control bg-dark border-light"
			id="subscribeEmail" placeholder="Email address">
		<button class="input-group-text btn-success text-light"
			onclick="SaveContact();">Subscribe</button>
		<script type="text/javascript">
			function SaveContact() {
				// javascript object.
				var data = {};
				data["email"] = $("#subscribeEmail").val();
				alert(JSON.stringify(data));

				// $ === jQuery
				jQuery.ajax({
					url : "/subcrible_Ajax",
					type : "post",
					contentType : "application/json",
					data : JSON.stringify(data),
					dataType : "json",
					success : function(jsonResult) {
						if (jsonResult.code == 200) {
							alert(jsonResult.status)
						} else {
							alert(jsonResult.data);
						}
					},
					error : function(jqXhr, textStatus, errorMessage) { // error callback 
					}
				});
			}
		</script>
	</div>

</div>