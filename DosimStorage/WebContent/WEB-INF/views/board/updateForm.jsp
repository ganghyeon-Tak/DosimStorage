<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 달라서 수정할 수 없습니다");
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	}
</script></head><body>

<h2>게시판 수정</h2>
<form action="update.do" method="post" name="frm" 
	onsubmit="return chk()">
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="password2" value="${board.password}">
<table><tr><th>제목</th><td><input type="text" name="subject" 
		required="required" autofocus="autofocus"
		value="${board.subject}"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="writer"
		required="required" value="${board.writer}"></td></tr>
	<tr><th>이메일</th><td><input type="email" name="email"
		required="required" value="${board.email}"></td></tr>
	<tr><th>암호</th><td><input type="password" name="password"
		required="required"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" 
		name="content" required="required" >${content}</textarea></td></tr>
	<tr><th colspan="2"><input type="submit"></th></tr>

</table>
</form>
</body>
</html>