package kh.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.ReviewDAO;
import kh.pet.dto.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO rwdao;
	
	public int insert(ReviewDTO rwdto)throws Exception{
		return rwdao.insert(rwdto);
	}

	public int delete(int rw_seq, String rw_parent_seq) throws Exception{
		return rwdao.delete(rw_seq,rw_parent_seq);
	}
	
	public int selectCnt(String rw_parent_seq) throws Exception{
		return rwdao.selectCnt(rw_parent_seq); 
	}
	
	public List<ReviewDTO> selectByParent(String rw_parent_seq) throws Exception{
		return rwdao.selectByParent(rw_parent_seq);
	}
}
