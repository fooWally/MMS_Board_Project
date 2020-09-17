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
	
		<input>
		<button class="btn btn-default">test3</button>

	</div>

</div>
<script type="text/javascript">
	$(document).ready(function () {
		$("button").click(function () {
			/*input으로 부터 data를 가져오는 예 */
			var val = $("input").val();
			console.log("val", val);
			$.ajax({
				type: 'post',
				url: '/test/test3',
				/* 직접 data 내부입력 예 */
				data:{
					'title':'t1',
					'writer':'w1',
					'content': val
					
				},
				/*  */
				dataType:'text',
				success : function (result) {
					alert(result);
					console.log(val);
					console.log(result);
					/*can use obj in javascript  */
					var obj = JSON.parse(result);
					alert(obj.title);
					alert(obj.writer);
					alert(obj.content);
				}	
			});	
		});
	});




</script>


</body>
</html>