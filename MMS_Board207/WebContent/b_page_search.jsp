<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<%


%>
<a>&laquo;</a>

<c:if test="${to.curPage>1}">
 <a href="bsearch.do?curPage=${to.curPage-1}&target=${value}&condition=${condition}">< &nbsp;&nbsp;</a>
 </c:if>
 
<c:forEach var="i" begin="${to.beginPageNum}" end="${to.stopPageNum}">
	<a href="bsearch.do?curPage=${i}&target=${value}&condition=${condition}" style="font-size:20px;  ${i == to.curPage? 'color:powderblue':''}">${i}</a>&nbsp;&nbsp;
</c:forEach>

<c:if test="${to.curPage< to.totalPage}">
<a href="bsearch.do?curPage=${to.curPage+1}&target=${value}&condition=${condition}">></a>
</c:if>

 