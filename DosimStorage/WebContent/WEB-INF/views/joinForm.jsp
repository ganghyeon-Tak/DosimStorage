<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#table_member_join {
  width: 800px;  
  text-align: center;
  position: relative;
  left: 50%;
  transform: translate(-25%, 0%);  
}
th {width: 90px}
td {text-align: left;}
#join_submit {margin-left: 148px}
#chk {padding: 3px 8px}
.submit, #chk {
  background-color: transparent;
  cursor: pointer;
  border: none;
  outline: none;
  color: #1C2120;
  padding: 3px 8px;
  font-size: 15px;
  margin: 2px;  
  border: 1px solid #1C2120;
  border-radius: 5px;
  font-family: 'Noto Serif KR', serif;
  text-align: center;
}

#submit:hover, #chk:hover {
  background-color: #DF964A;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.m_pw.value != frm.m_pwConfirm.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.m_pw.focus();
			frm.m_pw.value = "";
			frm.m_pwConfirm.value = "";
			return false;
		}
	}
	function idChk() {
		if (!frm.m_id.value) {
			alert("아이디 입력한 후에 체크하세요");
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
<h2 class="title">회원가입</h2>
<form action="join.do" method="post" name="frm" 
	onsubmit="return chk()">
<table id=table_member_join>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="m_id" required="required" autofocus="autofocus">
			<input type="button" id="chk" value="중복확인" onclick="idChk()">
			<span id="err"></span>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="m_name"
		required="required"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="m_pw"
		required="required"></td>
	</tr>
	<tr>
		<th>암호 확인</th>
		<td><input type="password" name="m_pwConfirm"
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
		<td id="submit_row" colspan="2">
			<input type="submit" class="submit" id="join_submit" value="가입"><button type="button" class="submit" onclick="location.href='main.do'">메인</button>
		</td>			
	</tr>
</table>
</form>
</body>
</html>
