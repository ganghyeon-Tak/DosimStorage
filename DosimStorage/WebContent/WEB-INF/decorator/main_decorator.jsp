<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
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
			<li><a href="branchInfo.do?br=1">지점안내</a>
				<ul class="sub">
					<li><a href="branchInfo.do?br=1">광화문점</a></li>
					<li><a href="branchInfo.do?br=2">신사점</a></li>
					<li><a href="branchInfo.do?br=3">판교점</a></li>
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
			<li><a href="branchInfo.do?br=1">지점안내</a>
				<ul class="sub">
					<li><a href="branchInfo.do?br=1">광화문점</a></li>
					<li><a href="branchInfo.do?br=2">신사점</a></li>
					<li><a href="branchInfo.do?br=3">판교점</a></li>
				</ul>
			</li>
			<li><a href="board.do">고객센터</a>
				<ul class="sub">
					<li><a href="#">Q&A 게시판</a></li>
					<li><a href="list.bo">1:1 문의</a></li>
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
<
<ul>
	<li>도심창고</li>
	<li>사업자등록번호 212-86-04975</li>
	<li>고객센터 1688-5000</li><p>
	<l>2021 DOSIM All rights reserved</li>
</ul>
</div>
</footer>
</div>
</body>
</html>
