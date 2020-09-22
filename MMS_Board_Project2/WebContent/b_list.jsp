<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>index page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>
	<c:choose>
		<c:when test="${not empty login}">
			<a href="binsertui.do">글쓰기</a>
		</c:when>
		<c:otherwise>
			<a href="mloginui.do" onclick="alert('로그인을 먼저 하세요')">글쓰기</a>
		</c:otherwise>
	</c:choose>
	<h1>게시판</h1>
	
	<a href="blistreadcnt.do">조회수 높은 글 보기</a>
	
	<table border="1">
		<thead>
			<tr>
				<th>num</th>
				<th>title</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>싫어요</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.num}</td>
					<td>
					<!-- 들여쓰기 -->
					<c:forEach begin="1" end="${dto.repIndent}"> <!-- 원래 글은 들여쓰기가 안되게 1부터 시작 -->
						&nbsp;&nbsp;
					</c:forEach>
					<a href="bread.do?num=${dto.num}">${dto.title}</a></td>
					<td>${dto.author}</td>
					<td>${dto.writeday}</td>
					<td>${dto.readcnt}</td>
					<td>${dto.good}</td>
					<td>${dto.bad}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%-- 페이징 --%>
	<%-- html주석(<!-- -->) 쓰지 말고 이 주석 쓰기!!!!!!!!! --%>
	<%-- 파람액션태그가 있을 때는  [[[ <jsp:include page=""></jsp:include> 없을때는 <jsp:include page=""/> ]]]  --%> 

<jsp:include page="b_page.jsp"/>

<form action = "bsearch.do" method="get" style="diaplay:block ">
<select class="one" name="target" style="display:inline-block;with:82px;height:30px;margin-left:800px;">
						<option value="0">제목</option>
						<option value="1">내용</option>
						<option value="2">제목+내용</option>
			  			<option value="3">글쓴이</option>
				  	</select>
<input style="height:30px;" type="text" size="20" name="condition"/>&nbsp;
<input type="submit" class="btn btn-primary" style="height:33px;" value="검색"/>
</form>

<jsp:include page="footer.jsp"/>
</body>
</html>