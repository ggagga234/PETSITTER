package kh.pet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.pet.staticInfo.Log_Count;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		return "main";
	}
	@RequestMapping("login2")
	public String login(String id) {
		session.setAttribute("id", id);
		Log_Count.log_count++;
		System.out.println(Log_Count.log_count);
		return "home2";
	}
	
	@RequestMapping("tmp")
	public String tmp() {
		return "petsitter_board/home";
	}
	
	@RequestMapping("adminindex")
	public String admin() {
		return "admin/index";
	}
	
	@RequestMapping("community")
	public String community() {
		return "/";
	}
	
	@RequestMapping("/point/charge")
	public String charge() {
		return "/petsitter_board/point/charge";
	}
	
	@RequestMapping("/point/payment")
	public String payment(int mem_point,Model model) {
		model.addAttribute("point",mem_point);
		return "/petsitter_board/point/payment";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		return "member/signup";
	}
}
