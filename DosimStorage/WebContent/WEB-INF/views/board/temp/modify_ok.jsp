<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:useBean id="dao" class="board.DAO"/>
<jsp:useBean id="vo" class="board.VO"/>
<jsp:setProperty name="vo" property="*" />
			
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	boolean ch = dao.checkPassword(vo, idx);
	if(ch) {
			dao.modify(vo, idx);
		%>
			<script language=javascript>
				self.window.alert("글이 수정되었습니다.");
				location.href="view.jsp?idx=<%=idx%>&pg=<%=pg%>";
			</script>
		<%
	} else {
		%>
			<script language=javascript>
				self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
		<%
	}
%>
