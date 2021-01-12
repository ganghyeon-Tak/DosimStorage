<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도심 창고</title>
<style type="text/css">
@import url("common.css");

.title {
  text-align: center;
  margin-top: 40px;
  margin-bottom: 50px;
}

#table_member_update {
  width: 20%;
  margin: auto;
  text-align: center;
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
	<h2 class="title">회원 정보 수정</h2>
	<form action="update.do" method="post" name="frm1"
		onsubmit="return chk()">
		<input type="hidden" name="id" value="${member.m_id }">
		<input type="hidden" name="name" value="${member.m_name }">
		<table id="table_member_update">
			<tr>
				<th>아이디</th>
				<td>${member.m_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${member.m_name }</td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="password" required="required"></td>
			</tr>
			<tr>
				<th>암호 확인</th>
				<td><input type="password" name="confirmPass"
					required="required"></td>
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
					placeholder="010-1234-5678" value="${member.m_tel }"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="확인" id="submit">&nbsp<input type="reset" id="reset" value="취소"></th>			
			</tr>
		</table>
	</form>
<div class="location__button">
	<button class="location__button__list" onclick="location.href='main.do'">메인</button>
	<button class="location__button__list" onclick="location.href='mypage.do'">마이페이지</button>
</div>
</body>
</html>
