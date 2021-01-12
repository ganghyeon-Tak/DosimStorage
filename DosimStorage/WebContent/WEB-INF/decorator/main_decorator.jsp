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
<div id="page-wrapper">
	<header id="main-header">
		<img class="main-image" alt="" src="images/medium.PNG" align="bottom">
<c:if test="${m_id == null && master_id == null}">
		<div id="log"><a href="loginForm.do">로그인</a>
			<a href="joinForm.do">회원가입</a></div>
	</header>
	<hr>
	<nav>
	<div id="menu-first">
		<ul class="main">
			<li><a href="main.do">HOME</a></li>
			<li><a href="dosimStorage.do">도심창고</a></li>
			<li><a href="orderForm.do">신청하기</a></li>
			<li><a href="branchInfo.do">지점안내</a>
				<ul class="sub">
					<li><a href="branchInfo.do">광화문점</a></li>
					<li><a href="branchInfo.do">판교점</a></li>
					<li><a href="branchInfo.do">신사점</a></li>
				</ul>
			</li>
			<li><a href="board.do">고객센터</a>
				<ul class="sub">
					<li><a href="#">Q&A 게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</nav>
</c:if>
<c:if test="${m_id != null && m_del == n && master_id == null}">
<div id="log"><a href="logout.do">로그아웃</a>
	<a href="mypage.do">마이페이지</a></div>
	</header>
	<hr>
	<nav>
	<div id="menu-first">
		<ul class="main">
			<li><a href="main.do">HOME</a></li>
			<li><a href="dosimStorage.do">도심창고</a></li>
			<li><a href="orderForm.do">신청하기</a></li>
			<li><a href="branchInfo.do">지점안내</a>
				<ul class="sub">
					<li><a href="branchInfo.do">광화문점</a></li>
					<li><a href="branchInfo.do">판교점</a></li>
					<li><a href="branchInfo.do">신사점</a></li>
				</ul>
			</li>
			<li><a href="board.do">고객센터</a>
				<ul class="sub">
					<li><a href="#">Q&A 게시판</a></li>
					<li><a href="#">1:1 문의</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</nav>
</c:if>
<hr>
<deco:body></deco:body>
<hr>
<footer>
<div>
<ul>
	<li>상호명 : </li>
	<li>주소 : </li>
	<li>전화번호 : </li>
</ul>
</div>
<div>
<ul>
	<li><h4>고객센터</h4></li>
	<li>월  ~ 금 : 10:00 ~ 18:30</li>
	<li>점심시간 : 12:00 ~ 13:00</li>
</ul>
</div>
</footer>
</div>
</body>
</html>