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
</head>
<body>
<input type="hidden" value="${result }" id="result">
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert('오류가 발생해 창고 개방에 실패했습니다');
		location.href="openStorageForm.action";
	</script>
</c:if>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert(document.getElementById('result').value+"개 창고를 개방했습니다");
		location.href="openStorageForm.action";
	</script>
</c:if>
</body>
</html>