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
		<h2>개방가능한 창고 목록</h2>
		<p>현재 폐쇄중이거나, 오류로 닫히거나, 만료 후 오픈준비중인 창고를 표시합니다</p>
		<form action="openStorage.action" method="post" onsubmit="return chk();">
		<p>여러 건을 오픈하실 때는 체크 후 하단 버튼을,</p>
		<p>하나만 오픈하실 때는 해당 창고 옆 버튼을 눌러주세요.</p>
			<table>
				<tr>
					<td>all<input type="checkbox" id="all_check" onchange="checking()"></td>
					<th>창고코드</th>
					<th>지점코드</th>
					<th>창고종류</th>
					<th>이용자ID</th>
					<th>대여여부</th>
					<th>사용가능</th>
					<th>개방처리</th>
				</tr>
	<c:if test="${empty list }">
				<tr>
					<th colspan="8">개방가능한 창고가 없습니다</th>
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
						<button type="button" onclick="location.href='openStorage.action?st_code=${storage.st_code}'">개방</button>
					</td>
				</tr>
		</c:forEach>
				<tr>
					<th colspan="8"><button>선택한 창고 개방</button></th>
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
		function checking() {
			if (document.getElementById('all_check').checked == true) {
				var check_list = document.getElementsByName('st_code_list');
				for (var i in check_list) {
					check_list[i].checked = true;
				}
			} else {
				var check_list = document.getElementsByName('st_code_list');
				for (var i in check_list) {
					check_list[i].checked = false;
				}
			}
		}
	</script>
</body>
</html>