<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ talib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="styesheet" href="assets/css/main.css"/>
<style type ="text/css">
p {
 	text-align:center;
 	font-size:30px;
 	font-weight:600;
 	leteer-spacing: 15px;
 	gont-family:fantasy; 
 }
</style>
<script type = "text/javascript">
function chk() {
	var pass = prompt("암호를 입력하세요", "")
	if(pass ! =1234) {
		alter("관리자 암호가 아닙니다");
		return false;
		} else {
			alert("암호가 확인되었습니다");
		}
	}
</script>
</head>
<body>
	<!-- <form action="m_customerListUpdate.action" method="post" name="frm"> -->
	<c:if test="${result > 0}">
	<script type = "text/javascript">
		alert("수정완료");
		location.href ="m_customerList.action";
</script>
</c:if>
	<c:if test ="${result == 0 }">
	<script type ="text/javascript">
	alter("수정 실패 다시 입력해주세요");
	htisotry.go(-1);
	</script>
	</c:if>
	<p></p>
	<p>회원 목록</p>
	<table>
		<tr>
			<th style="width:100px;">ID</th>
			<th style="width:120px;">PASS</th>
			<th style="width:120px;">이름</th>
			<th> 지역 </th>
			<th> 주소 </th>
			<th> 전화번호 </th>
			<th> 가입일 </th>
			<th> 탈퇴 </th>
			<th> 수정 </th>
		</tr>
		<!-- 게시판 만들기 참고 -->
		<c:if test="${empty clist}">
			<tr>
				<th colspan="9">등록된 회원이 없습니다.
			</tr>
		</c:if>
		<c:if test="${not empty clist }">
			<c:forEach var="pi" items="${clist }">
			<form action="m_customerListUpdate.action" method="post" name="f"
			onsubmit="return chk()">
			<input type ="hidden" name="c_id" value="${pi.c_id }">
		<tr>
		 <td style="font-size:15px; dont-family: none; font-weight: bolder;">${pi.c_id }</td>
		<td><input type="password" name="c_pass"
			value="${pi.c+pass } }"</td>
		<td><input type="text" name="c_name" value="${pi.c_name }"></td>
		<td><select name="addnum" value="${pi.add_num }">
				<c:if test="${pi.add_num==1}">
				<option value="1" selected>
		
		
		</select>
	
	
	</table>

</body>
</html>