package kh.pet.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import kh.pet.dto.MemberDTO;
import kh.pet.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;	
	
	@ResponseBody
	@RequestMapping("isExistId")
	public String isExistId(String ps_id)throws Exception{
		String result =  mservice.isExistId(ps_id);
		if(result.contentEquals("true")) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping("/signup")
	public String signup() throws Exception { //가입 페이지로 이동

		return "/member/signup";
	}

	@ResponseBody 
	@RequestMapping("/idDuplCheck")
	public int idDuplCheck(String id) throws Exception {
		int result = mservice.idDuplCheck(id);
		return result;
	}

	@ResponseBody 
	@RequestMapping("/emailDuplCheck")
	public int emilDuplCheck(String email) throws Exception {
		int result = mservice.emailCheck(email);
		return result;
	}



	@RequestMapping(value = "/signupProc", method = RequestMethod.POST)
	public String signupProc(MemberDTO mdto) throws Exception{

		mservice.signup(mdto);

		return "/member/signup_end";			

	}

	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String authKey, String userid, Model model) throws IOException {

		int verify = mservice.verify(userid);

		if(verify > 0) {			
			model.addAttribute("msg" , "이미 인증하셨습니다.");
			return "/member/emailconfirm"; 
		}

		if(authKey == "" || userid == "" || (authKey == "" && userid == "")) {

			model.addAttribute("msg", "인증키가 잘못되었습니다. 다시 인증해 주세요");			
			return "/member/emailconfirm";
		}

		int result= mservice.emailConfirm(authKey, userid);		

		if(result <= 0) {			
			model.addAttribute("msg", "잘못된 접근 입니다. 다시 인증해 주세요");
			return "/member/emailconfirm";
		}		
		return "/member/emailconfirm";
	}
	
	//로그인 페이지 연결
	@RequestMapping("/login")
	public String login() {
		return "/member/login";		
	}
	
	
	//로그인
	@RequestMapping(value="/loginProc", method=RequestMethod.POST)
	public String loginProc( String mem_id, String mem_pw, Model model) throws Exception {

		int econfirm = mservice.verify(mem_id); //이메일 인증여부
				
		if(econfirm <= 0) {			
			model.addAttribute("noemail", "Email 인증 후 로그인 하세요.");		
			return "/member/login";
		}else {

			String pw1 = mservice.getSHA512(mem_pw);

			Map<String, String> map = new HashMap<String, String>();
			map.put("id", mem_id);
			map.put("pw", pw1);


			boolean result = mservice.login(map);
			if(result) {
				MemberDTO mdto = mservice.loginInfo(mem_id);
				session.setAttribute("loginInfo", mdto);			
				
			}else {
				model.addAttribute("loginfail", "ID 또는 비밀번호를 확인하세요.");
				return "/member/login";
			}
			
		}
		return "redirect:/";

	}
	
	//아이디 찾기 페이지 연결
	@RequestMapping("/findid")
	public String findid() {
		return "/member/findid";		
	}
	
	//아이디 찾기 ajax
	@ResponseBody
	@RequestMapping(value = "/findIdProc", method = RequestMethod.POST)
	public String findID(String email) {
		
		String id= mservice.findID(email);
		//System.out.println("id는? "+id);
		
		JsonObject jobj = new JsonObject();
		jobj.addProperty("id", id);
		
		String result = jobj.toString();
		// System.out.println(result);
		 
		return result;
			
	}

	//비번 찾기 페이지 연결
	@RequestMapping("/findPw")
	public String findpw() {
		return "/member/findpw";		
	}
	
	@RequestMapping(value = "/findPwProc", method = RequestMethod.POST)
	@ResponseBody
	public int findPw(String id, String email) throws Exception {
		
		int result = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		
		int chkpw = mservice.findPw(map);
		
		if(chkpw > 0) {			
			result = mservice.replacepw(id, email);
			return result;
		}		
		return result;	
	}
	
	

	
	//예외오류처리.
	@ExceptionHandler
	public String exceptionHandler(Exception e) {		
		System.out.println("Exception Handler : 에러가 발생했습니다.");
		return "error";
	}
	
	@ExceptionHandler
	public String exceptionHandler(NumberFormatException e) {		
		System.out.println("NFException Handler : 에러가 발생했습니다.");
		return "error";
	}
	@ExceptionHandler
	public String exceptionHandler(NullPointerException e) {		
		System.out.println("NULLException Handler : 에러가 발생했습니다.");
		return "error";
	}
}
