<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("주문 완료");
		location.href="orderList.do"
	</script> 
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("주문 과정에서 에러가 발생했습니다.\n오류가 계속될 경우 관리자에게 문의해주세요!");
		history.go(-1);
	</script> 
</c:if>
</body>
</html>