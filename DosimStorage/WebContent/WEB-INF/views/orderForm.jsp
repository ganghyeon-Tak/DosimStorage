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


<script type="text/javascript">
	var xhr, xhr1, xhr2;	// XMLHttpRequest 생성에 쓸 변수
	window.onload = function() {
		xhr2 = new XMLHttpRequest();
		xhr2.open("get","stockCheck.do",true);	// 매진여부 체크
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4) {	// readyState : 0-XMLHttpRequest객채생성, 1-open메소드 실행, 2-요청 응답 도착 3-요청데이터 처리중 4-응답준비완료
				if (xhr2.status == 200) {	// status : https://developer.mozilla.org/en-US/docs/Web/HTTP/Status 참고
					document.getElementById('soldout').value = xhr2.responseText;
				} else {
					alert('요청오류: '+xhr2.status);
				}				
			}
		}		
		xhr2.send(null);
	}	
	
	function select_branch(b_code) {
		switch(b_code) {
		case 1:	// 광화문점을 선택했을 때
			document.getElementById('select_1').checked = true;							// 광화문점 라디오버튼 체크
			if (document.getElementById('soldout').value.includes("small"+b_code)) {// 광화문 s창고 매진이면
				document.getElementById('select_small').disabled = true;				// s창고 라디오버튼 사용불가
				document.getElementById('select_small').checked = false;				// s창고 라디오버튼 체크해제
				document.getElementById('st_button1').src = "images/ss1.png";			// s창고 버튼 매진표시
			} else {																// 광화문 s창고 매진아니면
				document.getElementById('select_small').disabled = false;				// s창고 라디오버튼 사용가능
				document.getElementById('st_button1').src = "images/s1.png";			// s창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("medium"+b_code)) {// 광화문 m창고 매진이면
				document.getElementById('select_medium').disabled = true;				// m창고 라디오버튼 사용불가
				document.getElementById('select_medium').checked = false;				// m창고 라디오버튼 체크해제
				document.getElementById('st_button2').src = "images/ss2.png";			// m창고 버튼 매진표시
			} else {																// 광화문 m창고 매진아니면
				document.getElementById('select_medium').disabled = false;				// m창고 라디오버튼 사용가능		
				document.getElementById('st_button2').src = "images/s2.png";			// m창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("large"+b_code)) {// 광화문 l창고 매진이면
				document.getElementById('select_large').disabled = true;				// l창고 라디오버튼 사용불가
				document.getElementById('select_large').checked = false;				// l창고 라디오버튼 체크해제
				document.getElementById('st_button3').src = "images/ss3.png";			// l창고 버튼 매진표시
			} else {																// 광화문 l창고 매진아니면
				document.getElementById('select_large').disabled = false;				// l창고 라디오버튼 사용가능
				document.getElementById('st_button3').src = "images/s3.png";			// l창고 정상버튼 표시
			}
			period();
			break;
		case 2:	// 신사점을 선택했을 때
			document.getElementById('select_2').checked = true;							// 신사점 라디오버튼 체크
			if (document.getElementById('soldout').value.includes("small"+b_code)) {// 신사 s창고 매진이면
				document.getElementById('select_small').disabled = true;				// s창고 라디오버튼 사용불가
				document.getElementById('select_small').checked = false;				// s창고 라디오버튼 체크해제
				document.getElementById('st_button1').src = "images/ss1.png";			// s창고 버튼 매진표시
			} else {																// 신사 s창고 매진아니면
				document.getElementById('select_small').disabled = false;				// s창고 라디오버튼 사용가능
				document.getElementById('st_button1').src = "images/s1.png";			// s창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("medium"+b_code)) {// 신사 m창고 매진이면
				document.getElementById('select_medium').disabled = true;				// m창고 라디오버튼 사용불가
				document.getElementById('select_medium').checked = false;				// m창고 라디오버튼 체크해제
				document.getElementById('st_button2').src = "images/ss2.png";			// m창고 버튼 매진표시
			} else {																// 신사 m창고 매진아니면
				document.getElementById('select_medium').disabled = false;				// m창고 라디오버튼 사용가능		
				document.getElementById('st_button2').src = "images/s2.png";			// m창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("large"+b_code)) {// 신사 l창고 매진이면
				document.getElementById('select_large').disabled = true;				// l창고 라디오버튼 사용불가
				document.getElementById('select_large').checked = false;				// l창고 라디오버튼 체크해제
				document.getElementById('st_button3').src = "images/ss3.png";			// l창고 버튼 매진표시
			} else {																// 신사 l창고 매진아니면
				document.getElementById('select_large').disabled = false;				// l창고 라디오버튼 사용가능
				document.getElementById('st_button3').src = "images/s3.png";			// l창고 정상버튼 표시
			}
			period();
			break;
		case 3:	// 판교점을 선택했을 때
			document.getElementById('select_3').checked = true;							// 판교점 라디오버튼 체크
			if (document.getElementById('soldout').value.includes("small"+b_code)) {// 판교 s창고 매진이면
				document.getElementById('select_small').disabled = true;				// s창고 라디오버튼 사용불가
				document.getElementById('select_small').checked = false;				// s창고 라디오버튼 체크해제
				document.getElementById('st_button1').src = "images/ss1.png";			// s창고 버튼 매진표시
			} else {																// 판교 s창고 매진아니면
				document.getElementById('select_small').disabled = false;				// s창고 라디오버튼 사용가능
				document.getElementById('st_button1').src = "images/s1.png";			// s창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("medium"+b_code)) {// 판교 m창고 매진이면
				document.getElementById('select_medium').disabled = true;				// m창고 라디오버튼 사용불가
				document.getElementById('select_medium').checked = false;				// m창고 라디오버튼 체크해제
				document.getElementById('st_button2').src = "images/ss2.png";			// m창고 버튼 매진표시
			} else {																// 판교 m창고 매진아니면
				document.getElementById('select_medium').disabled = false;				// m창고 라디오버튼 사용가능		
				document.getElementById('st_button2').src = "images/s2.png";			// m창고 정상버튼 표시
			}
			if (document.getElementById('soldout').value.includes("large"+b_code)) {// 판교 l창고 매진이면
				document.getElementById('select_large').disabled = true;				// l창고 라디오버튼 사용불가
				document.getElementById('select_large').checked = false;				// l창고 라디오버튼 체크해제
				document.getElementById('st_button3').src = "images/ss3.png";			// l창고 버튼 매진표시
			} else {																// 판교 l창고 매진아니면
				document.getElementById('select_large').disabled = false;				// l창고 라디오버튼 사용가능
				document.getElementById('st_button3').src = "images/s3.png";			// l창고 정상버튼 표시
			}
			period();
		}		
	}
	function select_storage(s_kind) {
		switch(s_kind) {
		case 'small':	// s창고 선택했을 때
			if (document.getElementById('select_small').disabled == false) {	// 해당 지점 s창고 매진아니면
			document.getElementById('select_small').checked = true;				// 라디오버튼 체크
			}
			period();
			break;
		case 'medium':	// m창고 선택했을 때
			if (document.getElementById('select_medium').disabled == false) {	// 해당 지점 m창고 매진아니면
				document.getElementById('select_medium').checked = true;		// 라디오버튼 체크		
				}
			period();
			break;
		case 'large':	// l창고 선택했을 때
			if (document.getElementById('select_large').disabled == false) {	// 해당 지점 l창고 매진아니면
				document.getElementById('select_large').checked = true;			// 라디오버튼 체크	
				}
			period();
		}		
	}
	function period() {	// 지점, 창고 둘 다 선택됐을 경우만 기간선택창 활성화시키는 함수
				// 지점 하나가 선택되어 있고
		if (document.getElementById('select_1').checked || document.getElementById('select_2').checked || document.getElementById('select_3').checked) {
				// 창고타입도 선택했을 경우
			if (document.getElementById('select_small').checked || document.getElementById('select_medium').checked || document.getElementById('select_large').checked) {
				order_form.period.disabled = false;	// 기간선택 이용가능하게 변경
			} else {	// 아닌 경우 이용불가처리 및 select 초기화
				order_form.period.disabled = true;
				document.getElementById('peri_novalue').selected = true;
			}
		} else {		// 아닌 경우 이용불가처리 및 select 초기화
			order_form.period.disabled = true;
			document.getElementById('peri_novalue').selected = true;		
		}
	}
	// 은행 선택하면 db에서 계좌와 예금주 이름 조회해 표시하는 함수
	function get_account(bank) {
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
		<h2>이용기간 선택</h2>
		<select name="period" required="required" disabled="disabled">
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
		<p>무통장 입금:	<select onchange="get_account(this.value)" name="bank" required="required">
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