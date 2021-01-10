<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("서비스등록을 성공했습니다.");
		location.href="m_menu.action?s_id=${s_id}";
	</script>
</c:if>
<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("서비스등록을 실패했습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>