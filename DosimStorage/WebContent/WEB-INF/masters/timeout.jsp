<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="m_sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("m_common.css");
	th, td {padding-left: 5px; padding-right: 5px}
</style>
</head>
<body>
<input type="hidden" value="${br }" id="br">
	<div class="container">
		<h2>입금기한 초과 주문건</h2>
		<p>입금기한을 넘긴 주문을 취소시킬 수 있습니다</p>
		<p>지점선택</p>
		<select onchange="sel_br(this.value)">
			<option value="0" id="op1">전체</option>
			<option value="1" id="op2">광화문점</option>
			<option value="2" id="op3">신사점</option>
			<option value="3" id="op4">판교점</option>
		</select>
		<form method="post" action="orderCancel.action">
			<table>
				<tr>
					<td>all<input type="checkbox" id="all_check" onchange="checking()"></td>
					<th>주문번호</th>
					<th>회원아이디</th>
					<th>회원이름</th>			
					<th>창고코드</th>
					<th>주문액</th>
					<th>입금기한</th>
					<th>계좌번호</th>
					<th>주문상태</th>
					<th>취소처리</th>
				</tr>
	<c:if test="${empty timeoutList }">
				<tr>
					<td colspan="10">해당 내역이 없습니다</td>
				</tr>
	</c:if>
	<c:if test="${not empty timeoutList }">
		<c:forEach var="order" items="${timeoutList }">
				<tr>
					<td><input type="checkbox" name="timeout_list" value="${order.order_no }"></td>
					<td>${order.order_no }</td>
					<td>${order.m_id }</td>
					<td>${order.m_name }</td>
					<td>${order.st_code }</td>
					<td>${order.order_totalprice }</td>
					<td>${order.depo_duedate }</td>
					<td>${order.account_no }</td>
					<td>${order.order_state }</td>
					<td><button type="button" onclick="location.href='orderCancel.action?order_no=${order.order_no }'">주문취소</button></td>
				</tr>
		</c:forEach>
				<tr>
					<td colspan="10"><button>선택항목 주문취소</button></td>
				</tr>
	</c:if>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		window.onpageshow = function(){
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
			case "3":
				document.getElementById('op4').selected = true;
			}
		}
		function sel_br(br) {
			location.href="timeout.action?br="+br;
		}
		function checking() {
			if (document.getElementById('all_check').checked == true) {
				var check_list = document.getElementsByName('timeout_list');
				for (var i in check_list) {
					check_list[i].checked = true;
				}
			} else {
				var check_list = document.getElementsByName('timeout_list');
				for (var i in check_list) {
					check_list[i].checked = false;
				}
			}
		}
	</script>
</body>
</html>