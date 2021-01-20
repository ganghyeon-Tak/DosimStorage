<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("m_common.css");
</style>
</head>
<body>
	<div class="container">
		<h2>전체 회원 목록</h2>
		<table>
			<tr>
				<th>아이디</th>			
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>누적이용일</th>
				<th>탈퇴여부</th>
			</tr>
	<c:if test="${empty list }">
			<tr>
				<th colspan="7">가입한 회원이 없습니다</th>
			</tr>
	</c:if>
	<c:if test="${not empty list }">		
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.m_id }</td>			
				<td>${member.m_name }</td>
				<td>${member.m_email }</td>
				<td>${member.m_tel }</td>
				<td>${member.m_regdate }</td>
				<td>${member.total_use }</td>
				<td>${member.m_del }</td>
			</tr>
		</c:forEach>
	</c:if>
		</table>
	</div>
</body>
</html>