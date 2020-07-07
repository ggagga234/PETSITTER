package kh.pet.dto;

public class PetsitterDTO {
	private String ps_id;
	private Integer ps_age;
	private String ps_gender;
	private String ps_resident_type;
	private String ps_address1;
	private String ps_address2;
	private Float ps_star;
	private Integer ps_warning;
	private String ps_service;
	private String ps_drive;
	private String ps_license;
	private String ps_license_img;
	private String ps_img;	
	private String ps_myself;
	
	public PetsitterDTO() {}

	public PetsitterDTO(String ps_id, Integer ps_age, String ps_gender, String ps_resident_type, String ps_address1,
			String ps_address2, Float ps_star, Integer ps_warning, String ps_service, String ps_drive,
			String ps_license, String ps_license_img, String ps_img, String ps_myself) {
		super();
		this.ps_id = ps_id;
		this.ps_age = ps_age;
		this.ps_gender = ps_gender;
		this.ps_resident_type = ps_resident_type;
		this.ps_address1 = ps_address1;
		this.ps_address2 = ps_address2;
		this.ps_star = ps_star;
		this.ps_warning = ps_warning;
		this.ps_service = ps_service;
		this.ps_drive = ps_drive;
		this.ps_license = ps_license;
		this.ps_license_img = ps_license_img;
		this.ps_img = ps_img;
		this.ps_myself = ps_myself;
	}

	public String getPs_id() {
		return ps_id;
	}

	public void setPs_id(String ps_id) {
		this.ps_id = ps_id;
	}

	public Integer getPs_age() {
		return ps_age;
	}

	public void setPs_age(Integer ps_age) {
		this.ps_age = ps_age;
	}

	public String getPs_gender() {
		return ps_gender;
	}

	public void setPs_gender(String ps_gender) {
		this.ps_gender = ps_gender;
	}

	public String getPs_resident_type() {
		return ps_resident_type;
	}

	public void setPs_resident_type(String ps_resident_type) {
		this.ps_resident_type = ps_resident_type;
	}

	public String getPs_address1() {
		return ps_address1;
	}

	public void setPs_address1(String ps_address1) {
		this.ps_address1 = ps_address1;
	}

	public String getPs_address2() {
		return ps_address2;
	}

	public void setPs_address2(String ps_address2) {
		this.ps_address2 = ps_address2;
	}

	public Float getPs_star() {
		return ps_star;
	}

	public void setPs_star(Float ps_star) {
		this.ps_star = ps_star;
	}

	public Integer getPs_warning() {
		return ps_warning;
	}

	public void setPs_warning(Integer ps_warning) {
		this.ps_warning = ps_warning;
	}

	public String getPs_service() {
		return ps_service;
	}

	public void setPs_service(String ps_service) {
		this.ps_service = ps_service;
	}

	public String getPs_drive() {
		return ps_drive;
	}

	public void setPs_drive(String ps_drive) {
		this.ps_drive = ps_drive;
	}

	public String getPs_license() {
		return ps_license;
	}

	public void setPs_license(String ps_license) {
		this.ps_license = ps_license;
	}

	public String getPs_license_img() {
		return ps_license_img;
	}

	public void setPs_license_img(String ps_license_img) {
		this.ps_license_img = ps_license_img;
	}

	public String getPs_img() {
		return ps_img;
	}

	public void setPs_img(String ps_img) {
		this.ps_img = ps_img;
	}

	public String getPs_myself() {
		return ps_myself;
	}

	public void setPs_myself(String ps_myself) {
		this.ps_myself = ps_myself;
	}
	
}
