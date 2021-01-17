<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="m_sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("m_common.css");
</style>
</head>
<!-- 각각 메뉴에서 처리하는 기능에 대한 간략한 설명을 추가하자 -->
<body>
	<div class="container">
		<a href="wait_deposit.action">미입금현황</a><br>
		<a href="timeout.action">주문취소처리</a><br>
		<a href="#">전체주문조회</a>
	</div>
</body>
</html>