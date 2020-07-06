package kh.pet.dao;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Autowired
	private HttpSession session;
	
	public String isExistId(String ps_id) throws Exception{
		int result = mybatis.selectOne("Member.existId", ps_id);
		if(result==0) {return String.valueOf(true);}
		else {return String.valueOf(false);}
		}
}
