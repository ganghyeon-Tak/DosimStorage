<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	try {
		Class.forName(driver);
		Connection conn =
				DriverManager.getConnection(url,"scott","tiger");
		if (conn != null) {
			out.println("오라클 DB연결 성공 !!");
			conn.close();
		} else out.println("연결 실패");
	} catch(Exception e) {
		System.out.println(e.getMessage());
	}

%>
</body>
</html>

