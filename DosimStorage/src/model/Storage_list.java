package model;

public class Storage_list {
	private String st_code;  	// 창고코드
	private int b_code;			// 지점코드
	private String s_kind;		// 창고서비스종류
	private String borrower_id; // 대여자ID
	private String rented;		// 대여중
	private String usable;		// 사용가능여부
	
	public String getSt_code() {
		return st_code;
	}
	public void setSt_code(String st_code) {
		this.st_code = st_code;
	}
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getS_kind() {
		return s_kind;
	}
	public void setS_kind(String s_kind) {
		this.s_kind = s_kind;
	}
	public String getBorrower_id() {
		return borrower_id;
	}
	public void setBorrower_id(String borrower_id) {
		this.borrower_id = borrower_id;
	}
	public String getRented() {
		return rented;
	}
	public void setRented(String rented) {
		this.rented = rented;
	}
	public String getUsable() {
		return usable;
	}
	public void setUsable(String usable) {
		this.usable = usable;
	}
	
}
