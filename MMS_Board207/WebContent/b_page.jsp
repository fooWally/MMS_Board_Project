<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- 왼쪽 두개짜리 화살표 --%>
<c:if test="${to.stopPageNum -10 > 1}">
	<a href="blist.do?curPage=${to.beginPageNum-10 <1 ? 1 : to.beginPageNum-10}">&laquo;</a>
</c:if>

<%-- 왼쪽 화살표 만들기 --%>
<c:if test="${to.curPage>1}">
	<a href="blist.do?curPage=${to.curPage-1}"> &lt; &nbsp;&nbsp;</a>
</c:if>


<%-- beginPageNum ~ stopPageNum 까지 뽑아내기 --%>
<c:forEach var="i" begin="${to.beginPageNum}" end="${to.stopPageNum}">
	<a href="blist.do?curPage=${i}&value=${value}&condition=${condition}" style="font-size: 20px; ${i == to.curPage? 'color:red;' : ''}" href="blist.do?curPage=${i}">${i}</a>&nbsp;&nbsp;
	<%-- 모든 페이지의 숫자 폰트사이즈 20px, 삼항연산자를 이용하여 선택된 페이지만 빨간색으로 표시 --%>
</c:forEach>


<%-- 오른쪽 화살표 만들기 --%>
<c:if test="${to.curPage < to.totalPage}">
	<a href="blist.do?curPage=${to.curPage+1 }"> &nbsp;&nbsp; &gt; </a>
</c:if>

<%-- 오른쪽 두개짜리 화살표 --%>
<c:if test="${to.stopPageNum != to.totalPage}">
	<a href="blist.do?curPage=${to.stopPageNum+1}">&raquo;</a>
</c:if>
