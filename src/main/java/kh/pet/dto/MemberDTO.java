package kh.pet.dto;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private int mem_zipcode;
	private String mem_address1;
	private String mem_address2;
	private int mem_type;
	private int mem_join_type;
	private Timestamp mem_join_date;
	private int mem_warning;
	private int mem_point;
	private String mem_verify;
	private String mem_authkey;
	
	
	public MemberDTO() {}	
	
	public MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_email, String mem_phone, int mem_zipcode,
			String mem_address1, String mem_address2, int mem_type, int mem_join_type, Timestamp mem_join_date,
			int mem_warning, int mem_point, String mem_verify, String mem_authkey) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_type = mem_type;
		this.mem_join_type = mem_join_type;
		this.mem_join_date = mem_join_date;
		this.mem_warning = mem_warning;
		this.mem_point = mem_point;
		this.mem_verify = mem_verify;
		this.mem_authkey = mem_authkey;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public int getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(int mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public int getMem_type() {
		return mem_type;
	}

	public void setMem_type(int mem_type) {
		this.mem_type = mem_type;
	}

	public int getMem_join_type() {
		return mem_join_type;
	}

	public void setMem_join_type(int mem_join_type) {
		this.mem_join_type = mem_join_type;
	}

	public Timestamp getmem_join_date() {
		return mem_join_date;
	}

	public void setmem_join_date(Timestamp mem_join_date) {
		this.mem_join_date = mem_join_date;
	}

	public int getMem_warning() {
		return mem_warning;
	}

	public void setMem_warning(int mem_warning) {
		this.mem_warning = mem_warning;
	}

	public int getMem_point() {
		return mem_point;
	}

	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}

	public String getMem_verify() {
		return mem_verify;
	}

	public void setMem_verify(String mem_verify) {
		this.mem_verify = mem_verify;
	}

	public String getMem_authkey() {
		return mem_authkey;
	}

	public void setMem_authkey(String mem_authkey) {
		this.mem_authkey = mem_authkey;
	}
	
	
	
	
	
	
	


			
	
	
	
	

}
