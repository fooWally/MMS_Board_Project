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
		<h1>글 자세히 보기</h1>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" id="title" readonly value="${vo.title }" name="title">
		</div>
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" id="writer" readonly value="${vo.writer}" name="writer">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea readonly="readonly" name="content" id="content" rows="5" class="form-control">${vo.content}</textarea>
		</div>
	</div><!--class=row  -->

	<div class="row">
		<form >
			<input type="hidden" name="bno" value="${vo.bno}">
			<!--paging처리후 :To keep curPage value for the next step such as 댓글, 수정, 삭제, 목록
			e.g: click on an article with bno=10 on page2(=curPage); read/10?curPage=2 -->	
			<input type="hidden" name="curPage" value="${curPage}">	
		</form>
		<div class="form-group">
			<button id="reply_form" class="btn btn-info">댓글</button>
			<button class="btn btn-success">수정</button>
			<button class="btn btn-danger">삭제</button>
			<button class="btn btn-primary">목록</button>
		</div>
	</div><!--class row  -->
	
	<div class="row">
		<!--댓글 입력창 열렸다 닫혓다  -->
		<div id="myCollapsible" class="collapse">
			<div class="form-group">
				<label for="replyer">작성자</label>
				<input class="form-control" id="replyer" name="replyer">
			</div>
			<div class="form-group">
				<label for="replytext">내용</label>
				<input class="form-control" id="replytext" name="replytext">
			</div>
		</div>
		
		<!--댓글 전송/취소  -->
		<div class="form-group">
			<button id="insertReply" class="btn btn-warning">댓글등록</button>
			<button class="btn btn-default">댓글취소</button>
		</div>
	
	</div><!--class row  -->

	<div class="row" >
		<div id="replies">
			
			<!--Now type manually the following for a test and use for later in function getList  -->
			<%--  <div class="panel panel-info" > 
				<div class="panel-heading" >
					<span>rno: 1, 작성자: 홍길동</span>
					<span class="pull-right">2020-02-21 09:23</span>
				</div>
				
				<div data-rno='obj.rno' class="panel-body"> 아래 forloop에 str의 <div> tag에  사용자 속성: data-rno='obj.rno' 포함
					<p>댓글 내용 여기 들어감</p>
					<button class="btn btn-link btn-update">수정</button>
					<button class="btn btn-link btn-delete">삭제</button>
				</div>
			</div> --%>
			
			<!-- dynamically get repeatedly data from DB in the same of the test lines above --> 
		</div>
	</div><!--class row  -->
	
	<!--modal창  -->
	<div class="row" >
		<div id="mymodal" class="modal">
			<div class="modal-dialog">
				<div class="modal-header" >
					<button class="close" data-dismiss = "modal">&times;</button>
					<p id="modal_rno" ></p>
				</div>
				
				<div class="modal-body">
					<input class="form-controll" id="modal_replytext">
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" id="modal_update" class="btn btn-warning btn-xs" >수정</button>
					<button data-dismiss="modal" id="modal_close" class="btn btn-warning btn-xs" >취소</button>
				</div>
			</div>
		</div>	
	</div><!--class row  -->
	
</div><!--class=container  -->

