<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");	
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.m_pw.value != frm.m_pwConfirm.value) {
			alert("비밀번호와 비밀번호 확인이 다릅니다");
			frm.m_pw.focus();
			frm.m_pw.value = "";
			frm.m_pwConfirm.value = "";
			return false;
		}
	}
	function idChk() {
		if (!frm.m_id.value) {
			alert("아이디 입력한 후에 체크하시오");
			frm.m_id.focus();
			return false;
			}
		$.post('idChk.do', "m_id="+frm.m_id.value, function(data) {
			$('#err').html(data);
		});
	}
</script>
</head>
<body>
<h2>회원가입</h2>
<form action="join.do" method="post" name="frm" 
	onsubmit="return chk()">
<table>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="m_id" 
		required="required" autofocus="autofocus">
		<input type="button" value="중복확인" onclick="idChk()">
		<div id="err"></div></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="m_pw"
		required="required"></td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="m_pwConfirm"
		required="required"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="m_name"
		required="required"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" name="m_email"
		required="required"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="tel" name="m_tel"
		required="required" pattern="\d{3}-\d{3,4}-\d{4}"
		title="xxx-xxxx-xxxx형식입니다" placeholder="010-1234-5678"></td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit" value="가입">
		<button type="button" onclick="location.href='main.do'">홈으로</button></th>
	</tr>
</table>
</form>
</body>
</html>