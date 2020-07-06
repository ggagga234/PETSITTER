package kh.pet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.pet.dto.ReviewDTO;
import kh.pet.service.PetsitterService;
import kh.pet.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService rwservice;
	@Autowired
	private PetsitterService psservice;
	
	@RequestMapping("/deleteProc")
	public String deleteProc(int rw_seq, String rw_parent_seq) throws Exception{
		rwservice.delete(rw_seq,rw_parent_seq);
		return "SUCCESS";
	}
	
	//AJAX부분
	@RequestMapping(value="/insertProc", method=RequestMethod.POST)
	@ResponseBody
	public String insertProc(ReviewDTO rwdto) throws Exception{
		rwservice.insert(rwdto);
		psservice.update_star(rwdto);
		return "SUCCESS";
	}
	
	@RequestMapping(value="/selectReviewList", method=RequestMethod.POST)
	@ResponseBody
	public List<ReviewDTO> selectReviewList(String psb_seq) throws Exception{
		System.out.println(psb_seq);
		List<ReviewDTO> rw_list = rwservice.selectByParent(psb_seq);
		return rw_list;
	}
	

	
}
