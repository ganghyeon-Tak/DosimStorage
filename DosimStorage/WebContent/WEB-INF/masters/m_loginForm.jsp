<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jura 관리자 로그인</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" type="text/css" href="assets/style.css" />
<style type="text/css">
table {
	margin: 0 0 2em 0;
	width: 50%;
	margin: auto;
	text-align: center;
}

p {
	text-align: center;
	font-size: 35px;
	font-family: fantasy;
}
#btns { margin-left: 5px; margin-right: 5px; }
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
	<form action="m_login.action" name="frm" onsubmit="return chk()">
		<p></p>
		<p>JURA 관리자</p>
		<table>
			<tr>
				<td align="center" bgcolor="#f6f6f6"><font size=3 color="black">아이디</font></td>
				<td bgcolor="#f6f6f6" ><input type="text" name="id" size="3"></td>
			</tr>
			<tr>
				<td align="center" bgcolor="#f6f6f6"><font size=3 color="black">비밀번호</font></td>
				<td bgcolor="#f6f6f6"><input type="password" name="pass" size="3"></td>
			</tr>
			<tr><td bgcolor="white"></td>
			<tr><td bgcolor="white"></td>
			<tr>
				<td colspan="2" align="center" bgcolor="white">
					<input type="submit" id="btns" value="로그인">
					<input type="reset" id="btns" value="취소">
					<input type="button" id="btns" value="홈으로" onclick="location.href='main.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>