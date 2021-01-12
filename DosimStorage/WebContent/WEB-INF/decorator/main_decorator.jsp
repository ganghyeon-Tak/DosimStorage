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
	.a {text-align: center;}
	#log{float: right;}
	.footer__description {padding: 20px;}
	@import url("common.css");
</style>
<deco:head/>
</head>
<body>
<div id="page-wrapper">
<c:if test="${m_id == null && master_id == null}">
	<header id="main-header" class="a">
		<img class="main-image" alt="" src="images/logo.png" align="bottom">
			<div id="log">
				<ul class="log">
					<li><a href="loginForm.do">로그인</a></li>
					<li><a href="joinForm.do">회원가입</a></li>
				</ul>
			</div>
		</header>
	<hr>
	<nav>
	<div id="menu-first">
		<ul class="main">
			<li><a href="main.do">HOME</a></li>
			<li><a href="dosimStorage.do">도심창고</a></li>
			<li><a href="orderForm.do">신청하기</a></li>
			<li><a href="branchInfo.do?br=">지점안내</a>
				<ul class="sub">
					<li><a href="branchInfo.do?br=1">광화문점</a></li>
					<li><a href="branchInfo.do?br=2">신사점</a></li>
					<li><a href="branchInfo.do?br=3">판교점</a></li>
				</ul>
			</li>
			<li><a href="board.do">고객센터</a>
				<ul class="sub">
					<li><a href="#">Q&amp;A 게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</nav>
</c:if>
<c:if test="${m_id != null && m_del == n && master_id == null}">
	<header id="main-header" class="a">
		<img class="main-image" alt="" src="images/logo.png">
			<div id="log">
				<ul class="log">
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="mypage.do">마이페이지</a>
						<ul class="mypage">
							<li><a href="orderList.do">신청 서비스 조회</a></li>
							<li><a href="select.do">회원 정보 조회</a></li>
							<li><a href="updateForm.do">회원 정보 수정</a></li>
							<li><a href="delete.do">회원 탈퇴</a></li>						
						</ul>
					</li>
				</ul>
			</div>
		</header>
	<hr>
	<nav>
	<div id="menu-first">
		<ul class="main">
			<li><a href="main.do">HOME</a></li>
			<li><a href="dosimStorage.do">도심창고</a></li>
			<li><a href="orderForm.do">신청하기</a></li>
			<li><a href="branchInfo.do?br=">지점안내</a>
				<ul class="sub">
					<li><a href="branchInfo.do?br=1">광화문점</a></li>
					<li><a href="branchInfo.do?br=2">신사점</a></li>
					<li><a href="branchInfo.do?br=3">판교점</a></li>
				</ul>
			</li>
			<li><a href="board.do">고객센터</a>
				<ul class="sub">
					<li><a href="#">Q&amp;A 게시판</a></li>
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
<ul class="footer__description">
	<li>도심창고</li>
	<li>사업자등록번호 212-86-04975</li>
	<li>고객센터 1688-5000</li>
	<p><li>2021 DOSIM All rights reserved</li></p>
</ul>
</footer>
</div>
</body>
</html>
