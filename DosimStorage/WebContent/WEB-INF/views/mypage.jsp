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

.mypage {
  margin: 0;
  cursor: default;
  text-align: center;
}

.mypage__title {
  align-items: center;
  margin-top: 40px;
}

.mypage__welcome {
  margin-bottom: 60px;
}

#mypage__menu__button {
  background-color: transparent;
  cursor: pointer;
  border: none;
  outline: none;
  color: #1C2120;
  font-size: 17px;
  margin: 10px;
  padding: 8px 12px;
  border: 1px solid #1C2120;
  border-radius: 5px;
  font-family: 'Noto Serif KR', serif;
}

#mypage__menu__button:hover {
  background-color: #DF964A;
}
</style>
</head>
<body>
<div class="mypage">
		<h2 class="mypage__title">마이 페이지</h2>
		<h3 class="mypage__welcome">${member.m_name } 회원님, '도심창고'를 이용해주셔서 감사합니다</h3>
	<div class="mypage__menu">	
		<input type="button" id="mypage__menu__button" value="신청 서비스 조회"onclick="location.href='orderList.do'">
		<input type="button" id="mypage__menu__button" value="회원 정보 조회"onclick="location.href='select.do'">
		<input type="button" id="mypage__menu__button" value="회원 정보 수정"onclick="location.href='updateForm.do'">
		<input type="button" id="mypage__menu__button" value="회원 탈퇴"onclick="location.href='delete.do'">
	</div>
</div>
</body>
</html>
