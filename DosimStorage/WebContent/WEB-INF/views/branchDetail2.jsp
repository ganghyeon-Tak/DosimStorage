<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.br_container {
	display: flex;
	max-width: 1200px;
	min-width: 800px;
}
h3 {
	padding: 10px;
	margin-bottom: 10px;
}
.img_box {
	margin-right: 40px;
}
.g {
	width: 7%;
	height: 7%;
}
.b_detail {
	padding: 20px 0;
	display: flex;
	align-items: center;
}

.b_desc {
	margin: 0 20px; 
}
.title {
	font-size: 18px;
}
</style>
</head>
<body>
<br>
<h3>도심창고 신사점</h3>
<div class="br_container">
	<div class="img_box">
		<img alt="" src="images/storage1.jpg">
	</div>
	<div class="branch">
		<div class="b_detail">
			<img class="g" src="images/map.png" alt="">
			<div class="b_desc">
				<p class="title"><b>Navigation</b></p>
				<p>도심창고 신사점(서울특별시 강남구 도산대로 25)</p>
			</div>
		</div>
		<div class="b_detail">
			<img class="g" src="images/bus.png" alt="">
			<div class="b_desc">
				<p class="title"><b>Bus</b></p>
				<p>147, 148, 240, 463</p>
			</div>
		</div>
		<div class="b_detail">
			<img class="g" src="images/subway.png" alt="">
			<div class="b_desc">
				<p class="title"><b>Subway</b></p>
				<p>3호선 신사역 8번출구</p>
			</div>
		</div>
		<div class="b_detail">
			<img class="g" src="images/phone.png" alt="">
			<div class="b_desc">
				<p class="title"><b>Contact</b></p>
				<p>TEL 02-891-2345</p>				
				<p>EMAIL sinsa@dosim.kr</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>