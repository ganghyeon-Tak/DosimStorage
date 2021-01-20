<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DS MASTER PAGE</title>
<style type="text/css">
	.a {text-align: center;}
	#log{float: right;}
	.footer__description {padding: 30px;}
	.l{padding: 20px;}
	@import url("m_common.css");	
</style>
<script type="text/javascript">
	function logout() {
		var xhr = new XMLHttpRequest();
		xhr.open("get","m_logout.action",true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {	
				if (xhr.status == 200) {	
					location.reload();
				} else {
					alert('요청오류: '+xhr.status);
				}				
			}
		}		
		xhr.send(null);
	}
</script>
<deco:head/>
</head>
<body>
<div id="page-wrapper">
	<header id="main-header" class="a">
		<a href="m_main.action"><img class="main-image" alt="" src="images/logo.png" align="bottom"></a>
			<div id="log">
				<ul class="log">
					<li><a href="javascript:logout();">로그아웃</a></li>
					<li><a href="masterPage.action">관리자페이지</a>
						<ul class="mypage">
							<li><a href="#.action">회원관리</a></li>							
							<li><a href="storageManage.action">창고관리</a></li>
							<li><a href="masterOrderManage.action">주문관리</a></li>
							<li><a href="#.action">고객센터관리</a></li>
							<li><a href="main.do">도심창고 홈</a></li>						
						</ul>
					</li>
				</ul>
			</div>
		</header>
	<hr>
	<nav>
		<div id="menu-first">
			<ul class="main">
				<li><a href="m_memberList.action">회원관리</a></li>			
				<li><a href="storageManage.action">창고관리</a>
					<ul class="sub">
						<li><a href="masterStorageList.action?br=0">창고목록</a></li>
						<li><a href="insertStorageForm.action">창고추가</a></li>
						<li><a href="closureStorageForm.action">창고폐쇄</a></li>
						<li><a href="openStorageForm.action">창고개방</a></li>					
					</ul>
				</li>
				<li><a href="masterOrderManage.action">주문관리</a>
					<ul class="sub">
						<li><a href="wait_deposit.action?br=0">미입금현황</a></li>
						<li><a href="timeout.action?br=0">기간초과주문</a></li>
						<li><a href="userCancelForm.action">요청주문취소</a></li>
						<li><a href="masterOrderList.action?list_opt=1&pageNum=1&br=0">전체주문조회</a></li>					
					</ul>
				</li>
				<li><a href="#.action">고객센터관리</a>
					<ul class="sub">
						<li><a href="#">Q&amp;A 게시판</a></li>
						<li><a href="#">1:1 문의</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
<hr>
<deco:body></deco:body>
<footer>
<hr>
<ul class="footer__description">
	<li>도심창고</li>
	<li>사업자등록번호 212-86-04975</li>
	<li>고객센터 1688-5000</li>
	<li class="l">2021 DOSIM All rights reserved</li>
</ul>
</footer>
</div>
</body>
</html>
