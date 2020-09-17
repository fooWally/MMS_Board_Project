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

<jsp:include page="header.jsp"/>

<h1>회원 수정</h1>
<form action="mupdate.do" method="post">

	<label for = "id">수정할 ID:</label>
	<input name="id" id="id" value="${dto.id}" readonly>
	<br>
	<label for="name">NAME: </label>
	<input name="name" id="name" value="${dto.name}">	
	<label for="birth">BIRTH: </label>
	<input name="birth" id="birth" type="date" value="${dto.birth}">
	<br>
	<label for="email">E-mail: </label>
	<input name="email" id="email" value="${dto.email}">
	<br>
	<label for="pw">PW: </label>
	<input name="pw" id="pw" type="password">
	<br>
	<input type="submit" value="수정">
	
</form>

<jsp:include page="footer.jsp"/>

</body>
</html>