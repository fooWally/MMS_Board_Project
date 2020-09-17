<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<!--take one line and round corner:  -->
		<input class="form-control">
		<button class="btn btn-primary">rest1</button>

	</div>

</div>
<!-- demo for rest controller   -->
<script type="text/javascript">

	$(document).ready(function () {
		$("button").click(function () {
			/*click to take data from input tag  */
			var val = $("input").val();
			
			$.ajax({
				type: 'post',
				url: '/rest1',
				headers: {
					'Content-Type':'application/json',
					'X-HTTP-Metho-Override':'POST'
				},
				data: JSON.stringify({
					/*key: val in json*/
					test1: val
				}),
				dataType:'text',
				success: function (result) {
					console.log(result);
				}
			});
		});
	});



</script>

</body>
</html>