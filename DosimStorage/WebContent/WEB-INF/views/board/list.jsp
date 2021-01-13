<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head> <title>게시판</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
 <body>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>  
   </tr>
<c:if test="${total > 0 }">
	<c:forEach var="board" items="${list }">
		<tr height="25" align="center">
		<td align="center">${board.num }</td>
		<td align="center">${board.title }</td>
	   <td align="center">${board.m_id }</td>
	   <td align="center">${board.reg_date}</td>
	   <td align="center">${board.readcount}</td>
	   <td align="center">&nbsp;</td>
 	</c:forEach>
</c:if>
<c:if test="${total <= 0 }">
	<tr><th colspan="5">데이터가 없습니다</th></tr>
</c:if>	
</table>
 <input type=button value="글쓰기" OnClick="location.href='writeForm.bo'">
 </body>
</html>
