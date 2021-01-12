<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="sessionChk.jsp" %>
<meta charset="UTF-8">
<title>도심 창고</title>
<style type="text/css">
@import url("common.css");

#table_member_select {
  margin: auto;
  text-align: center;
  width: 20%;
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

.location__button__list:hover {
  background-color: #DF964A;
}

.location__button {
  text-align: center;
  margin-top: 30px;
  margin-bottom: 30px;
}
</style>
</head>
<body>
<h2 class="title">회원 정보</h2>
<table id="table_member_select">
	<tr><th>아이디</th><td>${member.m_id }</td></tr>
	<tr><th>이름</th><td>${member.m_name }</td></tr>
	<tr><th>이메일</th><td>${member.m_email }</td></tr>
	<tr><th>전화번호</th><td>${member.m_tel }</td></tr>
	<tr><th>가입일</th><td>${member.m_regdate }</td></tr>
	<tr><th>누적이용일</th><td>${member.total_use }</td></tr>
</table>
<p>
<div class="location__button">
	<button class="location__button__list" onclick="location.href='main.do'">메인</button>
	<button class="location__button__list" onclick="location.href='mypage.do'">마이페이지</button>
</div>
</body>
</html>
