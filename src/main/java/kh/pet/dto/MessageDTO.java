package kh.pet.dto;

import java.sql.Timestamp;

public class MessageDTO {
	private int msg_seq;
	private String msg_sender;
	private String msg_reciever;
	private String msg_title;
	private String msg_contents;
	private Timestamp msg_date;
	private String msg_status;
	public MessageDTO() {}
	public MessageDTO(int msg_seq, String msg_sender, String msg_reciever, String msg_title, String msg_contents,
			Timestamp msg_date, String msg_status) {
		super();
		this.msg_seq = msg_seq;
		this.msg_sender = msg_sender;
		this.msg_reciever = msg_reciever;
		this.msg_title = msg_title;
		this.msg_contents = msg_contents;
		this.msg_date = msg_date;
		this.msg_status = msg_status;
	}
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_reciever() {
		return msg_reciever;
	}
	public void setMsg_reciever(String msg_reciever) {
		this.msg_reciever = msg_reciever;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_contents() {
		return msg_contents;
	}
	public void setMsg_contents(String msg_contents) {
		this.msg_contents = msg_contents;
	}
	public Timestamp getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Timestamp msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(String msg_status) {
		this.msg_status = msg_status;
	}
	
}
