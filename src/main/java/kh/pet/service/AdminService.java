package kh.pet.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.AdminDAO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	public int board_stop(int seq, String boardType,String state) {
		Map<String, Object> edit_date = new HashMap<String, Object>();
		edit_date.put("seq", seq);
		edit_date.put("boardType", boardType);
		edit_date.put("state", state);
		return dao.board_state(edit_date);
	}
}
