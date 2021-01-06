<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도심 창고</title>
</head>
<body>
<h2>회원 정보</h2>
<table>
	<tr><th>아이디</th><td>${member.m_id }</td></tr>
	<tr><th>이름</th><td>${member.m_name }</td></tr>
	<tr><th>주소</th><td>${member.m_email }</td></tr>
	<tr><th>전화번호</th><td>${member.m_tel }</td></tr>
	<tr><th>가입일</th><td>${member.m_regdate }</td></tr>
	<tr><th>누적이용일</th><td>${member.total_use }</td></tr>
</table>
<p>
<button onclick="location.href='main.do'">메인</button>
<button onclick="location.href='mypage.do'">마이페이지</button>
</body>
</html>
</body>
</html>
