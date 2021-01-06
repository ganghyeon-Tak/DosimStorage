<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">
p {
	text-align: center;
	font-size: 30px;
	font-weight: 600;
	letter-spacing: 15px;
	font-family: fantasy;
}

</style>
<script type="text/javascript">
	function chk() {
		var pass = prompt("암호를 입력하세요", "")
		if (pass != 1234) {
			alert("관리자 암호가 아닙니다");
			return false;
		} else {
			alert("암호 확인되었습니다");
		}
	}
</script>
</head>
<body>
	<!-- <form action="m_customerListUpdate.action" method="post" name="frm" > -->
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("수정 완료");
			location.href = "m_customerList.action";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("수정 실패 다시 입력해주세요");
			history.go(-1);
		</script>
	</c:if>
	<p></p>
	<p>회원목록조회</p>
	<!-- 누적이용일을 만들 고 싶었으나.... 실력밖의 일이였음 -->
	<table>
		<tr>
			<th style="width: 100px;">ID</th>
			<th style="width: 120px;">Pass</th>
			<th style="width: 120px;">이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>회원가입일</th>
			<th>탈퇴</th>
			<th>수정</th>
		</tr>
		<!-- 게시판 만들기 참고 -->
		<c:if test="${empty clist}">
			<tr>
				<th colspan="9">등록된 회원이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty clist }">
			<c:forEach var="pi" items="${clist }">
				<form action="m_customerListUpdate.action" method="post" name="f"
					onsubmit="return chk()">
					<input type="hidden" name="c_id" value="${pi.c_id }">
					<tr>
						<td style="font-size: 15px;font-family: none;font-weight: bolder;">${pi.c_id}</td>
						<td><input type="password" name="c_pass"
							value="${pi.c_pass }"></td>
						<td><input type="text" name="c_name" value="${pi.c_name }"></td>
						<td><input type="email" name="c_email" value="${pi.c_email }"></td>
						<td><input type="tel" name="c_tel" value="${pi.c_tel }"
							pattern="\d{3}-\d{3,4}-\d{4}" title="전화번호 형식 xxx-xxxx-xxxx-"></td>
						<td>${pi.joindate}</td>
					
						<td><select name="del" value="${pi.del }">
								<c:if test="${pi.del=='n' }">
									<option selected>n</option>
								</c:if>
								<c:if test="${pi.del!='n' }">
									<option>n</option>
								</c:if>
								<c:if test="${pi.del=='y' }">
									<option selected>y</option>
								</c:if>
								<c:if test="${pi.del!='y' }">
									<option>y</option>
								</c:if>
						</select></td>
						<td><input type="submit" value="수정"></td>
					</tr>
				</form>
				<!-- ID, 가입일 : 수정 불가 (INPUT X) -->
				<!-- PASS : TYPE="PASSWORD" 사용, 수정 가능 -->
				<!-- 지역, 탈퇴 SELECT 활용 -->
				<!-- 이름, 주소, 전화번호 : TYPE="TEXT" 사용, 수정가능 -->
				<!-- 수정 : TYPE="BUTTON" => m_CustomerUpdate.action 사용 -->
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="9" align="center">
				<button style="font-size: 14px;" onclick="location.href='m_main.action'">메인으로</button>
			</td>
		</tr>
	</table>
	<!-- </form> -->
</body>
</html>