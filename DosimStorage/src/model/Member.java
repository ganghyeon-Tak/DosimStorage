package model;
import java.sql.Date;

public class Member {
	private String m_id;		// 회원 ID
	private String m_pw;		// 회원 PW
	private String m_name;		// 이름
	private String m_email;		// 이메일
	private String m_tel;		// 전화번호
	private Date m_regdate;		// 가입일
	private int total_use;		// 누적이용일
	private String m_del;		// 탈퇴여부
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public int getTotal_use() {
		return total_use;
	}
	public void setTotal_use(int total_use) {
		this.total_use = total_use;
	}
	public String getM_del() {
		return m_del;
	}
	public void setM_del(String m_del) {
		this.m_del = m_del;
	}
	
}
