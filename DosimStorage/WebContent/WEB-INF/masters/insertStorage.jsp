<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<p>${result }개 창고를 생성했습니다<p>
		<p>생성한 창고코드:</p>
			<c:forEach var="st" items="${list }">
			 <p>${st }</p>
			</c:forEach>		
	</div>	
</body>
</html>