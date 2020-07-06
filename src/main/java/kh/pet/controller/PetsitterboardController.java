package kh.pet.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dto.PetsitterDTO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.ReviewDTO;
import kh.pet.dto.TotboardDTO;
import kh.pet.service.PetsitterService;
import kh.pet.service.PetsitterboardService;
import kh.pet.service.ReviewService;

@Controller
@RequestMapping("/board/")
public class PetsitterboardController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private PetsitterService psservice;
	@Autowired
	private PetsitterboardService psbservice;
	@Autowired
	private ReviewService rwservice;
	
	//등록글 페이지 보여주기(등록글 + 댓글 함께 보여주기)
	@RequestMapping("outputSingle")
	public String outputSingle(String psb_writer,String psb_seq,Model model,TotboardDTO totdto ) throws Exception{
		totdto = psbservice.selectBoard(psb_writer,psb_seq);
		model.addAttribute("tot_Info",totdto);
		return "petsitter_board/board/board_single_view";
	}
	
	@RequestMapping("outputList")
	public String outputList(HttpServletRequest req, Model model) throws Exception{
		int cpage=1;
		try {
			cpage= Integer.parseInt(req.getParameter("cpage"));
		} catch(Exception e) {}
		List<PetsitterboardDTO> list =psbservice.outputList(cpage); // 한페이지에 출력되는 게시물 list
		String pageNavi = psbservice.getPageNavi(cpage); //네비바
		model.addAttribute("list",list);
		model.addAttribute("pageNavi",pageNavi);
		return "petsitter_board/board/board_list";
	}
	
	@RequestMapping("board_register")
	public String board_register(Model model, PetsitterDTO psdto) {
		model.addAttribute("petsitter_Info", psdto);
 		return "petsitter_board/board/board_register";
	}

	@RequestMapping("board_single_view")
	public String board_single_view(Model model,TotboardDTO totdto)throws Exception{
		model.addAttribute("tot_Info",totdto);
		System.out.println("타임:"+totdto.getPsb_time());
		return "petsitter_board/board/board_single_view";
	}
	
	@RequestMapping("output")
	public String output(Model model)throws Exception{
		String ps_id = "test02";
		PetsitterDTO psdto = psservice.selectById(ps_id);
		model.addAttribute("petsitter_Info", psdto);
		return"petsitter_board/board/board_register";
	}
	
	//게시글 등록
	@RequestMapping("insertProc")
	public String insertProc(HttpServletRequest req,TotboardDTO totdto, MultipartFile file, Model model)throws Exception {
		//String ps_id = ((MemberDTO)session.getAttribute("login_Info")).getMem_id();
		//System.out.println(ps_id);
		String realPath=session.getServletContext().getRealPath("upload");
		UUID uuid = UUID.randomUUID();
		String thumb_oriName = file.getOriginalFilename();
		String nextSeq = psbservice.selectNextSeq();
		System.out.println("nextSeq:"+nextSeq);
		totdto.setPsb_seq(nextSeq);
		totdto.setPsb_thumb(uuid.toString()+"_"+thumb_oriName);
		psbservice.insert(totdto);
		model.addAttribute("tot_Info",totdto);
		model.addAttribute("psb_writer",totdto.getPsb_writer());
		model.addAttribute("psb_seq",totdto.getPsb_seq());
		file.transferTo(new File(realPath+"/"+totdto.getPsb_thumb()));
		return "redirect:outputSingle";
	}
		
}
