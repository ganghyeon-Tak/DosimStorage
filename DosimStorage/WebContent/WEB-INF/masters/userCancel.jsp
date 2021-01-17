<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:if test="${result == 0 }">
		<c:if test="${empty list }">
			<script type="text/javascript">
				alert("주문 취소에 실패했습니다");
				history.back();
			</script>
		</c:if>
		<c:if test="${not empty list }">
		<h2>유효하지 않은 주문번호를 입력하셨습니다</h2>
			<c:forEach var="num" items="${list }">			
		<p>잘못된 주문번호: ${num }</p>
			</c:forEach>
		<button onclick="location.href='wait_deposit.action'">미입금현황</button>
		</c:if>
	</c:if>
	<c:if test="${result > 0 }">
		<c:if test="${empty list }">
		<script type="text/javascript">
			alert("입력하신 모든 주문 취소에 성공했습니다");
			location.href="wait_deposit.action";
		</script>
		</c:if>
		<c:if test="${not empty list }">
		<h2>주문 취소에는 성공했으나</h2>
		<h2>일부 잘못된 주문번호가 있었습니다</h2>
			<c:forEach var="num" items="${list }">			
		<p>잘못된 주문번호: ${num }</p>
			</c:forEach>
		<button onclick="location.href='wait_deposit.action'">미입금현황</button>
		</c:if>
	</c:if>
	</div>
</body>
</html>