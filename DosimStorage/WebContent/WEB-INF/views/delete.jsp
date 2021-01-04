<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도심 창고</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("탈퇴되었습니다");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("탈퇴에 실패하였습니다");
		history.back();
	</script>
</c:if>
</body>
</html>