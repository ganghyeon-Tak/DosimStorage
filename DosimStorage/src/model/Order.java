package model;

import java.sql.Date;

public class Order {
	private int order_no;			// 주문번호
	private String m_id;			// 회원ID
	private String st_code;			// 창고코드
	private int order_totalPrice; 	// 주문총액
	private Date order_date;		// 주문일
	private Date hope_date;			// 이용개시 희망일
	private int use_period;			// 이용개월수
	private Date start_date;		// 이용시작일
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
	private Date expire_date;		// 이용만료일
	private String account_no;		// 계좌번호
	private Date depo_dueDate;		// 입금기한
	private String order_state; 	// 주문상태
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getSt_code() {
		return st_code;
	}
	public void setSt_code(String st_code) {
		this.st_code = st_code;
	}
	public int getOrder_totalPrice() {
		return order_totalPrice;
	}
	public void setOrder_totalPrice(int order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
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
	public Date getDepo_dueDate() {
		return depo_dueDate;
	}
	public void setDepo_dueDate(Date depo_dueDate) {
		this.depo_dueDate = depo_dueDate;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	
	
}
