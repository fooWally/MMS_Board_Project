<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="com.naver.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
		<button class="btn btn-warning">rest4</button>
	</div>
</div>
<%
	List<MemberDTO> list = new ArrayList<MemberDTO>();
	list.add(new MemberDTO("m001","kim",11));
	list.add(new MemberDTO("m002","lee",11));
	list.add(new MemberDTO("m003","park",11));
	ObjectMapper mapper = new ObjectMapper();
	String mList = mapper.writeValueAsString(list);
	pageContext.setAttribute("mList", mList);
%>


<script type="text/javascript">
	var test1 = "hello";	
	var test2 = "world";
	var test3 = "good";
 	var test4 = [
		{name:'john', age:10, addr:'seoul'},
		{name:'joe', age:11, addr:'busan'},
		{name:'jane', age:12, addr:'jeju'}
	];
	var test5 = ${mList}
	$(document).ready(function () {
		$("button").click(function () {
			$.ajax({
				type: 'post',
				url: '/rest4',
				headers:{
					'Content-Type':'application/json',
					'X-HTTP-Method-Override': 'post'
				},
				data: JSON.stringify({
					test1: test1,
					test2: test2,
					test3: test3,
 					test4: test4,
 					test5: test5
				}),
				dataType: 'text',
				success: function (result) {
					console.log(result);
				}
			})
		});
	});
	




</script>


</body>
</html>