<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

<h1>로그인</h1>
<form action="mlogin.do" method="post">

	<label for="id" >ID: </label> 
	<input name="id" id="id" required>
	<br>
	<label for="pw">PW: </label>
	<input name="pw" id="pw" type="password" required>
	<br>
	<input type="submit" value="로그인">
	
</form>

<h1>ID 및 비번 찾기</h1>
<form action="msearchid.do" method="post">
		이름: <input name="name" required><br>
		email: <input name="email" required><br>
		생년월일: <input name="birth" required type="date"><br>
	<input type="submit" value="찾기">
</form>

</body>
</html>