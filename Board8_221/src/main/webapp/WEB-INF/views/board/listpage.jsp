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
		<table class="table">
			<thead>
				<tr>
					<th>bno</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<!--PageTO : paging list  -->
				<c:forEach items="${to.list}" var="vo">
					<tr>
						<td>${vo.bno }</td>
						<!-- clicking on title exports bno and curPage: displays read/20?curPage=1 in URL  -->
						<td><a href="/board/read/${vo.bno}?curPage=${to.curPage}">${vo.title}</a></td>
						<td>${vo.writer }</td>
						<td>${vo.updatedate }</td>
						<td>${vo.readcnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!--class=row  -->
	
	<div class="row">
		<div class="text-center">
			<!--bootstrap support paging: create a series of numbers for paging  -->
			<ul class="pagination">
				<c:forEach var="var" begin="${to.beginPageNum}" end="${to.stopPageNum}">
					<!-- to가 가진 현재페이지가 var일때  this class is active: page num button turns blue 
						clicking on a page number gets you to curPage=${var} -->
					<li class="${to.curPage==var?'active':''}"><a href="/board/listpage?curPage=${var}"> ${var}</a></li>
				</c:forEach>
			</ul>		
		</div>	
	
	
	</div>
	
	
	<div class="row"> 
		<a href="/board/insert">글쓰기</a>
	</div><!--class=row  -->
</div><!--class =container  -->

</body>
</html>