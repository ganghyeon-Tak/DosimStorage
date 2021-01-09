<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="sessionChk.jsp" %>
<meta charset="UTF-8">
<title>도심 창고</title>
</head>
<body>
	<h2>주문 목록</h2>
	<table>
		<tr>
			<th>주문번호</th>
			<th>주문일</th>
			<th>지점명</th>
			<th>서비스종류</th>
			<th>이용만료일</th>
			<th>주문상태</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="6">주문 내역이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="orderList" items="${list }">
				<tr>
					<td>${orderList.order_no }</td>
					<td>${orderList.order_date }</td>
					<td>${orderList.b_title }}</td>
					<td>${orderList.s.kind}</td>
					<td>${orderList.expire_date }}</td>
					<td>${orderList.order_state }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<p>
	<button onclick="location.href='main.do'">메인</button>
	<button onclick="location.href='mypage.do'">마이페이지</button>
</body>
</html>
