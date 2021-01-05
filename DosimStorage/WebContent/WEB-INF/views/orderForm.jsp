<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function select_branch(b_code) {
		switch(b_code) {
		case 1:
			document.getElementById('select_1').checked = true;
			break;
		case 2:
			document.getElementById('select_2').checked = true;
			break;
		case 3:
			document.getElementById('select_3').checked = true;
		}		
	}
</script>
</head>
<body>
<div>
	<form action="orderAction.do" method="post" name="order_frame">
		<h2>지점 선택</h2>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(1)"><img src="images/b1.png" height="236" width="300" ></button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(2)"><img src="images/b2.png" height="236" width="300"></button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(3)"><img src="images/b3.png" height="236" width="300"></button>
		<!-- 라디오버튼은 나중에 히든 처리 -->
		<input type="radio" name="select_br" value="1" id="select_1">
		<input type="radio" name="select_br" value="2" id="select_2">
		<input type="radio" name="select_br" value="3" id="select_3">
		
		<h2>창고 종류 선택</h2>
		
	</form>
</div>
</body>
</html>