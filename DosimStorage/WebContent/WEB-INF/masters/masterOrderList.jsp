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
</style>
</head>
<body>
	<div class="container">
		<select name="list_opt" onchange="sel_opt(this.value)">			
			<option value="1" id="sel_default">전체보기</option>
			<option value="2">입금대기</option>
			<option value="3">입금완료</option>
			<option value="4">주문취소</option>
		</select>
		<table>
		<tr>			
			<th>주문번호</th>
			<th>회원아이디</th>
			<th>회원이름</th>			
			<th>창고코드</th>
			<th>주문액</th>
			<th>입금기한</th>
			<th>계좌번호</th>
			<th>주문상태</th>			
		</tr>
<c:if test="${empty list }">
		<tr>
			<th colspan="8">주문내역이 존재하지 않습니다</th>
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
			<td>${order.account_no }</td>
			<td>${order.order_state }</td>
		</tr>
	</c:forEach>
		<tr>
			<th colspan="8">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${startPage-1}'">&lt;</button>
			</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i != currentPage }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${i}'">${i }</button>
					</c:if>
					<c:if test="${i == currentPage }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${i }'" class="active">${i }</button>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
				<button onclick="location.href='masterOrderList.action?list_opt=${list_opt }&pageNum=${endPage+1}'">&gt;</button>
				</c:if>													
			</th>
		</tr>		
</c:if>
	</table>	
	</div>
	<script type="text/javascript">
		function sel_opt(num) {
			location.href="masterOrderList.action?list_opt="+num+"&pageNum=1";
		}
	</script>
</body>
</html>