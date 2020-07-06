package kh.pet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.pet.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	
	@ResponseBody
	@RequestMapping("isExistId")
	public String isExistId(String ps_id)throws Exception{
		String result =  mservice.isExistId(ps_id);
		if(result.contentEquals("true")) {
			return "true";
		}
		return "false";
	}
}
