<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="board.DAO"/>
<jsp:useBean id="vo" class="board.VO"/>
<jsp:setProperty name="vo" property="*" />

<%	
	int max = dao.getMax();
	int result = dao.insertWrite(vo, max);
	if (result > 0) {
%>
  <script type="text/javascript">
   alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp";
  </script>
 <% } else { %>
  <script type="text/javascript">
   alert("입력 입력.");
   history.go(-1);
  </script>
 
 <%  }  %>