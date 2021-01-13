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

.title {
  text-align: center;
  margin-top: 40px;
  margin-bottom: 50px;
}

#table_member_login {
  margin: auto;
  text-align: center;
  width: 18%;
}

.location__button__list {
  background-color: transparent;
  cursor: pointer;
  border: none;
  outline: none;
  color: #1C2120;
  font-size: 15px;
  margin: 5px;
  padding: 6px 8px;
  border: 1px solid #1C2120;
  border-radius: 5px;
  font-family: 'Noto Serif KR', serif;
  text-align: center;
}

.location__button {
  text-align: center;
  margin-top: 30px;
  margin-bottom: 30px;
}

.location__button__list:hover,
#submit:hover, #reset:hover {
  background-color: #DF964A;
}

#submit, #reset {
  background-color: transparent;
  cursor: pointer;
  border: none;
  outline: none;
  color: #1C2120;
  font-size: 15px;
  margin: 2px;
  padding: 3px 8px;
  border: 1px solid #1C2120;
  border-radius: 5px;
  font-family: 'Noto Serif KR', serif;
  text-align: center;
}
</style>
</head>
<body>
<h2 class="title">로그인</h2>
<form action="login.do" method="post">
<table id="table_member_login">
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
		<th colspan="2"><input type="submit" id="submit" value="로그인"></th>
	</tr>
</table>
</form>
<div class="location__button">
	<button class="location__button__list" onclick="location.href='joinForm.do'">회원가입</button>
	<button class="location__button__list" onclick="location.href='main.do'">메인</button>
</div>
</body>
</html>
