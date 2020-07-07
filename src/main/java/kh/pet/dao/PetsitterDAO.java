package kh.pet.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.ReviewDTO;

@Repository
public class PetsitterDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private HttpSession session;
	
	public int insert(PetsitterDTO psdto) throws Exception {
		return mybatis.insert("Petsitter.insert",psdto);
	}
	
	public int update_star(ReviewDTO rwdto) throws Exception{
		float rw_star = rwdto.getRw_star();
		String rw_petsitter_id = rwdto.getRw_petsitter_id();
		Map<String, Object> param =new HashMap();
		param.put("rw_petsitter_id",rw_petsitter_id);
		param.put("rw_star",rw_star);
		return mybatis.update("Petsitter.update_star", param);
	}
	
	public PetsitterDTO selectById(String ps_id) throws Exception{
		return mybatis.selectOne("Petsitter.selectById",ps_id);
	}
}