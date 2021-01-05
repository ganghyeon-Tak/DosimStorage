<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>

<title>신청하기</title>
<script type="text/javascript">
	var xhr;	// XMLHttpRequest 만들 변수
	var xhr1;	// XMLHttpRequest 만들 변수
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
	function select_storage(s_kind) {
		switch(s_kind) {
		case 'small':
			document.getElementById('select_small').checked = true;
			break;
		case 'middle':
			document.getElementById('select_middle').checked = true;
			break;
		case 'large':
			document.getElementById('select_large').checked = true;
		}		
	}
	function get_account(bank) {	// jQuery 사용하지않고 비동기 통신하는 js 코드 
		xhr = new XMLHttpRequest();
		xhr.open("post","bank.do",true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('account_no').value = xhr.responseText;
				} else {
					alert('요청오류: '+xhr.status);
				}				
			}
		}
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send("bank="+order_form.bank.value);
		
		xhr1 = new XMLHttpRequest();
		xhr1.open("post","bank1.do",true);
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr1.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('account_name').value = xhr1.responseText;
				} else {
					alert('요청오류: '+xhr1.status);
				}				
			}
		}
		xhr1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr1.send("bank="+order_form.bank.value);
	}
</script>
</head>
<body>
<div>
	<form action="order.do" method="post" name="order_form">
		<h2>지점 선택</h2>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(1)">
			<img src="images/b1.png" height="236" width="300" >
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(2)">
			<img src="images/b2.png" height="236" width="300">
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_branch(3)">
			<img src="images/b3.png" height="236" width="300">
		</button>
		<!-- 라디오버튼은 나중에 히든 처리 -->
		<input type="radio" name="branch" value="1" id="select_1">
		<input type="radio" name="branch" value="2" id="select_2">
		<input type="radio" name="branch" value="3" id="select_3">
		
		<h2>창고 종류 선택</h2>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_storage('small')">
			<img src="https://via.placeholder.com/300.png" height="236" width="300" >
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_storage('middle')">
			<img src="https://via.placeholder.com/300.png" height="236" width="300">
		</button>
		<button type="button" style="background-color: #fff; padding: 0; border: none;" onclick="select_storage('large')">
			<img src="https://via.placeholder.com/300.png" height="236" width="300">
		</button>
		<!-- 라디오버튼은 나중에 히든 처리 -->
		<input type="radio" name="storage" value="small" id="select_small">
		<input type="radio" name="storage" value="middle" id="select_middle">
		<input type="radio" name="storage" value="large" id="select_large">
		<h2>이용기간 선택</h2>
		<select name="period">
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
		<p>무통장 입금:	<select onchange="get_account(this.value)" name="bank">
							<option hidden="hidden"></option>
							<option>국민은행</option>
							<option>신한은행</option>
							<option>카카오뱅크</option>
						</select>
		</p>
		<p>계좌번호: <input type="text" readonly="readonly" id="account_no" name="account_no"></p>
		<p>예금주: <input type="text" readonly="readonly" id="account_name" name="account_name"></p>
		<p>실시간 계좌이체 및 카드결제는 준비중입니다</p>
		<button>신청하기</button>
	</form>
</div>
</body>
</html>