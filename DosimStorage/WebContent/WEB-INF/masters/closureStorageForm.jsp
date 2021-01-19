<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="m_sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("m_common.css");
</style>
</head>
<body>
	<div class="container">
		<h2>폐쇄가능한 창고 목록</h2>
		<p>현재 대여중이거나, 주문 후 입금대기중인 창고는 표시되지 않습니다</p>
		<form action="closureStorage.action" method="post" onsubmit="return chk();">
		<p>여러 건을 폐쇄하실 때는 체크 후 하단 버튼을,</p>
		<p>하나만 폐쇄하실 때는 해당 창고 옆 버튼을 눌러주세요.</p>
			<table>
				<tr>
					<th></th>
					<th>창고코드</th>
					<th>지점코드</th>
					<th>창고종류</th>
					<th>이용자ID</th>
					<th>대여여부</th>
					<th>사용가능</th>
					<th>폐쇄처리</th>
				</tr>
	<c:if test="${empty list }">
				<tr>
					<th colspan="8">폐쇄가능한 창고가 없습니다</th>
				</tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="storage" items="${list }">
				<tr>
					<td><input type="checkbox" name="st_code_list" value="${storage.st_code}"></td>
					<td>${storage.st_code }</td>
					<td>${storage.b_code }</td>
					<td>${storage.s_kind }</td>
					<td>${storage.borrower_id }</td>
					<td>${storage.rented }</td>
					<td>${storage.usable }</td>
					<td>
						<button type="button" onclick="location.href='closureStorage.action?st_code=${storage.st_code}'">폐쇄</button>
					</td>
				</tr>
		</c:forEach>
				<tr>
					<th colspan="8"><button>선택한 창고 폐쇄</button></th>
	</c:if>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function chk() {
			var check_boxes = document.getElementsByName('st_code_list');
			var cnt = 0;
			for (var i in check_boxes) {
				if (check_boxes[i].checked) {
					cnt++;
				}
			}
			if (cnt == 0) {
				alert('하나 이상 체크해 주세요');
				return false;
			}
		}
	</script>
</body>
</html>