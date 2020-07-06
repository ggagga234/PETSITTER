package kh.pet.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dto.PetsitterDTO;
import kh.pet.service.PetsitterService;

@Controller
@RequestMapping("/petsitter")
public class PetsitterController {
	
	@Autowired
	private PetsitterService psservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/petsitter_register_form")
	public String petsitter_register_form() {
		return "/petsitter_board/petsitter/petsitter_register_form";
	}
	
	@RequestMapping("/mypage")
	public String petsitter_mypage() {
		return "/petsitter_board/petsitter/mypage";
	}
	
	@RequestMapping("/insertProc")
	public String insertProc(HttpServletRequest req, PetsitterDTO psdto, MultipartFile[] files) throws Exception{
		String realPath=session.getServletContext().getRealPath("upload");
		for(int i=0;i<files.length;i++) {
			if(!files[i].isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String img_oriName = files[i].getOriginalFilename();
				String img_sysName = uuid.toString()+"_"+img_oriName;
				
				if(i==0) {
					psdto.setPs_img(img_sysName);
				} 
				if(i==1) {
					psdto.setPs_license_img(img_sysName);
				}
			files[i].transferTo(new File(realPath+"/"+img_sysName));
			}
		}
		psservice.insert(psdto);
		return "redirect:outputSingle";
	}
	
	@RequestMapping("/outputSingle")
	public String outputSingle(Model model,PetsitterDTO psdto) throws Exception{
		//String ps_id = ((MemberDTO)session.getAttribute("login_Info")).getMem_id();
		String ps_id = "test02";
		psdto = psservice.selectById(ps_id);

		model.addAttribute("petsitterInfo",psdto);
		return "/petsitter_board/petsitter/petsitter_register_view";
	}
}
