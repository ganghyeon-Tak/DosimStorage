<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

.filebox label {
    display: inline-block;
    padding: 1em .5em .9em .75em;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    margin: 0 auto;
    border: 0;
    border-radius: 4px;
    white-space: nowrap;
    letter-spacing: 0.2em;
    box-shadow: inset 0 0 0 2px #585858;
}
.filebox:hover{
	color: #f2849e !important;
	box-shadow: inset 0 0 0 2px #f2849e;
	border-radius: 4px;
}
.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
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
	<p></p>
	<p>지점목록</p>

	<table>
		<tr>
			<th style="width: 100px;">지점코드</th>
			<th style="width: 150px;">지점명</th>
			<th style="width: 450px;">주소</th>
			<th style="width: 170px;">전화번호</th>
			<th style="width: 120px">이미지</th>
			<th>탈퇴여부</th>
			<th>수정</th>
		</tr>
		<c:if test="${empty slist}">
			<tr>
				<th colspan="9">등록된 식당이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty slist }">
			<c:forEach var="pi" items="${slist }">
				<form action="m_shopListUpdate.action" method="post" name="f"
					enctype="multipart/form-data" onsubmit="return chk()">
					<input type="hidden" name="s_id" value="${pi.s_id }">
					<%-- <input type="hidden" name="size" value="${fn:length(slist)}"> --%>
					<tr>
						<td><input type="button"
							onclick="location.href='m_menu.action?s_id=${pi.s_id}'"
							value="${pi.s_id}"></td>
						<td><input type="text" name="s_name" value="${pi.s_name }"></td>
						<td><input type="text" name="s_address" value="${pi.s_add }"></td>
						<td><input type="tel" name="s_tel" value="${pi.s_tel }"
							pattern="\d{2,3,4}-\d{3,4}-\d{4}" title="전화번호 형식 xxx-xxxx-xxxx-"></td>
						<td>
							<div class="filebox" style="display: table;">
								<label for="s_img">업로드</label> <input type="file" name="s_img"
									id="s_img">
							</div>
						</td>
						<td><select name="s_del" value="${pi.s_del }">
								<c:if test="${pi.s_del=='n' }">
									<option selected>n</option>
								</c:if>
								<c:if test="${pi.s_del!='n' }">
									<option>n</option>
								</c:if>
								<c:if test="${pi.s_del=='y' }">
									<option selected>y</option>
								</c:if>
								<c:if test="${pi.s_del!='y' }">
									<option>y</option>
								</c:if>
						</select></td>
						<td><input type="submit" value="수정"></td>
					</tr>
				</form>
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="10" align="center">
				<button style="margin-right: 7px; font-size: 14px;"
					onclick="location.href='m_shopJoinForm.action'">지점추가</button>
				<button style="font-size: 14px;"
					onclick="location.href='m_main.action'">메인으로</button>
			</td>
		</tr>
	</table>
	<!-- m_shopJoinForm.action으로 연결 -->
</body>
</html>