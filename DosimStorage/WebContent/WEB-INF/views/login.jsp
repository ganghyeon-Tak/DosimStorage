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
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("로그인 성공");
		location.href = "main.do"
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("암호가 올바르지 않습니다. 다시 입력해주세요");
		history.back();
	</script>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("없는 아이디입니다.");
		history.back();
	</script>
</c:if>
</body>
</html>