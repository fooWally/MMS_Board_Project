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



<c:choose>
		<c:when test="${not empty login}">
			<a href="bgood.do?num=${dto.num}">Good&nbsp;${dto.good}</a>
		</c:when>
		<c:otherwise>
			<a href="mloginui.do" onclick="alert('로그인을 먼저 하세요')">Good&nbsp;${dto.good}</a>
		</c:otherwise>
</c:choose>
<c:choose>
		<c:when test="${not empty login}">
			<a href="bbad.do?num=${dto.num}">Bad&nbsp;${dto.bad}</a>
		</c:when>
		<c:otherwise>
			<a href="mloginui.do" onclick="alert('로그인을 먼저 하세요')">Bad&nbsp;${dto.bad}</a>
		</c:otherwise>
</c:choose>

<jsp:include page="footer.jsp"/>
</body>
</html>