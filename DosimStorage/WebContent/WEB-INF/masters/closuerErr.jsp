<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="m_sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("m_common.css");
</style>
<script type="text/javascript">
	alert('폐쇄 직전에 해당 창고에 주문이 들어왔습니다');
	location.href="closureStorageForm.action";
</script>
</head>
<body>
</body>
</html>