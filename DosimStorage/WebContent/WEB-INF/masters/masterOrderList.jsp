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
	button {padding: 5px}
	th, td {padding-left: 5px; padding-right: 5px}
</style>
</head>
<body>
	<input type="hidden" value="${list_opt }" id="opt">
	<input type="hidden" value="${br }" id="br">
	<div class="container">
		<p>
			조건선택
			<select id="sel_opt">			
				<option id="o_op1" value="1">전체보기</option>
				<option id="o_op2" value="2">입금대기</option>
				<option id="o_op3" value="3">입금완료</option>
				<option id="o_op4" value="4">주문취소</option>
			</select>
		</p>
		<p>
			지점선택
			<select id="sel_br">			
				<option id="b_op1" value="0">전체지점</option>
				<option id="b_op2" value="1">광화문점</option>
				<option id="b_op3" value="2">신사점</option>
				<option id="b_op4" value="3">판교점</option>
			</select>			
		</p>
		<button onclick="sel_opt_br()">조회하기</button>
		<table>
		<tr>			
			<th>주문번호</th>
			<th>회원아이디</th>
			<th>회원이름</th>			
			<th>창고코드</th>
			<th>주문액</th>
			<th>입금기한</th>
			<th>이용시작일</th>
			<th>만료일</th>
			<th>계좌번호</th>
			<th>주문상태</th>			
		</tr>
<c:if test="${empty list }">
		<tr>
			<th colspan="10">주문내역이 존재하지 않습니다</th>
		</tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="order" items="${list }">
		<tr>
			<td>${order.order_no }</td>
			<td>${order.m_id }</td>
			<td>${order.m_name }</td>
			<td>${order.st_code }</td>
			<td>${order.order_totalprice }</td>
			<td>${order.depo_duedate }</td>
			<td>${order.start_date }</td>
			<td>${order.expire_date }</td>
			<td>${order.account_no }</td>
			<td>${order.order_state }</td>
		</tr>
	</c:forEach>
		<tr>
			<th colspan="10">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${startPage-1}&br=${br}'">&lt;</button>
			</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i != currentPage }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${i}&br=${br}'">${i }</button>
					</c:if>
					<c:if test="${i == currentPage }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${i }&br=${br}'" class="active">${i }</button>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${endPage+1}&br=${br}	'">&gt;</button>
				</c:if>													
			</th>
		</tr>		
</c:if>
	</table>	
	</div>
	<script type="text/javascript">
	// 조회되고 있는 항목에 맞게 select 조정
		window.onpageshow = function(){
			switch(document.getElementById('opt').value) {
			case "1":
				document.getElementById('o_op1').selected = true;
				break;
			case "2":
				document.getElementById('o_op2').selected = true;
				break;
			case "3":
				document.getElementById('o_op3').selected = true;
				break;
			case "4":
				document.getElementById('o_op4').selected = true;
			}
			switch(document.getElementById('br').value) {
			case "0":
				document.getElementById('b_op1').selected = true;
				break;
			case "1":
				document.getElementById('b_op2').selected = true;
				break;
			case "2":
				document.getElementById('b_op3').selected = true;
				break;
			case "3":
				document.getElementById('b_op4').selected = true;
			}
		}
		function sel_opt_br() {
			var o = document.getElementById('sel_opt').value;
			var b = document.getElementById('sel_br').value;
			location.href="masterOrderList.action?list_opt="+o+"&pageNum=1&br="+b;
		}
	</script>
</body>
</html>