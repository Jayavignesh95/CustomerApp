<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Details</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
	var o = {};
	$(document).ready(function() {

		$.fn.serializeObject = function() {

			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
			console.log(o);
		};
		$("#submit").click(function(e) {

			var jsonData = JSON.stringify($('form').serializeObject());

			console.log("Working Button");
			console.log(jsonData);
			$.ajax({
				url : '/add',
				type : 'POST',
				data : jsonData,
				contentType : 'application/json',
				success : function(maindta) {
					console.log("Working via success window");
					alert("Customer Added Successfully");

				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("failed with error ");
				}
			});
			e.preventDefault(); //STOP default action

		});

	});
</script>
</head>
<body>
	<h1>Add customer</h1>
	<div id="form1" style="padding-left: 30%; padding-top: 30px;">
		<form id="form">
			<label for="name">Name :</label> <input type="text"
				name="CustomerName"> <br> <label for="email">Email
				:</label> <input type="email" name="emailID"> <br> <label
				for="text">Mobile Number</label> <input type="text" name="mobileNo">
			<br> <input type="submit" value="ADD" id="submit">
		</form>
	</div>
</body>
</html>