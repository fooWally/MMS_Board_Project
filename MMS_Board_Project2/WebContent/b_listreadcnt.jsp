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
<jsp:include page="header.jsp"/>

	<a href="binsertui.do">글쓰기</a>
	<h1>게시판</h1>
	<a href="bsearch.do">검색</a> 
	<a href="blist.do">글 목록</a>

<table border="1">
		<thead>
			<tr>
				<th>num</th>
				<th>title</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<!--repindent등삭제  -->
				<th>good</th>
				<th>bad</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.num}</td>
					<td>
					
					<c:forEach begin="1" end="${dto.repIndent}">
						&nbsp;&nbsp;
					</c:forEach>
					
					<a href="bread.do?num=${dto.num}">${dto.title}</a>
					
					</td>
					<td>${dto.author}</td>
					<td>${dto.writeday}</td>
					<td>${dto.readcnt}</td>
					<td>${dto.good}</td><!--추천수  -->
					<td>${dto.bad}</td><!--비추수  -->
				</tr>
			
			</c:forEach>
		</tbody>
	
	
	</table>
		<br>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>