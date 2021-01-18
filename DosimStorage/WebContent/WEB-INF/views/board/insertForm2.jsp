<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호확인이 다릅니다.");
			frm.password.focus();
			frm.password.value = "";
			return false;
	}
}
</script>
</head>
<body>
<div id="list">
<h2>게시글 작성</h2>
<form action="insert2.bo" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="id" value="${member.m_id }">
<table class="list_table">
<%-- <c:if test="${board2.num == 0}"> --%>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject"
			required="required" autofocus="autofocus"></td>
	</tr>	
<%-- </c:if> --%>
<!-- 주석 친 부분이 구현이 덜 됐습니다 -->
<%-- <c:if test="${board2.num != 0 }">
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject"
			required="required" autofocus="autofocus" value="답변=>"></td>
	</tr>	
</c:if> --%>
	<tr>
		<th>작성자</th>
		<td>${member.m_name }</td>
	</tr>	
	<tr>
		<th>이메일</th>
		<td>${member.m_email }</td>
	</tr>	
	<tr>
		<th>암호</th>
		<td><input type="password" name="password"
			required="required"></td>
	</tr>	
	<tr>
		<th>암호확인</th>
		<td><input type="password" name="confirmPass"
			required="required"></td>
	</tr>	
	<tr>
		<th>내용</th>
		<td><textarea rows="5" cols="40"
		 name="content"	required="required"></textarea></td>
	</tr>	
	<tr>
		<th colspan="2"><input type="submit"></th>
	</tr>
</table>
</div>
</body>
</html>