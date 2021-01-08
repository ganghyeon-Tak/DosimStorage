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
<script type="text/javascript" src="/jura2/js/jquery.js"></script>
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
	<p>${shop.s_name }서비스관리</p>
	<table>
		<tr>
			<th>서비스이미지</th>
			<th>메뉴명</th>
			<th>사이즈</th>
			<th>가격</th>
			<th>추천여부</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<th colspan="9">등록된 서비스가 없습니다</th>
			</tr>
		</c:if>

		<c:if test="${not empty list }">
			<form action="m_menuUpdate.action?" method="post" name="f"
				enctype="multipart/form-data" onsubmit="return chk()">
				<c:forEach var="pi" items="${list }" varStatus="sta">
					<input type="hidden" name="s_id${sta.index }" value="${pi.s_id }">
					<input type="hidden" name="m_num${sta.index }" value="${pi.m_num }">

					<!-- 게시판 만들기 참고 -->
					<!-- ID : 수정 불가 (INPUT X) -->
					<!-- 서비스명, 가격 : TYPE="TEXT" 사용, 수정가능 -->
					<!-- 서비스사진 : 첨부파일 사용 -->
					<!-- 추천여부 : radio 사용 -->
					<!-- 수정 : TYPE="BUTTON" => m_ShopUpdate.action 사용 -->
					<tr>
						<td><input type="button" value="${pi.s_id }"></td>
						<td><input type="button" value="${pi.m_num }"></td>
						<td><input type="text" name="m_name${sta.index }"
							value="${pi.m_name }"></td>
						<td><input type="number" name="m_price${sta.index }"
							value="${pi.m_price }"></td>
						<td>
							<div class="filebox" style="display: table;">
							<label for="m_img">업로드</label>
							<input type="file" id="m_img" name="m_img${sta.index }" value="${pi.m_img }">
							</div>
						</td>
						<td><c:if test="${pi.rec_menu=='y' }">
								<input type="radio" name="rec_menu" value="${sta.index }"
									class="check_class" checked="checked">
							</c:if> <c:if test="${pi.rec_menu=='n' }">
								<input type="radio" name="rec_menu" value="${sta.index }"
									class="check_class">
							</c:if></td>
						<td><input type="submit" name="action" value="수정${sta.index }"></td>
						<td><input type="button" value="삭제" onclick="location.href='m_menuDelete.action?m_num=${pi.m_num}&s_id=${pi.s_id}'"></td>
					</tr>
				</c:forEach>
			</form>
		</c:if>
		<tr>
			<td colspan="8">
				<button onclick="location.href='m_insertForm.action?s_id=${sid}'">서비스추가</button>
				<button onclick="location.href='m_main.action'">메인으로</button>
			</td>
		</tr>
	</table>
	<!-- m_insertForm.action으로 연결 -->
</body>
</html>