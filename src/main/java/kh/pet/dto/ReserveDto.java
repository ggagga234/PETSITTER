package kh.pet.dto;

public class ReserveDto {
	private int reserve_seq;
	private int parent_seq;
	private String petsitter_id;
	private String mem_id;
	private String pet_name; 
	private int reserve_point; 
	private String start_day;
	private String end_day;
	private String reserve_time;
	
	public ReserveDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReserveDto(int reserve_seq, int parent_seq, String petsitter_id, String mem_id, String pet_name,
			int reserve_point, String start_day, String end_day, String reserve_time) {
		super();
		this.reserve_seq = reserve_seq;
		this.parent_seq = parent_seq;
		this.petsitter_id = petsitter_id;
		this.mem_id = mem_id;
		this.pet_name = pet_name;
		this.reserve_point = reserve_point;
		this.start_day = start_day;
		this.end_day = end_day;
		this.reserve_time = reserve_time;
	}

	public int getReserve_seq() {
		return reserve_seq;
	}

	public void setReserve_seq(int reserve_seq) {
		this.reserve_seq = reserve_seq;
	}

	public int getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}

	public String getPetsitter_id() {
		return petsitter_id;
	}

	public void setPetsitter_id(String petsitter_id) {
		this.petsitter_id = petsitter_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getReserve_point() {
		return reserve_point;
	}

	public void setReserve_point(int reserve_point) {
		this.reserve_point = reserve_point;
	}

	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}

	public String getEnd_day() {
		return end_day;
	}

	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}

	public String getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}

	
	
}
