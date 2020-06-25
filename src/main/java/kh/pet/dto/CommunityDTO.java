package kh.pet.dto;

import java.sql.Timestamp;

public class CommunityDTO {
	int cu_seq;
	int cu_category;
	String cu_title;
	String cu_writer;
	Timestamp cu_date;
	String cu_contents;
	int cu_view_cnt;
	
	public CommunityDTO() {}
	
	public CommunityDTO(int cu_seq, int cu_category, String cu_title, String cu_writer, Timestamp cu_date,
			String cu_contents, int cu_view_cnt) {
		super();
		this.cu_seq = cu_seq;
		this.cu_category = cu_category;
		this.cu_title = cu_title;
		this.cu_writer = cu_writer;
		this.cu_date = cu_date;
		this.cu_contents = cu_contents;
		this.cu_view_cnt = cu_view_cnt;
	}

	public int getCu_seq() {
		return cu_seq;
	}

	public void setCu_seq(int cu_seq) {
		this.cu_seq = cu_seq;
	}

	public int getCu_category() {
		return cu_category;
	}

	public void setCu_category(int cu_category) {
		this.cu_category = cu_category;
	}

	public String getCu_title() {
		return cu_title;
	}

	public void setCu_title(String cu_title) {
		this.cu_title = cu_title;
	}

	public String getCu_writer() {
		return cu_writer;
	}

	public void setCu_writer(String cu_writer) {
		this.cu_writer = cu_writer;
	}

	public Timestamp getCu_date() {
		return cu_date;
	}

	public void setCu_date(Timestamp cu_date) {
		this.cu_date = cu_date;
	}

	public String getCu_contents() {
		return cu_contents;
	}

	public void setCu_contents(String cu_contents) {
		this.cu_contents = cu_contents;
	}

	public int getCu_view_cnt() {
		return cu_view_cnt;
	}

	public void setCu_view_cnt(int cu_view_cnt) {
		this.cu_view_cnt = cu_view_cnt;
	}
	
	
	
	
}
