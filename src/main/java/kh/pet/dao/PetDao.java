package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetDto;

@Repository
public class PetDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<PetDto> Petselect(){
		return mybatis.selectList("petsitter.petselect");
	}
	
	public int Memboardinsert(MemboardDto mdto) {
		return mybatis.insert("petsitter.memboardinsert", mdto);
	}
	
	public MemboardDto redlist(){
		return mybatis.selectOne("petsitter.redlist");
	}
	
	public String petphoto(String mb_pet_name) {
		return mybatis.selectOne("petsitter.petphoto", mb_pet_name);
	}
	
	public String gettime(String time) {
		return mybatis.selectOne("petsitter.gettime", time);
	}
	
	public String getpettype(String petname) {
		return mybatis.selectOne("getpettype",petname);
	}
	
	public MemboardDto modlist(String mb_seq) {
		return mybatis.selectOne("modlist", mb_seq);
	}
	
	public int Memboardupdate(MemboardDto mdto) {
		return mybatis.update("Memboardupdate", mdto);
	}
	
	
	public List<MemboardDto> mb_boardList(Map<String,Integer> con){
		return mybatis.selectList("mb_boardList",con);
	}
	
	public int getArticleCount() {
		return mybatis.selectOne("getArticleCount");
	}
	
	
}
