package kh.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.PetsitterDAO;
import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.ReviewDTO;

@Service
public class PetsitterService {

	@Autowired
	private PetsitterDAO psdao;
	
	
	public int insert(PetsitterDTO psdto)throws Exception{
		return psdao.insert(psdto);
	}
	
	public int update_star(ReviewDTO rwdto)throws Exception{
		return psdao.update_star(rwdto);
	}
	
	public PetsitterDTO selectById(String ps_id)throws Exception {
		//System.out.println("정말 가자 : "+psdao.selectById(ps_id).getPs_license_img());
		return psdao.selectById(ps_id);
	}
}
