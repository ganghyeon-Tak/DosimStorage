<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
	
	.inner_container {
		margin: 0 auto;
		width: fit-content;		
	}
	h2 {margin: 10px; padding: 10px}
	p {padding: 5px}
	table * {
		text-align: left;
		margin: 0; padding: 5px
	}
	#submit {  
		background-color: transparent;
  		cursor: pointer;
  		border: none;
  		outline: none;
  		color: #1C2120;
  		font-size: 15px;
  		margin: 5px;
  		padding: 6px 8px;
  		border: 1px solid #1C2120;
  		border-radius: 5px;
  		font-family: 'Noto Serif KR', serif;
	}
	#submit:hover {background-color: #DF964A;}
	.buttons {
		background-color: transparent;
		padding: 0;
		border: 0;		
	}
</style>

<title>신청하기</title>
</head>
<body>
<div class="container">
<!-- 매진된 창고-지점 표시(hidden) -->
<input type="text" readonly="readonly" id="soldout" style="width: 70%" hidden="hidden">	
	<form action="order.do" method="post" name="order_form">
	<!-- 창고선택과 이용기간선택이 끝나면 총 금액 계산값 가져오는 곳(hidden) -->	
	<input type="text" id="tot_price" readonly="readonly" name="tot_price" hidden="hidden">
		<div class="inner_container">
			<h2>지점 선택</h2>
			<!-- 라디오버튼 조작하는 스위치버튼 -->		
			<button type="button" class="buttons" onclick="select_branch(1)" ondrag="select_branch(1)" >
				<img id="br_button1" src="images/b1.png" width="300">
			</button>
			<button type="button" class="buttons" onclick="select_branch(2)" ondrag="select_branch(2)">
				<img id="br_button2" src="images/b2.png" width="300">
			</button>
			<button type="button" class="buttons" onclick="select_branch(3)" ondrag="select_branch(3)">
				<img id="br_button3" src="images/b3.png" width="300">
			</button>
			<!-- 실제 데이터 전달하는 라디오버튼(hidden) -->
			<input type="radio" name="branch" value="1" id="select_1" required="required" hidden="hidden">
			<input type="radio" name="branch" value="2" id="select_2" required="required" hidden="hidden">
			<input type="radio" name="branch" value="3" id="select_3" required="required" hidden="hidden">		
			<h2>창고 종류 선택</h2>
			<!-- 라디오버튼 조작하는 스위치버튼 -->
			<button type="button" class="buttons" onclick="select_storage('small')" ondrag="select_storage('small')">
				<img id="st_button1" src="images/s1.png" width="300">
			</button>
			<button type="button" class="buttons" onclick="select_storage('medium')" ondrag="select_storage('medium')">
				<img id="st_button2" src="images/s2.png" width="300">
			</button>
			<button type="button" class="buttons" onclick="select_storage('large')" ondrag="select_storage('large')">
				<img id="st_button3" src="images/s3.png" width="300">
			</button>
			<!-- 실제 데이터 전달하는 라디오버튼(hidden) -->		
			<input type="radio"  name="storage" value="small" id="select_small" required="required" hidden="hidden">
			<input type="radio" name="storage" value="medium" id="select_medium" required="required" hidden="hidden">
			<input type="radio" name="storage" value="large" id="select_large" required="required" hidden="hidden">
			<table>
				<tr>
					<td colspan="2"><h2>이용시작일 선택</h2></td>
				</tr>
				<tr>
					<td colspan="2"><p>서비스 이용시작일은 일주일 이내까지 선택가능합니다</p></td>
				</tr>
				<tr>
					<td colspan="2"><input type="date" name="hope_date" id="hope_date" required="required" onchange="date_chk(this.value)"></td>
				</tr>
				<tr>
					<td colspan="2"><h2>이용기간 선택</h2></td>
				</tr>
				<tr>
					<td colspan="2">
						<select name="period" required="required" disabled="disabled" onchange="total_price(this.value)">
							<option hidden="hidden" id="peri_novalue"></option>	<!-- 선택안했을시 required에 걸리게 만들기 위한 옵션 -->
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
					</td>
				</tr>
				<tr>
					<td colspan="2"><h2>결제방법</h2></td>
				</tr>
				<tr>
					<td>금액</td>
					<!-- 총 금액에 콤마와 원 붙여 표시 -->
					<td><input type="text" id="tot_comma" readonly="readonly"></td>
				</tr>				
				<tr>
					<td>무통장 입금</td>
					<td><select onchange="get_account(this.value)" name="bank" required="required">
							<option id="bank" hidden="hidden"></option> <!-- 선택안했을시 required에 걸리게 만들기 위한 옵션 -->
							<option>국민은행</option>
							<option>신한은행</option>
							<option>카카오뱅크</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>계좌번호</td>
					<td><input type="text" readonly="readonly" id="account_no" name="account_no"></td>
				</tr>
				<tr>
					<td>예금주</td>
					<td><input type="text" readonly="readonly" id="account_name" name="account_name"></td>
				</tr>
				<tr>
					<td colspan="2">실시간 계좌이체 및 카드결제는 준비중입니다</td>				
				</tr>
				<tr>
					<td colspan="2">						
						<button id="submit">신청하기</button>
						<!-- <input type="submit" id="submit" value="매진테스트(9회주문)" onclick="javascript: form.action='soldoutTest.do'"> -->
					</td>				
			</table>	
		</div>
	</form>
</div>
<!-- javascript -->
<script type="text/javascript" src="js/order.js"></script>
</body>
</html>
