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
	<table>
		<tr>			
			<th>주문번호</th>
			<th>회원아이디</th>
			<th>회원이름</th>			
			<th>창고코드</th>
			<th>주문액</th>
			<th>입금기한</th>
			<th>계좌번호</th>
			<th>주문상태</th>			
		</tr>
<c:if test="${empty list }">
		<tr>
			<th colspan="8">주문내역이 존재하지 않습니다</th>
		</tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="order" items="${list }">
		<tr>
			<td>${order.order_no }</td>
			<td>${order.m_id }</td>
			<td>${order.m_name }</td>
			<td>${order.st_code }</td>
			<td>${order.order_totalprice }</td>
			<td>${order.depo_duedate }</td>
			<td>${order.account_no }</td>
			<td>${order.order_state }</td>
		</tr>
	</c:forEach>
</c:if>
	</table>
</body>
</html>