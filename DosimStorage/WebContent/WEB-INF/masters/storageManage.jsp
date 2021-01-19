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
	<div class="container">
		<h2>창고관리</h2>
		<h3><a href="masterStorageList.action?br=0">창고목록</a></h3>
		<h3><a href="insertStorageForm.action">창고추가</a></h3>
		<h3><a href="closureStorageForm.action">창고폐쇄</a></h3>
		<h3><a href="openStorageForm.action">창고개방</a></h3>
	</div>
</body>
</html>