<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Applicatio</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
		function validate() {
			var name=document.getElementById("CustomerName").value;
			var emailID=document.getElementById("emailID").value;
			var mobileNo=document.getElementById("mobileNo").value;
			if(name=="" || emailID=="" || mobileNo=="")
				{
				$("#result").html('Sorry ! Please enter the valid details');
				$("#result").addClass("alert alert-danger");
				}
			console.log(mobileNo);
			return true;

		}
		$("#submit").click(function(e) {
             
			
			console.log(validate());
			
			
   			var jsonData = JSON.stringify($('#form').serializeObject());
			console.log(document.getElementById("mobileNo").value);
			console.log("Working Button");
			console.log(jsonData);
			$.ajax({
				url : '/add',
				type : 'POST',
				data : jsonData,
				contentType : 'application/json',
				success : function(maindta) {
					console.log("Working via success window");
					
					$("#result").html('Successfully updated record!');
					$("#result").addClass("alert alert-success");

				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("#result").html('Sorry ! Customer cannot be added into the List');
					$("#result").addClass("alert alert-danger");

				}
			});
			e.preventDefault(); //STOP default action
			$('#form')[0].reset();
			o={};
		});

	});
</script>
</head>
<body>
	<h1 class="title">Customer List</h1>

	<div class="container">
		<form name="form" id="form" class="form-horizontal" role="form">
			<h2>Customer Registration</h2>
			<div class="form-group">
				<label for="CustomerName" class="col-sm-3 control-label">Full
					Name</label>
				<div class="col-sm-9">
					<input type="text" id="CustomerName" name="CustomerName"
						placeholder="Full Name" class="form-control" autofocus> <span
						class="help-block">Enter your First and Last Name</span>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">Email</label>
				<div class="col-sm-9">
					<input type="email" id="emailID" name="emailID" placeholder="Email"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="mobileNo" class="col-sm-3 control-label">Mobile
					Number</label>
				<div class="col-sm-9">
					<input type="text" id="mobileNo" name="mobileNo"
						placeholder="Mobile Number" class="form-control">
				</div>
			</div>



			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<button type="submit" class="btn btn-primary btn-block" id="submit">Register</button>
				</div>
			</div>
		</form>
		<!-- /form -->
	</div>
	<center>
		<div id="result"></div>
	</center>

	<!-- ./container -->
</body>
</html>