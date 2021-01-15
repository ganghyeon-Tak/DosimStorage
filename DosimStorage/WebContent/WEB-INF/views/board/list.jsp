<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<div id="list">
<h2>게시글 목록</h2>
	<table class="list_table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	<c:if test="${empty list}">
		<tr>
			<th colspan="5">게시글이 없습니다</th>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
	<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.num}</td>
	<c:if test="${board.del=='y'}">
			<td colspan="4">삭제된 글 입니다</td>
		</tr>
	</c:if>
	<c:if test="${board.del!='y'}">
			<td title="${board.content}">
	<c:if test="${board.ref_level > 0}">
	 <!-- level*10 pixel만큼 들여쓰기 -->
		<img alt="" src="images/level.gif" height="10" 
			width="${board.ref_level*10}">
		<img alt="" src="images/re.gif">	
	</c:if>
		<a href="content.bo?num=${board.num}&pageNum=${currentPage}">
			${board.title}</a>
	<c:if test="${board.readcount > 50}">
		<img alt="" src="images/hot.gif">
	</c:if>
			</td>
			<td>${board.m_id}</td>
			<td>${board.readcount}</td>
			<td>${board.reg_date}</td>
		</tr>
	</c:if>
</c:forEach>
</c:if>
</table>

<button onclick="location.href='writeForm.bo?num=0&pageNum=1'">게시글 작성</button>
<div align="center">
<c:if test="${startPage > pagePerBlock}">
	<button onclick="location.href='list.do?pageNum=${startPage-1}'">이전</button>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i != currentPage }">
			<button onclick="location.href='list.do?pageNum=${i}'">${i}</button>
	</c:if>	
	<c:if test="${i == currentPage }">
			<button onclick="location.href='list.do?pageNum=${i}'"
				class="active">${i}</button>
	</c:if>	
</c:forEach>
<!-- 보여줄 페이지가 남아 있다	 -->
<c:if test="${endPage < totalPage }">
		<button onclick="location.href='list.do?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>
</div>
</body>
</html>