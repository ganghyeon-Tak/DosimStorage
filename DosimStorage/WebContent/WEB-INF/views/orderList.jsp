<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="sessionChk.jsp" %>
<meta charset="UTF-8">
<title>도심 창고</title>
<style>
@import url("common.css");

.title {
	text-align: center;
	margin-top: 40px;
	margin-bottom: 50px;
}

#table_order_list {
	width: 55%;
	margin: auto;
	text-align: center;
}

.location__button__list {
	background-color: transparent;
	cursor: pointer;
	border: none;
	outline: none;
	color: #1C2120;
	font-size: 15px;
	margin: 5px;
	padding: 6px 8px;
	border: 1px solid #1C2120;
	border-radius: 5px;
	font-family: 'Noto Serif KR', serif;
	text-align: center;
}

.location__button__list:hover {
	background-color: #DF964A;
}

.location__button {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<h2 class="title">신청 서비스 목록</h2>
	<table id="table_order_list">
		<tr>
			<th>주문번호</th>
			<th>주문일</th>
			<th>지점명</th>
			<th>서비스종류</th>
			<th>이용시작일</th>
			<th>이용개월</th>
			<th>주문총액</th>
			<th>주문상태</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">신청 내역이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="orderList" items="${list }">
				<tr>
					<td>${orderList.order_no }</td>
					<td>${orderList.order_date }</td>
					<td>${orderList.b_title }</td>
					<td>${orderList.s_kind}</td>
					<td>${orderList.hope_date }</td>
					<td>${orderList.use_period }</td>
					<td>${orderList.order_totalprice }</td>
					<td>${orderList.order_state }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<p>
	<div class="location__button">
		<button class="location__button__list" onclick="location.href='main.do'">메인</button>
		<button class="location__button__list" onclick="location.href='mypage.do'">마이페이지</button>
	</div>
</body>
</html>
