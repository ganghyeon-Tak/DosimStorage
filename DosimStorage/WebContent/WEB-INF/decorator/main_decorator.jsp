<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<deco:head/>
</head>
<body>
<!-- if else 처리 12장 참고 --> 
<nav>
<c:if test="${m_id == null && master_id == null}">
<table>
	<tr>
		<th><a href="main.do">HOME</a></th>
		<th><a href="dosimStorage.do">도심창고</a></th>
		<th><a href="orderForm.do">신청하기</a></th>
		<th><a href="branchInfo.do">지점안내</a></th>	
		<th><a href="loginForm.do">로그인</a></th>
		<th><a href="joinForm.do">회원가입</a></th>
	</tr>
</table>
</c:if>
<c:if test="${m_id != null && m_del == n && master_id == null}">
<table>
	<tr>
		<th><a href="main.do">HOME</a></th>
		<th><a href="dosimStorage.do">도심창고</a></th>
		<th><a href="orderForm.do">신청하기</a></th>
		<th><a href="branchInfo.do">지점안내</a></th>	
		<th><a href="board.do">고객센터</a></th>
		<th><a href="mypage.do">마이페이지</a></th>
	</tr>
</table>
</c:if>
<c:if test="${master_id != null }">
<table>
	<tr>
		<th><a href="main.do">HOME</a></th>
		<th><a href="dosimStorage.do">도심창고</a></th>
		<th><a href="orderForm.do">신청하기</a></th>
		<th><a href="branchInfo.do">지점관리</a></th>	
		<th><a href="board.do">고객센터관리</a></th>
		<th><a href="masterPage.do">관리자페이지</a></th>
	</tr>
</table>
</c:if>
</nav>
<hr>
<deco:body></deco:body>
<hr>
<footer>
<div>
<ul type="none">
	<li>상호명 : </li>
	<li>주소 : </li>
	<li>전화번호 : </li>
</ul>
</div>
<div>
<ul type="none">
	<li><h4>고객센터</h4></li>
	<li>월  ~ 금 : 10:00 ~ 18:30</li>
	<li>점심시간 : 12:00 ~ 13:00</li>
</ul>
</div>
</footer>
</body>
</html>