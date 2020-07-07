package kh.pet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.TotboardDTO;

@Repository
public class PetsitterboardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private HttpSession session;
	
	public String selectNextSeq() throws Exception{
		String seq = mybatis.selectOne("Board.selectNextSeq");
		String psb_seq = "ps"+seq;
		return psb_seq;
	}
	
	public int insert(TotboardDTO totdto) throws Exception{
		return mybatis.insert("Board.insert",totdto);
	}
	
	public PetsitterDTO selectBySeq(String psb_seq) throws Exception{
		return mybatis.selectOne("Board.selectBySeq",psb_seq);
	}
	
	public TotboardDTO selectBoard(String psb_writer,String psb_seq) throws Exception{
		Map<String, String> param =new HashMap<String, String>();
		param.put("writer",psb_writer);
		param.put("seq",psb_seq);
		return mybatis.selectOne("Board.selectBoard",param);
	}
	
	public List<PetsitterboardDTO> selectAll() throws Exception{
		return mybatis.selectList("Board.selectAll");
	};
	
	public int selectAllCnt()throws Exception{
		return mybatis.selectOne("Board.selectCntAll");
	}
	
	public int selectCnt(String psb_writer)throws Exception{
		System.out.println("dao:"+psb_writer);
		return mybatis.selectOne("Board.selectCnt", psb_writer);
	}
	
	public List<PetsitterboardDTO> selectByPage(Map<String,Integer> page)throws Exception{
		return mybatis.selectList("Board.selectByPage", page);
	}
}
