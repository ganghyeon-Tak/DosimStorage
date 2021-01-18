package model;

import java.sql.Date;

public class MasterOrderView {
	private long order_no;
	private String m_id;
	private String m_name;
	private String st_code;
	private int order_totalprice;
	private Date hope_date;
	private int use_period;
	private Date start_date;
	private Date expire_date;
	private String account_no;
	private Date depo_duedate;
	private String order_state;
	
	public long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(long order_no) {
		this.order_no = order_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getSt_code() {
		return st_code;
	}
	public void setSt_code(String st_code) {
		this.st_code = st_code;
	}
	public int getOrder_totalprice() {
		return order_totalprice;
	}
	public void setOrder_totalprice(int order_totalprice) {
		this.order_totalprice = order_totalprice;
	}
	public Date getHope_date() {
		return hope_date;
	}
	public void setHope_date(Date hope_date) {
		this.hope_date = hope_date;
	}
	public int getUse_period() {
		return use_period;
	}
	public void setUse_period(int use_period) {
		this.use_period = use_period;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public Date getDepo_duedate() {
		return depo_duedate;
	}
	public void setDepo_duedate(Date depo_duedate) {
		this.depo_duedate = depo_duedate;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
}

