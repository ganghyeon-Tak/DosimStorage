<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>

<title>신청하기</title>


<script type="text/javascript" src="js/order.js"></script>
</head>
<body>
<!-- 매진된 창고-지점 표시. 나중에 히든처리 -->
<input type="text" readonly="readonly" id="soldout">
<div>	
	<form action="order.do" method="post" name="order_form">
		<h2>지점 선택</h2>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(1)" ondrag="select_branch(1)">
			<img src="images/b1.png" height="236" width="300" >
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(2)" ondrag="select_branch(2)">
			<img src="images/b2.png" height="236" width="300">
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(3)" ondrag="select_branch(3)">
			<img src="images/b3.png" height="236" width="300">
		</button>
		<!-- 라디오버튼은 나중에 히든 처리 -->
		<input type="radio" name="branch" value="1" id="select_1" required="required">
		<input type="radio" name="branch" value="2" id="select_2" required="required">
		<input type="radio" name="branch" value="3" id="select_3" required="required">
		
		<h2>창고 종류 선택</h2>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_storage('small')" ondrag="select_storage('small')">
			<img id="st_button1" src="images/s1.png" width="270" >
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_storage('medium')" ondrag="select_storage('medium')">
			<img id="st_button2" src="images/s2.png" width="300">
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_storage('large')" ondrag="select_storage('large')">
			<img id="st_button3" src="images/s3.png" width="330">
		</button>
		<!-- 라디오버튼은 나중에 히든 처리 -->
		<input type="radio"  name="storage" value="small" id="select_small" required="required">
		<input type="radio" name="storage" value="medium" id="select_medium" required="required">
		<input type="radio" name="storage" value="large" id="select_large" required="required">
		<h2>이용시작일 선택</h2>
		<p>서비스 이용시작일은 일주일 이내까지 선택가능합니다</p>
		<input type="date" name="hope_date" id="hope_date" required="required" onchange="date_chk(this.value)">
		<h2>이용기간 선택</h2>
		<select name="period" required="required" disabled="disabled" onchange="total_price(this.value)">
			<option hidden="hidden" id="peri_novalue"></option>
			<option value="1"> 1 개월</option>
			<option value="2"> 2 개월</option>
			<option value="3"> 3 개월</option>
			<option value="4"> 4 개월</option>
			<option value="5"> 5 개월</option>
			<option value="6"> 6 개월</option>
			<option value="7"> 7 개월</option>
			<option value="8"> 8 개월</option>
			<option value="9"> 9 개월</option>
			<option value="10">10 개월</option>
			<option value="11">11 개월</option>
			<option value="12">12 개월</option>
		</select>
		<h2>결제방법</h2>
		<p>금액 <input type="text" id="tot_price" readonly="readonly" name="tot_price" hidden="hidden">
		<input type="text" id="tot_comma" readonly="readonly">
		</p>
		<p>무통장 입금:	<select onchange="get_account(this.value)" name="bank" required="required">
							<option hidden="hidden"></option>
							<option>국민은행</option>
							<option>신한은행</option>
							<option>카카오뱅크</option>
						</select>
		</p>
		<p>계좌번호 <input type="text" readonly="readonly" id="account_no" name="account_no"></p>
		<p>예금주 <input type="text" readonly="readonly" id="account_name" name="account_name"></p>
		<p>실시간 계좌이체 및 카드결제는 준비중입니다</p>
		<button>신청하기</button>
	</form>
</div>
</body>
</html>