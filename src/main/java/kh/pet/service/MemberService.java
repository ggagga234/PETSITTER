package kh.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	public String isExistId(String ps_id) throws Exception{
		return mdao.isExistId(ps_id);
	}
}
