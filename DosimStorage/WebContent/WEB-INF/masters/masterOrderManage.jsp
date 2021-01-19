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
<body>
	<div class="container">	
		<a href="wait_deposit.action?br=0">미입금현황</a><br>	
		<a href="timeout.action?br=0">주문취소처리</a><br>	
		<a href="userCancelForm.action">요청주문취소</a><br>	
		<a href="masterOrderList.action?list_opt=1&pageNum=1&br=0">전체주문조회</a>
	</div>
</body>
</html>