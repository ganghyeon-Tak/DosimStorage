<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="m_id" value="${sessionScope.m_id }"></c:set>
<c:if test="${empty m_id }">
	<script>
		location.href="loginForm.do";
	</script>
</c:if>	
