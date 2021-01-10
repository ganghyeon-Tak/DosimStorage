<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도심 창고</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
<h2>마이 페이지</h2>
<hr>
<h3>${member.m_name }회원님, '도심창고'를 이용해주셔서 감사합니다 &nbsp <input type="button" value="로그아웃" onclick="location.href='logout.do'"></h3>
<hr>
<table>
    <tr><th>현재 이용중인 서비스를 확인하실 수 있습니다 &nbsp <input type="button" value="이용중" onclick="location.href='orderList.do'"></th></tr>
    <tr><th>회원정보를 확인하실 수 있습니다 &nbsp <input type="button" value="조회" onclick="location.href='select.do'"></th></tr>
    <tr><th>회원정보를 수정하실 수 있습니다 &nbsp <input type="button" value="수정" onclick="location.href='updateForm.do'"></th></tr>
    <tr><th>'도심창고'의 회원을 탈퇴하실 수 있습니다 &nbsp <input type="button" value="탈퇴" onclick="location.href='delete.do'"></th></tr>
</table>
</body>
</html>
