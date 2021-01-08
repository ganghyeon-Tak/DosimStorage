package dao;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;
public class DsBoard1Dao {
	private static DsBoard1Dao instance= new DsBoard1Dao();
	private DsBoard1Dao() {}
	public static DsBoard1Dao getInstance() {
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
		return conn;		
	}
	public int count() {
		int count = 0;
		Connection conn = getConnection(); // DB연결
		PreparedStatement pstmt = null; // sql실행할 객체
		ResultSet rs = null;   // 데이터 읽은 결과 저장
		String sql = "select count(*) from ds_board1";
		try {
			pstmt = conn.prepareStatement(sql); // sql 실행할 준비
			rs = pstmt.executeQuery(); // 실행하여 결과를 rs에 저장
			rs.next();  // rs에 저장된 첫번째 정보를 일는다
			count = rs.getInt(1);
		}catch (Exception e) {
			System.out.println(e.getMessage()); // 에러 원인
		}finally { // 메모리에 있는 DB와 관련된 객체 삭제
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {			}
		}
		return count;
	}
	public ArrayList<DsBoard1> getMemberList() {
		ArrayList<DsBoard1> list = new ArrayList<DsBoard1>();
		Connection conn = getConnection(); // DB연결
		PreparedStatement pstmt = null; // sql실행할 객체
		ResultSet rs = null;   // 데이터 읽은 결과 저장
		String sql = "select * from ds_board1 order by num desc"; // 최근에 입력된 데이터 멎저 읽는다
		try {
			pstmt = conn.prepareStatement(sql); // sql 실행할 준비
			rs = pstmt.executeQuery(); // 실행하여 결과를 rs에 저장
			while(rs.next()) {
				DsBoard1 dboard = new DsBoard1();
				dboard.setNum(rs.getInt("num"));
				dboard.setM_id(rs.getString("m_id"));
				dboard.setOrder_no(rs.getInt("order_no"));
				dboard.setM_email(rs.getString("m_email"));
				dboard.setTitle(rs.getString("title"));
				dboard.setContent(rs.getString("content"));
				dboard.setReadcount(rs.getInt("readcount"));
				dboard.setIp(rs.getString("ip"));
				dboard.setRef(rs.getInt("ref"));
				dboard.setRef_level(rs.getInt("ref_level"));
				dboard.setReg_date(rs.getDate("reg_date"));
				dboard.setReply(rs.getString("reply"));
				dboard.setDel(rs.getString(" del"));

				
				list.add(dboard);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage()); // 에러 원인
		}finally { // 메모리에 있는 DB와 관련된 객체 삭제
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {			}
		}
		return list;
	}
	public int getNextNum() {
		int num = 0;
		Connection conn = getConnection(); // DB연결
		PreparedStatement pstmt = null; // sql실행할 객체
		ResultSet rs = null;   // 데이터 읽은 결과 저장
		String sql = "select nvl(max(num),0) + 1 from ds_board1";
		try {
			pstmt = conn.prepareStatement(sql); // sql 실행할 준비
			rs = pstmt.executeQuery(); // 실행하여 결과를 rs에 저장
			rs.next();  // rs에 저장된 첫번째 정보를 일는다
			num = rs.getInt(1);
		}catch (Exception e) {
			System.out.println(e.getMessage()); // 에러 원인
		}finally { // 메모리에 있는 DB와 관련된 객체 삭제
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {			}
		}
		return num;
	}
	
}
