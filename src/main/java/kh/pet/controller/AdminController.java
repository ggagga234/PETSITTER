package kh.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetsitterDTO;
import kh.pet.service.AdminService;
import kh.pet.service.Petservice;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private Petservice pet_service; 
	
	@Autowired
	private AdminService admin_service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("main")
	public String go_admin_main() {
		return "admin/index";
	}
	
	@RequestMapping("member")
	public String go_admin_member() {
		return "admin/member_management";
	}
	
	@RequestMapping("reservation")
	public String go_admin_reservation() {
		
		return "admin/reservation_management";
	}
	
	@RequestMapping("petsiter")
	public String go_admin_petsiter(Model m) {
		List<PetsitterDTO> pet =  admin_service.petsitter();
		m.addAttribute("petsitter", pet);
		return "admin/pet_siter_management";
	}
	
	@RequestMapping("black")
	public String go_admin_black() {
		return "admin/blacklist";
	}
	
	@RequestMapping("board")
	public String go_admin_board(Integer cpage) {
		return "admin/board_management";
	}
	
	@RequestMapping("boardselect")
	public String boardselect(String boardtype, Integer cpage) {
		session.removeAttribute("list");
		session.removeAttribute("boardtype");
		if(boardtype.contentEquals("mb_board")) {
			if(cpage == null) {
				cpage = 1;
			}
			List<MemboardDto> mblist = pet_service.mb_boardList(cpage);
			session.setAttribute("list", mblist);
		}
		session.setAttribute("boardtype", boardtype);
		return "admin/board_management";
	}
	
	@RequestMapping("boardblack")
	public void boardblack(String state, int seq,HttpServletResponse response) {
		String boardtype = (String)session.getAttribute("boardtype");
		admin_service.board_stop(seq, boardtype, state);
		try {
			response.sendRedirect("/admin/boardselect?boardtype="+boardtype);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("declaration")
	public String go_admin_declaration() {
		return "admin/Declaration_management";
	}
	
	@RequestMapping("cash")
	public String go_admin_cash() {
		return "admin/cash_management";
	}
	
	@RequestMapping("pass")
	public String go_admin_pass() {
		return "admin/admin_pasword";
	}
	
	@RequestMapping("mess")
	public String go_admin_mess() {
		return "admin/message_management";
	}
	
	@RequestMapping("chat")
	public String go_admin_chat() {
		return "admin/index";
	}
}
