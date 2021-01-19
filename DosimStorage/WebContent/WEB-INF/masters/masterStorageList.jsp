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
	<input type="hidden" value="${br }" id="br">
	<div class="container">
		<h2>지점별 창고목록</h2>
		<p>
			지점선택
			<select onchange="sel_br(this.value)">
				<option value="0" id="op1">전체보기</option>
				<option value="1" id="op2">광화문점</option>
				<option value="2" id="op3">신사점</option>
				<option value="3" id="op4">판교점</option>
			</select>
		</p>
		<table>
	<c:if test="${empty list }">
			<tr>
				<th colspan="6">창고가 없습니다</th>
			</tr>
	</c:if>
	<c:if test="${not empty list }">
			<tr>
				<th>창고코드</th>
				<th>지점코드</th>
				<th>창고종류</th>
				<th>이용자ID</th>
				<th>대여여부</th>
				<th>사용가능</th>							
			</tr>
		<c:forEach var="order" items="${list }">
			<tr>
				<td>${order.st_code }</td>
				<td>${order.b_code }</td>
				<td>${order.s_kind }</td>
				<td>${order.borrower_id }</td>
				<td>${order.rented }</td>
				<td>${order.usable }</td>				
			</tr>
		</c:forEach>
	</c:if>
		</table>		
	</div>
	<script type="text/javascript">
		window.onpageshow = function() {
			switch(document.getElementById('br').value) {
			case "0":
				document.getElementById('op1').selected = true;
				break;
			case "1":
				document.getElementById('op2').selected = true;
				break;
			case "2":
				document.getElementById('op3').selected = true;
				break;
			default:
				document.getElementById('op4').selected = true;
			}
		}
		function sel_br(num) {
			location.href="masterStorageList.action?br="+num;
		}
	</script>
</body>
</html>