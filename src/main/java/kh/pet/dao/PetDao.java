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
		return mybatis.selectList("membd.petselect");
	}
	
	public int Memboardinsert(MemboardDto mdto) {
		return mybatis.insert("membd.memboardinsert", mdto);
	}
	
	public MemboardDto redlist(String seq){
		System.out.println(seq);
		return mybatis.selectOne("membd.redlist",seq);
	}
	
	public String petphoto(String mb_pet_name) {
		return mybatis.selectOne("membd.petphoto", mb_pet_name);
	}
	
	public String gettime(String time) {
		return mybatis.selectOne("membd.gettime", time);
	}
	
	public String getpettype(String petname) {
		return mybatis.selectOne("membd.getpettype",petname);
	}
	
	public MemboardDto modlist(String mb_seq) {
		return mybatis.selectOne("membd.modlist", mb_seq);
	}
	
	public int Memboardupdate(MemboardDto mdto) {
		return mybatis.update("membd.Memboardupdate", mdto);
	}
	
	public int applyup(MemboardDto mbdto) {
		System.out.println(mbdto);
		return mybatis.update("membd.applyup",mbdto);
	}
	
	public List<MemboardDto> mb_boardList(Map<String,Integer> con){
		return mybatis.selectList("membd.mb_boardList",con);
	}
	
	public int getArticleCount() {
		return mybatis.selectOne("membd.getArticleCount");
	}
	
	public int deleteboard(MemboardDto mdto) {
		return mybatis.delete("membd.deleteboard", mdto);
	}
	
	public List<MemboardDto> seqid(String id) {
		System.out.println(id);
		return mybatis.selectList("membd.seqid",id);
	}
	
	public String addselec(String id) {
		return mybatis.selectOne("membd.addselec",id);
	}
}
