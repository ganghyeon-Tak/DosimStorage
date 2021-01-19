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
		<h2>창고 추가</h2>
		<form action="insertStorage.action" method="post">
			<h3>지점 선택</h3>
			<br>
			<p><label for="br1">광화문점</label><input id="br1" type="radio" name="br" value="1"checked="checked"></p>
			<p><label for="br2">신사점</label><input id="br2" type="radio" name="br" value="2"></p>
			<p><label for="br3">판교점</label><input id="br3" type="radio" name="br" value="3"></p>
			<br>
			<h3>창고 종류</h3>
			<p><label for="st1">small</label><input id="st1" type="radio" name="st" value="s" checked="checked"></p>
			<p><label for="st2">medium</label><input id="st2" type="radio" name="st" value="m"></p>
			<p><label for="st3">large</label><input id="st3" type="radio" name="st" value="l"></p>
			<br>
			<h3>수량</h3>
			<p>한 번에 추가 가능한 수량은 99개 까지입니다</p>
			<input type="number" max="99" min="1" name="num">
			<br><br>
			<button>추가하기</button>
		</form>
	</div>
</body>
</html>