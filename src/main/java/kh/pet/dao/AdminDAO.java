package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MemboardDto;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemboardDto> mb_board_list(Map<String, Integer> map) {
		return mybatis.selectList("select * from (select mem_board.*,row_number()over (order by mb_seq desc) rnum from mem_board) where rnum between ${start} and ${end}", map);
	}
	
}
