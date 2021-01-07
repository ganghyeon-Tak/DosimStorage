<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result >0 }">
	<script type="text/javascript">
	alert("로그인 되었습니다")
	location.href="m_main.action";
	</script>
	</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
	alert("암호가 다름")
	history.go(-1);
	</script>
	</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
	alert("관리자 아이디가 아닙니다")
	history.go(-1);
	</script>
	</c:if>
</body>
</html>