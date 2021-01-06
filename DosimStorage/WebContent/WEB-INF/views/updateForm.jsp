<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도심 창고</title>
<script type="text/javascript">
	function chk() {
		if (frm1.password.value != frm1.confirmPass.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm1.password.focus();
			frm1.password.value = "";
			return false;
		}
	}
</script>
</head>
<body>
	<h2>회원 정보 수정</h2>
	<form action="update.do" method="post" name="frm1"
		onsubmit="return chk()">
		<input type="hidden" name="id" value="${member.m_id }">
		<table>
			<tr>
				<th>아이디</th>
				<td>${member.m_id }</td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="password" required="required"></td>
			</tr>
			<tr>
				<th>암호확인</th>
				<td><input type="password" name="confirmPass"
					required="required"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required="required"
					value="${member.m_name }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required"
					value="${member.m_email }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="tel" required="required"
					pattern="\d{3}-\d{3,4}-\d{4}" title="xxx-xxxx-xxxx형식입니다"
					placeholder="010-1234-1234" value="${member.m_tel }"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="확인"><input type="reset" value="취소"></th>
			</tr>
		</table>
	</form>
</body>
</html>
