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

	<%
		/*instead of db, use the following db:  in reality, get data from database   */
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		list.add(new MemberDTO("m001", "kim",11));
		list.add(new MemberDTO("m002", "lee",22));
		list.add(new MemberDTO("m003", "park",33));
		/*to use ajax  */
		ObjectMapper mapper = new ObjectMapper();
		String mList= mapper.writeValueAsString(list);
		 // to use mList in el
		pageContext.setAttribute("mList", mList);
	%>
	<!--To use EL for mList, see JSON.stringify(${mList}) in data-->


	<div class="row">
		<input>
		<button class="btn btn-warning">test4</button>

	</div>

</div>
<script type="text/javascript">
	$(document).ready(function () {
		$("button").click(function () {
			/*To take input data to put in data of ajax*/
			var val = $("input").val();
			$.ajax({
				type:'post',
				url:'/test/test4',
				data: {
					/*ignore error*/
					mList : JSON.stringify(${mList})
				},
				dataType:'text',
				success: function(result){
					/* console.log(result); */
					var arr = JSON.parse(result);
					console.log(arr);
					for (var i = 0; i < arr.length; i++) {
						var obj = arr[i];
						alert(obj.id);
						alert(obj.name);
						alert(obj.age);
					}
				}
			});
		});
	});




</script>


</body>
</html>