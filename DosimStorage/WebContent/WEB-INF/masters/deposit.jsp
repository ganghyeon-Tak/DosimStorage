<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("m_common.css");
</style>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("입금확인 처리 성공");
		location.href = "wait_deposit.action?br=0"
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("입금확인 처리 실패");
		history.back();
	</script>
</c:if>
</body>
</html>