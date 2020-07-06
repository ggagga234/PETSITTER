package kh.pet.dto;

public class TotboardDTO {
	private String psb_seq;
	private String psb_title;
	private String psb_writer;
	private String psb_thumb;
	private Integer ps_age;
	private String ps_gender;
	private String ps_address1;
	private String psb_petType;
	private String ps_resident_type;
	private String psb_service;
	private String psb_contents;
	private String psb_start_day;
	private String psb_end_day;
	private String psb_time;
	
	public TotboardDTO() {}	

	public TotboardDTO(String psb_seq, String psb_title, String psb_writer, String psb_thumb, Integer ps_age,
			String ps_gender, String ps_address1, String psb_petType, String ps_resident_type, String psb_service,
			String psb_contents, String psb_start_day, String psb_end_day, String psb_time) {
		super();
		this.psb_seq = psb_seq;
		this.psb_title = psb_title;
		this.psb_writer = psb_writer;
		this.psb_thumb = psb_thumb;
		this.ps_age = ps_age;
		this.ps_gender = ps_gender;
		this.ps_address1 = ps_address1;
		this.psb_petType = psb_petType;
		this.ps_resident_type = ps_resident_type;
		this.psb_service = psb_service;
		this.psb_contents = psb_contents;
		this.psb_start_day = psb_start_day;
		this.psb_end_day = psb_end_day;
		this.psb_time = psb_time;
	}

	public String getPsb_seq() {
		return psb_seq;
	}

	public void setPsb_seq(String psb_seq) {
		this.psb_seq = psb_seq;
	}

	public String getPsb_title() {
		return psb_title;
	}

	public void setPsb_title(String psb_title) {
		this.psb_title = psb_title;
	}

	public String getPsb_writer() {
		return psb_writer;
	}

	public void setPsb_writer(String psb_writer) {
		this.psb_writer = psb_writer;
	}

	public String getPsb_thumb() {
		return psb_thumb;
	}

	public void setPsb_thumb(String psb_thumb) {
		this.psb_thumb = psb_thumb;
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

	public String getPs_address1() {
		return ps_address1;
	}

	public void setPs_address1(String ps_address1) {
		this.ps_address1 = ps_address1;
	}

	public String getPsb_petType() {
		return psb_petType;
	}

	public void setPsb_petType(String psb_petType) {
		this.psb_petType = psb_petType;
	}

	public String getPs_resident_type() {
		return ps_resident_type;
	}

	public void setPs_resident_type(String ps_resident_type) {
		this.ps_resident_type = ps_resident_type;
	}

	public String getPsb_service() {
		return psb_service;
	}

	public void setPsb_service(String psb_service) {
		this.psb_service = psb_service;
	}

	public String getPsb_contents() {
		return psb_contents;
	}

	public void setPsb_contents(String psb_contents) {
		this.psb_contents = psb_contents;
	}

	public String getPsb_start_day() {
		return psb_start_day;
	}

	public void setPsb_start_day(String psb_start_day) {
		this.psb_start_day = psb_start_day;
	}

	public String getPsb_end_day() {
		return psb_end_day;
	}

	public void setPsb_end_day(String psb_end_day) {
		this.psb_end_day = psb_end_day;
	}

	public String getPsb_time() {
		return psb_time;
	}

	public void setPsb_time(String psb_time) {
		this.psb_time = psb_time;
	}

	
	
}
