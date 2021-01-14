<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DosimStorage 관리자 로그인</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" type="text/css" href="assets/style.css" />
<style type="text/css">
@import url("common.css");

.title {
  text-align: center;
  margin-top: 40px;
  margin-bottom: 50px;
}

#table_master_login {
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
<script type="text/javascript">
	function chk() {
		if (frm.id.value != "master") {
			alert("관리자 아이디가 아닙니다")
			frm.id.value = "";
			frm.pass.value = "";
			frm.id.focus();
			return false;
		} else if (frm.pass.value != "1234") {
			alert("비밀번호가  틀렸습니다")
			frm.id.value = "";
			frm.pass.value = "";
			frm.id.focus();
			return false;
		}
		;
	};
</script>
</head>
<body>
<h2 class="title">관리자 로그인</h2>
<form action="m_login.action" method="post">
<table id="table_master_login">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="master_id"
			required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="master_pw"
			required="required"></td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" id="submit" value="로그인">
						<input type="reset" id="reset" value="취소"></th>
	</tr>
</table>
</form>
<div class="location__button">
	<button class="location__button__list" onclick="location.href='main.do'">메인</button>
</div>
</body>
</html>