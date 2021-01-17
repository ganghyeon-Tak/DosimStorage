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
		<h2>요청주문취소</h2>
		<p>유저가 1:1문의로 취소요청한 주문을 처리합니다</p>
		<form action="userCancel.action" method="post">
		<input type="text" pattern="\d{12}" name="order_no" required="required" maxlength="12" title="주문번호는 공백 없는 12자리 숫자입니다">
		<div id="input_box"></div>		
		<input type="button" value="입력창 추가" onclick="add_item()">
		<br><br>
		<button>주문취소</button>
		</form>
	</div>
	<div id="pre_set" style="display:none">
		<input type="text" pattern="\d{12}" name="order_no" required="required" maxlength="12" title="주문번호는 공백 없는 12자리 숫자입니다">
		<input type="button" value="삭제" onclick="remove_item(this)">
	</div> 
	<script>
     function add_item(){
          // pre_set 에 있는 내용을 읽어와서 처리..
          var div = document.createElement('div');
          div.innerHTML = document.getElementById('pre_set').innerHTML;
          document.getElementById('input_box').appendChild(div);
     }
     function remove_item(obj){
          // obj.parentNode 를 이용하여 삭제
          document.getElementById('input_box').removeChild(obj.parentNode);
     }
</script>
 


</body>
</html>