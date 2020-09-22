<%@page import="com.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<header>  
<a href="index.jsp">홈페이지</a>
<br>

<c:if test="${login.id=='admin'}">
	<a href ="mlist.do">회원 목록</a>
	<br>
</c:if>

	<a href ="mlist.do">회원 목록</a>
	<br>
	<a href ="minsertui.do">회원 등록</a>
	<br>
	<c:choose>
		<c:when test="${not empty login}">${login.name} 님, 환영합니다. <a href = 'mlogout.do'>로그아웃</a></c:when>
		<c:otherwise>로그인을 하세요.<a href = 'mloginui.do'>로그인</a></c:otherwise>
	</c:choose>
	
<c:if test="${not empty login}">
<a href="m_mypage.jsp">마이페이지</a>
</c:if>

</header>
