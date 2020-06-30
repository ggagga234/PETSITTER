package kh.pet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
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
	public String go_admin_petsiter() {
		return "admin/pet_siter_management";
	}
	
	@RequestMapping("black")
	public String go_admin_black() {
		return "admin/blacklist";
	}
	
	@RequestMapping("board")
	public String go_admin_board() {
		return "admin/board_management";
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