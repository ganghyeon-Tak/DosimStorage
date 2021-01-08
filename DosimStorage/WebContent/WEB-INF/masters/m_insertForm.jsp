<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가</title>
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">
p {
	text-align: center;
	font-size: 30px;
	font-weight: 600;
	letter-spacing: 15px;
	font-family: fantasy;
}
</style>
<script type="text/javascript">
	function chk() {
		if(frm.masterPass.value != '1234'){
			alert("관리자 암호가 틀렸습니다")
			frm.masterPass.value="";
			frm.masterPass.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form action="m_insert.action" method="post" name="frm"
		onsubmit="chk()" enctype="multipart/form-data">
		<input type="hidden" name="s_id" value=${s_id }>
		<input type="hidden" name="m_num" value="1">
		<input type="hidden" name="rec_menu" value="n">
		<p></p>
		<p>신규서비스등록</p>
		<table>
			<tr>
				<th>서비스이미지</th>
				<td><input type="file" name="m_img"></td>
			</tr>
			<tr>
				<th>서비스명</th>
				<td><input type="text" name="m_name" required="required"></td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td><input type="text" name="m_size" required="required"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="m_price" required="required"></td>
			</tr>
		
			<!-- <tr>
				<th>관리자 암호</th>
				<td><input type="password" name="masterPass" required="required"></td>
			</tr> -->
			<tr>
				<th colspan="2"><input type="submit" value="확인"><input onclick="location.href='m_menu.action'" type="reset" value="취소">
		</table>
	</form>
</body>
</html>