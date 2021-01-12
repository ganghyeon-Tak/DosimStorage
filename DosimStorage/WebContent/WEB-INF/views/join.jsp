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
		alert("회원가입 성공, 로그인 화면에서 로그인해주세요");
		location.href="loginForm.do"
	</script> 
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("회원가입 실패");
		history.go(-1);
	</script> 
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("이미 있는 아이디입니다.");
		history.go(-1);
	</script> 
</c:if>
</body>
</html>