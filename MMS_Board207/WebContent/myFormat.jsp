<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>my Format</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar { margin-bottom: 0; border-radius: 0; }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {padding-top: 20px; background-color: #f1f1f1; height: 100%;}
    
    /* Set black background color, white text and some padding */
    footer { background-color: #555; color: white; padding: 15px; }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {height: auto; padding: 15px;}
      .row.content {height:auto;} 
    }
  </style>
  
</head>
<body>
<jsp:include page="header.jsp"/>



<c:if test="${login.id=='admin'}">
	<a href ="mlist.do">회원 목록</a>
	<br>
</c:if>
<a href ="mlist.do">회원 목록</a><br>
<a href ="minsertui.do">회원 등록</a><br>
<c:choose>
	<c:when test="${not empty login}">${login.name} 님, 환영합니다. <a href = 'mlogout.do'>로그아웃</a></c:when>
	<c:otherwise>로그인을 하세요.<a href = 'mloginui.do'>로그인</a></c:otherwise>
</c:choose>
	
<c:if test="${not empty login}">
	<a href="m_mypage.jsp">마이페이지</a>
</c:if>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">

        <li>
        	<c:choose>
				<c:when test="${not empty login}">${login.name} 님, 환영합니다. <a href = 'mlogout.do'>로그아웃</a></c:when>
				<c:otherwise>로그인을 하세요.<a href="mloginui.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></c:otherwise>
			</c:choose>
	
			<c:if test="${not empty login}">
				<a href="m_mypage.jsp">마이페이지</a>
			</c:if>
        
        </li>


      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">   
 
  <div class="row content">
  
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    
    
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p>
    	
		<div style="text-algin:center;">
			<form action = "bsearch.do" method="get" style="diaplay:block">
				<select name="target" style="display:inline-block;width:82px;height:30px;">
		  			<option value="0">제목</option>
	  				<option value="1">내용</option>
	  				<option value="2">제목+내용</option>
	  				<option value="3">글쓴이</option>
     	 		</select>
	  			<input style="height:30px;" type="text" size="20" name="condition"/>&nbsp;
	  			<input type="submit" class="btn btn-primary" style="height:33px;" value="검색"/>
			</form>
		</div>
 	</div>
    
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
    
  </div>
  
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>

