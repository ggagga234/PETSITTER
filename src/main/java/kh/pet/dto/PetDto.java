package kh.pet.dto;

public class PetDto {
private String pet_name;
private String pet_photo;
private String pet_gender;
private String pet_ox;
private String pet_age;
private String pet_type;
private String pet_sort;
private String pet_family;
private String pet_character;
private String pet_details;
private String master_id;

public PetDto() {
	super();
	// TODO Auto-generated constructor stub
}

public PetDto(String pet_name, String pet_photo, String pet_gender, String pet_ox, String pet_age, String pet_type,
		String pet_sort, String pet_family, String pet_character, String pet_details, String master_id) {
	super();
	this.pet_name = pet_name;
	this.pet_photo = pet_photo;
	this.pet_gender = pet_gender;
	this.pet_ox = pet_ox;
	this.pet_age = pet_age;
	this.pet_type = pet_type;
	this.pet_sort = pet_sort;
	this.pet_family = pet_family;
	this.pet_character = pet_character;
	this.pet_details = pet_details;
	this.master_id = master_id;
}

public String getPet_name() {
	return pet_name;
}

public void setPet_name(String pet_name) {
	this.pet_name = pet_name;
}

public String getPet_photo() {
	return pet_photo;
}

public void setPet_photo(String pet_photo) {
	this.pet_photo = pet_photo;
}

public String getPet_gender() {
	return pet_gender;
}

public void setPet_gender(String pet_gender) {
	this.pet_gender = pet_gender;
}

public String getPet_ox() {
	return pet_ox;
}

public void setPet_ox(String pet_ox) {
	this.pet_ox = pet_ox;
}

public String getPet_age() {
	return pet_age;
}

public void setPet_age(String pet_age) {
	this.pet_age = pet_age;
}

public String getPet_type() {
	return pet_type;
}

public void setPet_type(String pet_type) {
	this.pet_type = pet_type;
}

public String getPet_sort() {
	return pet_sort;
}

public void setPet_sort(String pet_sort) {
	this.pet_sort = pet_sort;
}

public String getPet_family() {
	return pet_family;
}

public void setPet_family(String pet_family) {
	this.pet_family = pet_family;
}

public String getPet_character() {
	return pet_character;
}

public void setPet_character(String pet_character) {
	this.pet_character = pet_character;
}

public String getPet_details() {
	return pet_details;
}

public void setPet_details(String pet_details) {
	this.pet_details = pet_details;
}

public String getMaster_id() {
	return master_id;
}

public void setMaster_id(String master_id) {
	this.master_id = master_id;
}


}
