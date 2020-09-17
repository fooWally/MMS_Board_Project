<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="css/codingBooster.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<meta name = "viewport" content="width=device-width initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


<title>List</title>
<style >
.one{
display:inline-block;
with:82px;
height:20px;
margin-left:800px;
}
</style>

</head>
<body>

<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1"aria-expanded="false">
		           <span class="sr-only"></span>
		           <span class="icon-bar"></span>
		           <span class="icon-bar"></span>
		           <span class="icon-bar"></span>
		       </button>
		       <a class="navbar-brand" href="main.jsp">메인화면</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			 <ul class="nav navbar-nav">
			 <li ><a href="#">소개<span class="sr-only"></span></a></li>
			 <li><a href="#">강사진</a></li>
			 <li class="dropdown">
			 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			  aria-haspopup="true" aria-expanded="false">강의<span class="caret"></span></a>
			  <ul class="dropdown-menu">
			  <li><a href="#">java</a></li>
			  <li><a href="#">css</a></li>
			  <li><a href="#">mvc2</a></li>
			  </ul>
			 </li>
			 </ul>
			 
			 <ul class="nav navbar-nav navbar-right">
			 <li class="dropdown">
			 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			  aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
			  <ul class="dropdown-menu">
			  <li><a href="#">로그인</a></li>
			  <li><a href="#">회원가입</a></li>
			  </ul>
			 </li>
			 </ul>
			</div>
		</div>
</nav>

<div class="container">
<div class="row">
	<table class="table table-striped" style="text-align:center; border:1px solid powderblue">
		<thead>
			<tr>
				<th style="background-color:powderblue; text-align:center; color:black;">번호</th>
  				<th style="background-color:powderblue; text-align:center; color:black;">제목</th>
   				<th style="background-color:powderblue; text-align:center;color:black; ">작성자</th>
    			<th style="background-color:powderblue; text-align:center;color:black; ">작성일</th>
     			<th style="background-color:powderblue; text-align:center;color:black; ">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
				<td>${dto.num }</td>
				<td>
				<c:forEach begin="1" end="${dto.repIndent}">&nbsp; </c:forEach>
					<a href="bread.do?num=${dto.num}">${dto.title}</a>
				</td>
				<td>${dto.author }</td>
				<td>${dto.writeday }</td>
				<td>${dto.readcnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="text-align:center;">
	<jsp:include page="b_page_search.jsp"/>
	</div>
	<a href="binsertui.do" class="btn btn-primary pull-right" style="width:7%; margin-left:5px;">글쓰기</a>
</div>
</div>
             
<div style="text-algin:left;">
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
</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>