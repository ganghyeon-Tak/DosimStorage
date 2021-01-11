<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
<h2>로그인</h2>
<form action="login.do" method="post">
<table>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="m_id"
			required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="m_pw"
			required="required"></td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" value="로그인"></th>
	</tr>
</table>
</form>
<a href="joinForm.do">회원가입</a>
<a href="main.do">홈페이지</a>
</body>
</html>