<script type="text/javascript">
	var bno = ${vo.bno};
	$(document).ready(function() {
		
		$("#modal_update").click(function () {
			var rno = $("#modal_rno").text();
			var replytext = $("#modal_replytext").val(); 
			$.ajax({
				type:'put',
				url:'/replies',
				headers:{
					'Content-Type':'application/json',
					'X-HTTP-Method-Override': 'put'
				},
				data: JSON.stringify({  //send data to rest controller
					rno: rno,
					replytext: replytext
				}),
				dataType: 'text',
				success: function (data) {
					/* alert(data); */
					getList(bno);
				}
			});
		});
		
		
		/*수정 modal 창  */
		$("#replies").on("click", ".btn-update", function() {
			$("#mymodal").modal("show");
			var rno = $(this).parent().attr("data-rno") ;
			var replytext = $(this).prev("p").text(); 
			$("#modal_rno").text(rno);
			$("#modal_replytext").val(replytext);
		});
		
		
		/* dynamically생성된 수정 삭제  button 처리 (class="panel-body"를 가진 div tag으로 감싸여진 button들)--> ;e.g .btn-delete class */
		$("#replies").on("click", ".btn-delete", function() {
			/*this = click한 button;  parent(); 부모 tag의 attr("data-rno"); 속성값 가져오기 */
			var rno = $(this).parent().attr("data-rno");
			/* alert(rno)  check 클릭한 댓글 번호rno 제대로 뜨는지 */
			/* 삭제후 현재페이지에 머물러 */
			$.ajax({
				type:'delete',
				url:'/replies/' + rno, //아래 data: JSON....불필요
				headers:{
					'Content-Type':'application/json',
					'X-HTTP-Method-Override': 'delete'
				},
				/* data: JSON.stringify({  //위 url + rno없을때, 여기 data필요
					rno: rno
				}), */
				dataType: 'text',
				success: function (result) {
					alert(result);
					/*data 새로 불러오기  */
					getList(bno);
				}
			});
		});
		
		
		/*get data from user input on browser  */
		$("#insertReply").click(function () {
			var replyer = $("#replyer").val();
			var replytext = $("#replytext").val();
			console.log(replyer);
			$.ajax({
				type:'post',
				url:'/replies',
				headers:{
					'Content-Type':'application/json',
					'X-HTTP-Method-Override': 'POST'
				},
				data: 
					/*use json.stringify to send data to rest controller */
					JSON.stringify({
						replyer: replyer,
						replytext: replytext,
						bno: bno
					}),
				dataType:'text',
				success: function (result) {
					alert("insert success");
					/*reset the vals of reply_form empty when insertion is successfully performed */
					$("#replyer").val('');
					$("#replytext").val('');
					//댓글 입력후 모든 댓글 바로 출력
					getList(bno);
				}
			});
		});
		
		/* reply_form 창 열렸다 닫혔다 */
		$("#reply_form").click(function () {
			$("#myCollapsible").collapse("toggle");
		});
		
		
		$(".btn-primary").click(function() {
			/* clicking on the button gets you to the first page */
			/* $("form").attr("method", "get");
			$("form").attr("action", "/board/list");
			$("form").submit(); */
			/*paging 처리 후  /board/list -->/board/listpage and add ?curPage=${curPage} */
			location.assign("/board/listpage?curPage=${curPage}"); 
		});
		
		$(".btn-success").click(function() {
			$("form").attr("method", "get");
			$("form").attr("action", "/board/update");
			$("form").submit();
		});
		
		getList(bno);
		
	});
	
	/* 특정 본글에 대한 댓글만 가져옴 bno */
	/* dynamically created 수정 삭제  button 처리 해야함: see on() function in the above*/
	function getList(bno) {
		/* pathVariable needed in ReplyController; value="{bno}" */
		$.getJSON("/replies/"+bno, function (data) {
			/* to see dataType */
			console.log(data);
			var str="";
			for (var i = 0; i < data.length; i++) {
				var obj = data[i];
				str += '<div class="panel panel-info"><div class="panel-heading"><span>rno: '+ obj.rno +', 작성자: '+ obj.replyer +'</span><span class="pull-right">'+ obj.regdate +'</span></div><div data-rno=" '+obj.rno+' " class="panel-body"><p>'+ obj.replytext +'</p><button class="btn btn-link btn-update">수정</button><button class="btn btn-link btn-delete">삭제</button></div></div>'
			}
			$("#replies").html(str); /*모든 댓글 다 가져와서 다시 뿌려줌  */
			/* $("#replies").append(str); */ /* 추가 compare it to html */
		});
	}
	
	
</script>




</body>
</html>