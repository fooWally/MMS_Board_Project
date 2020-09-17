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
		<h1 class="jumbotron">글쓰기</h1>
		
		<form  method="post">
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" name="title" id="title">
			</div>
			<div class="form-group">
				<label for="writer">작성자</label>
				<input class="form-control" name="writer" id="writer">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea rows="5" class="form-control" name="content" id="content"></textarea>
			</div>
		</form>
		
		<div class="form-group">
			<button class="btn btn-primary" type="submit">등록</button>
			<button class="btn btn-warning" type="reset">초기화</button>
		</div>
		
	</div>
	
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("button[type='submit']").click(function(){
			$("form").submit();
		});
		
		//clicking on reset button gets you back to /board/list
		$("button[type='reset']").click(function(){
			location.href="/board/list";
		});
		
		
	});
</script>

</body>
</html>