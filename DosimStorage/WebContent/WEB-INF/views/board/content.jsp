<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() { // body를 보여줄 준비가 되어 있으면
		$('#dispLisp').load("list.do","pageNum=${pageNum}");
	});	
</script>
</head><body>
<h2>게시글 상세 정보</h2>
<table>
	<tr><th>번호</th><td>${board.num}</td>
		<th>제목</th><td>${board.subject}</td></tr>
	<tr><th>작성자</th><td>${board.writer}</td>
		<th>이메일</th><td>${board.email}</td></tr>
	<tr><th>조회수</th><td>${board.readcount}</td>
		<th>작성일</th><td>${board.reg_date}</td></tr>
	<tr><th>내용</th><td colspan="3"><pre>${board.content}</pre></td></tr>
</table>
<button onclick="location.href='updateForm.do?num=${board.num}&pageNum=${pageNum}'">수정</button>
<button onclick="location.href='deleteForm.do?num=${board.num}&pageNum=${pageNum}'">삭제</button>
<button onclick="location.href='insertForm.do?num=${board.num}&pageNum=${pageNum}'">답변</button>
<button onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>
<div id="dispLisp"></div>
</body>
</html>