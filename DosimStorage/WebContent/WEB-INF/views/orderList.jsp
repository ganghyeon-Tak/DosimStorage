<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도심 창고</title>
</head>
<body>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("주문 내역이 없습니다");
		history.go(-1);
	</script>
</c:if>
<h2>주문조회</h2>
<table>
	<tr><th>주문번호</th><td>${orderList.order_no }</td></tr>
	<tr><th>주문일</th><td>${orderList.order_date }</td></tr>
	<tr><th>지점명</th><td>${orderList.b_title }</td></tr>
	<tr><th>서비스종류</th><td>${orderList.s.kind}</td></tr>
	<tr><th>이용만료일</th><td>${orderList.expire_date }</td></tr>
	<tr><th>주문상태</th><td>${orderList.order_state }</td></tr>
</table>
<p>
<button onclick="location.href='main.do'">메인</button>
<button onclick="location.href='mypage.do'">마이페이지</button>
</body>
</html>
</body>
</html>