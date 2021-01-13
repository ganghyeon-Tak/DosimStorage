<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 다릅니다");
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	}
</script></head><body>

<h2>게시글 삭제</h2>
<form action="delete.do" name="frm" onsubmit="return chk()">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="password2" 
		value="${board.password}">
<table>
	<tr><th>암호</th><td><input type="password" name="password"
		required="required" autofocus="autofocus"></td></tr>
	<tr><th colspan="2"><input type="submit"></th></tr>
</table>
</form>
</body>
</html>