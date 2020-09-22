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
<h1>글 자세히 보기</h1>
num: ${dto.num}<br>
제목: ${dto.title}<br>
작성자: ${dto.author}<br>
작성일: ${dto.writeday}<br>
조회수: ${dto.readcnt}<br>
본문<br>
<div>
	${dto.content}
</div>
<br>

	<c:choose>
		<c:when test="${not empty login}">
			<a href="breplyui.do?num=${dto.num}">답글</a>
		</c:when>
		<c:otherwise>
			<a href="mloginui.do" onclick="alert('로그인을 먼저 하세요')">답글</a>
		</c:otherwise>
	</c:choose>
	
		<c:choose>
		<c:when test="${login.id == dto.author}">
			<a href="bupdateui.do?num=${dto.num}">수정</a>
		</c:when>
		<c:otherwise>
			<a href="bread.do?num=${dto.num}" onclick="alert('ID가 일치하지 않습니다')">수정</a>
		</c:otherwise>
	</c:choose>
	
		<c:choose>
		<c:when test="${login.id == dto.author}">
			<a href="bdelete.do?num=${dto.num}">삭제</a>
		</c:when>
		<c:otherwise>
			<a href="bread.do?num=${dto.num}" onclick="alert('ID가 일치하지 않습니다')">삭제</a>
		</c:otherwise>
	</c:choose>

<br>

<jsp:include page="b_goodbad.jsp"/>

<%-- <script type="text/javascript">

		$("#good").click(function() { 
			var good = $("input[name='id']").val(); 
			
			$.ajax({
	            type:'post',
	            url   : 'good.do',
	            data: {
	               good : good
	            },
	            dataType:'json',
	            success: function(result){
	               $("p").text(result);
	            }
			});
		});

</script>--%>



</body>
</html>