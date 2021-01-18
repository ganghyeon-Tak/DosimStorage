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
	<!-- 입금대기중인 주문건 표시 -->
		<a href="wait_deposit.action">미입금현황</a><br>
	<!-- 입금대기중이고 입금기한 넘긴 주문건 표시 -->
		<a href="timeout.action">주문취소처리</a><br>
	<!-- 1:1문의로 취소요청한 주문건 취소기능 -->	
		<a href="userCancelForm.action">요청주문취소</a><br>
	<!-- 전체주문조회. 주문상태에 따라 구분된 리스트 보여주는 것이 목표 -->
		<a href="masterOrderList.action?list_opt=1&pageNum=1">전체주문조회</a>
	</div>
</body>
</html>