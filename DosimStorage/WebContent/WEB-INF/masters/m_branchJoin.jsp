<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 추가 화면</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("지점등록을 성공했습니다.");
		location.href="m_shopList.action";
	</script>
</c:if>
<c:if test="${result<=0 }">
	<script type="text/javascript">
		alert("식당등록을 실패했습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>