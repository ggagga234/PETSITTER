package kh.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.PetDao;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetDto;



@Service
public class Petservice {
	@Autowired
	private PetDao dao;
	
	public List<PetDto> Petselect(){
		return dao.Petselect();
	}
	
	public int Memboardinsert(MemboardDto mdto) {
		return dao.Memboardinsert(mdto);
	}
	
	public MemboardDto redlist(){
		return dao.redlist();
	}
	
	public String petphoto(String  mb_pet_name) {
		return dao.petphoto(mb_pet_name);
	}
	
	public String gettime(String time) {
		return dao.gettime(time);
	}
	
	public String getpettype(String petname) {
		return dao.getpettype(petname);
	}
	
	public MemboardDto modlist(String mb_seq) {
		return dao.modlist(mb_seq);
	}
	
	public int Memboardupdate(MemboardDto mdto) {
		return dao.Memboardupdate(mdto);
	}
	
	public List<MemboardDto> listselect(){
		return dao.listselect();
	}
}
