<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 지점 등록</title>
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
	<form action="m_shopJoin.action" method="post" name="frm"
		onsubmit="return chk()" enctype="multipart/form-data">
		<input type="hidden" name="id" value="1">
		<input type="hidden" name="s_del">
		<p></p>
		<p>신규 지점 등록</p>
		<table>
		<tr>
		</tr>
			<tr>
				<th>지점코드</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>지점명</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<!-- 첨부파일 참고 -->
				<td><input type="file" name="s_img" required="required"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="tel" required="required"
					pattern="\d{2,3,4}-\d{3,4}-\d{4}" placeholder="xxx-xxx-xxxx"
					title="전화번호 형식 xxx-xxxx-xxxx-"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address" required="required"></td>
			</tr>
			<tr>
				<th>관리자 암호</th>
				<td><input type="password" name="masterPass" required="required"></td>
			</tr>
			<tr>
				<th colspan="2">
				<input style="margin-right: 7px; font-size: 17px;" type="submit" value="확인">
				<input style="font-size: 17px;" type="button" value="취소" onclick="location.href='m_shopList.action'">
				</th>
		</table>

	</form>
</body>
</html>