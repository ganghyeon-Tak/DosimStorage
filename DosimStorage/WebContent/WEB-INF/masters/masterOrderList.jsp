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
</style>
</head>
<body>
	<div class="container">
		<select name="list_opt" onchange="select_list(this.value)">			
			<option value="1" id="sel_default">전체보기</option>
			<option value="2">입금대기</option>
			<option value="3">입금완료</option>
			<option value="4">주문취소</option>
		</select>
		<div id="order_list"></div>
	</div>
	<script type="text/javascript">
		window.onpageshow = function() {
			document.getElementById('sel_default').selected = true;
			select_list("1");
		}
		function select_list(num) {
			var xhr = new XMLHttpRequest();
			xhr.open('post', 'masterSelectList.action', true);
			xhr.onload = function() {
				if (xhr.status >= 200 && xhr.status < 400) {	// https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
					document.getElementById('order_list').innerHTML = xhr.responseText;
				}
			};
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send("list_opt="+num);
		}		
	</script>
</body>
</html>