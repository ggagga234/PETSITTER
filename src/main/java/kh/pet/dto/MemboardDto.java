package kh.pet.dto;

import java.sql.Timestamp;

public class MemboardDto {
	private String mb_seq;
	private String mb_title;
	private String mb_writer;
	private Timestamp mb_date;
	private String mb_pet_name;
	private String mb_service;
	private String mb_startday;
	private String mb_endday;
	private String mb_time;
	private String mb_unique;
	private String mb_point;
	private String mb_petphoto;
	private String mb_boardstatus;
	private String mb_restatus;
	private String mb_booker;
	private String[] photo;
	
	public MemboardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemboardDto(String mb_seq, String mb_title, String mb_writer, Timestamp mb_date, String mb_pet_name,
			String mb_service, String mb_startday, String mb_endday, String mb_time, String mb_unique, String mb_point,
			String mb_petphoto, String mb_boardstatus, String mb_restatus, String mb_booker, String[] photo) {
		super();
		this.mb_seq = mb_seq;
		this.mb_title = mb_title;
		this.mb_writer = mb_writer;
		this.mb_date = mb_date;
		this.mb_pet_name = mb_pet_name;
		this.mb_service = mb_service;
		this.mb_startday = mb_startday;
		this.mb_endday = mb_endday;
		this.mb_time = mb_time;
		this.mb_unique = mb_unique;
		this.mb_point = mb_point;
		this.mb_petphoto = mb_petphoto;
		this.mb_boardstatus = mb_boardstatus;
		this.mb_restatus = mb_restatus;
		this.mb_booker = mb_booker;
		this.photo = photo;
	}

	public String getMb_seq() {
		return mb_seq;
	}

	public void setMb_seq(String mb_seq) {
		this.mb_seq = mb_seq;
	}

	public String getMb_title() {
		return mb_title;
	}

	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}

	public String getMb_writer() {
		return mb_writer;
	}

	public void setMb_writer(String mb_writer) {
		this.mb_writer = mb_writer;
	}

	public Timestamp getMb_date() {
		return mb_date;
	}

	public void setMb_date(Timestamp mb_date) {
		this.mb_date = mb_date;
	}

	public String getMb_pet_name() {
		return mb_pet_name;
	}

	public void setMb_pet_name(String mb_pet_name) {
		this.mb_pet_name = mb_pet_name;
	}

	public String getMb_service() {
		return mb_service;
	}

	public void setMb_service(String mb_service) {
		this.mb_service = mb_service;
	}

	public String getMb_startday() {
		return mb_startday;
	}

	public void setMb_startday(String mb_startday) {
		this.mb_startday = mb_startday;
	}

	public String getMb_endday() {
		return mb_endday;
	}

	public void setMb_endday(String mb_endday) {
		this.mb_endday = mb_endday;
	}

	public String getMb_time() {
		return mb_time;
	}

	public void setMb_time(String mb_time) {
		this.mb_time = mb_time;
	}

	public String getMb_unique() {
		return mb_unique;
	}

	public void setMb_unique(String mb_unique) {
		this.mb_unique = mb_unique;
	}

	public String getMb_point() {
		return mb_point;
	}

	public void setMb_point(String mb_point) {
		this.mb_point = mb_point;
	}

	public String getMb_petphoto() {
		return mb_petphoto;
	}

	public void setMb_petphoto(String mb_petphoto) {
		this.mb_petphoto = mb_petphoto;
	}

	public String getMb_boardstatus() {
		return mb_boardstatus;
	}

	public void setMb_boardstatus(String mb_boardstatus) {
		this.mb_boardstatus = mb_boardstatus;
	}

	public String getMb_restatus() {
		return mb_restatus;
	}

	public void setMb_restatus(String mb_restatus) {
		this.mb_restatus = mb_restatus;
	}

	public String getMb_booker() {
		return mb_booker;
	}

	public void setMb_booker(String mb_booker) {
		this.mb_booker = mb_booker;
	}

	public String[] getPhoto() {
		return photo;
	}

	public void setPhoto(String[] photo) {
		this.photo = photo;
	}

	
}
