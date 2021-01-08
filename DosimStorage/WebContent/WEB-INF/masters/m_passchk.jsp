<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function wincl() {
		if(frm.password.value!=1234){
			alert("관리자 암호가 아닙니다");
			frm.password.vlaue="";
			frm.password.focus();
			return false;
		}else{
			alert("암호 확인되었습니다");
			window.close();
		} 
//		window.close();
	}
</script>
</head>
<body>
	<form action="m_shopListUpdate.action" name="frm" onsubmit="return wincl()">
		관리자 암호: <input type="password" name="password" required="required" autofocus="autofocus"><p>
		<input type="submit" value="확인">
	</form>
</body>
</html>