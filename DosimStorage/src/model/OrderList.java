package model;

import java.sql.Date;

public class OrderList {
	long order_no;
	String m_id;
	Date order_date;
	int order_totalprice;
	Date hope_date;
	int use_period;
	String order_state;
	String s_kind;
	String b_title;

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

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
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

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public String getS_kind() {
		return s_kind;
	}

	public void setS_kind(String s_kind) {
		this.s_kind = s_kind;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

}
