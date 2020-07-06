package kh.pet.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReviewDTO {

	private int rw_seq;
	private String rw_writer;
	private String rw_date;
	private String rw_contents;
	private int rw_star;
	private String rw_petsitter_id;
	private String rw_parent_seq;
	
	public ReviewDTO() {}

	public ReviewDTO(int rw_seq, String rw_writer, String rw_date, String rw_contents, int rw_star,
			String rw_petsitter_id, String rw_parent_seq) {
		super();
		this.rw_seq = rw_seq;
		this.rw_writer = rw_writer;
		this.rw_date = rw_date;
		this.rw_contents = rw_contents;
		this.rw_star = rw_star;
		this.rw_petsitter_id = rw_petsitter_id;
		this.rw_parent_seq = rw_parent_seq;
	}

	public int getRw_seq() {
		return rw_seq;
	}

	public void setRw_seq(int rw_seq) {
		this.rw_seq = rw_seq;
	}

	public String getRw_writer() {
		return rw_writer;
	}

	public void setRw_writer(String rw_writer) {
		this.rw_writer = rw_writer;
	}

	public String getRw_date() {
		return rw_date;
	}

	public void setRw_date(String rw_date) {
		this.rw_date = rw_date;
	}

	public String getRw_contents() {
		return rw_contents;
	}

	public void setRw_contents(String rw_contents) {
		this.rw_contents = rw_contents;
	}

	public int getRw_star() {
		return rw_star;
	}

	public void setRw_star(int rw_star) {
		this.rw_star = rw_star;
	}

	public String getRw_petsitter_id() {
		return rw_petsitter_id;
	}

	public void setRw_petsitter_id(String rw_petsitter_id) {
		this.rw_petsitter_id = rw_petsitter_id;
	}

	public String getRw_parent_seq() {
		return rw_parent_seq;
	}

	public void setRw_parent_seq(String rw_parent_seq) {
		this.rw_parent_seq = rw_parent_seq;
	}
	
	
	
}
