<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="master_id" value="${sessionScope.master_id}" />
<c:if test="${empty master_id }">
	<script type="text/javascript">
		location.href="m_loginForm.action";
	</script>
</c:if>
</body>
</html>