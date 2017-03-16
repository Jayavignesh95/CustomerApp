<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Search</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
     
	
	console.log("Hello");
	$("#submit").click(function(e) {
		
		var srchTerm=document.getElementById("search").value;
		console.log(srchTerm);
		console.log("Click working");
		$.ajax({
			url : '/customer/name/'+srchTerm,
			type : 'get',
			data : 'json',
			contentType : 'application/json',
			success : function(maindta) {
				console.log("Working via success window");
				alert(maindta);

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
	<form action="" name="searchForm">

		<input type="text" name="search" id="search" placeholder="Enter the search term">
		<input type="submit" name="submit" id="submit" value="Search Customer">
	</form>
</body>
</html>