<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품설명</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript" src="/jura2/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#disp').load('header.do');
		$('#footer').load('footer.do');
	});
</script>
<style type="text/css">
table {
	border-spacing: 2px;
	border-collapse: separate;
}

p {
	font-size: 30px;
}
.content p { font-size: 23px; }
</style>
</head>
<body class="is-preload">
	<div id="disp"></div>
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1 align="center">
						<br />
					</h1>
					<p></p>
				</header>
				<section class="tiles">
					<article1> <span class="image"> <img
						src="images/small.png" alt="" />
					</span> <a href="loginForm.do"> <!-- <h2>스몰사이즈</h2> -->
						<div class="content">
							<p>
								창고 사이즈 : 1/6평 <br>1개월 대여료 : 68,000원
							</p>
						</div>
					</a> </article1>
					<article1> <span class="image">
						<img src="images/medium.png" alt="" />
					</span> <a href="loginForm.do"> <!-- <h2>미디움사이즈</h2> -->
						<div class="content">
							<p>
								창고 사이즈  : 1/3평<br>1개월 대여료 : 98,000원
							</p>
						</div>
					</a> </article1>
					<article1> <span class="image"> 
						<img src="images/ㅣlarge.png" alt="" />
					</span> <a href="loginForm.do"> <!-- <h2>라지사이즈</h2> -->
						<div class="content">
							<p>
								창고 사이즈 : 2/3평<br>1개월 대여료 : 168,000원
							</p>
						</div>
					</a> </article1>
					<!-- <article class="style1"> -->
					<article>
						<span class="image"> <img src="images/b1.JPG" alt="" />
						</span> <a href="loginForm.do"></a>
					</article>
					<article>
						<span class="image"> <img src="images/b2.JPG" alt="" />
						</span> <a href="loginForm.do"></a>
					</article>
					<article>
						<span class="image"> <img src="images/b3.JPG" alt="" />
						</span> <a href="loginForm.do"></a>
					</article>
				</section>
			</div>
		</div>
	<div id="footer"></div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>