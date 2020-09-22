<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>답글 달기</h1>
	<form action="breply.do" method="post">
		<input name="num" value="${num}" type="hidden"> <!-- 데이터는 넘어오지만 보이지는 않음(type="hidden") -->
		작성자: <input name="author" id="author" value="${login.id}" readonly><br>
		제목: <input name="title" required><br>
		content<br>
		<textarea rows="5" name="content" required></textarea>
		<br>
		<input type="submit" value="답글 등록">
	</form>
</body>
</html>