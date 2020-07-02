package kh.pet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetDto;
import kh.pet.service.Petservice;

@Controller
@RequestMapping("/mb/")
public class Mb_boardController {

	@Autowired
	private Petservice service; 
	//	반려인 등록게시판 정보 출력	
	@RequestMapping("home")
	public String home(Model m) {
		List<PetDto> list = service.Petselect();
		String add = "천호대로 79길 31";
		m.addAttribute("list", list);
		m.addAttribute("add", add);
		return "mb_board/board_register";
	}

	//	예약등록 - 1
	@RequestMapping("index")
	public String index(MemboardDto mdto) {
		mdto.setMb_pet_name("aaaaa");
		String id = "a";
		System.out.println(mdto.getMb_service());
		mdto.setMb_writer(id);
		service.Memboardinsert(mdto);		
		return "redirect:redlist";
	}
	
	
	// 등록뷰 보드seq값추가해줘야함	
	@RequestMapping("redlist")
	public String redlist(Model m) {
		String add = "천호대로 79길 31";
		String id = "a";
		MemboardDto mlist = service.redlist();
		System.out.println(mlist.getMb_service());
		String[] servicearr = mlist.getMb_service().split(",");
		String[] timearr = mlist.getMb_time().split(",");
		String[] petnamearr = mlist.getMb_pet_name().split(",");
		List<String> times = new ArrayList<>();
		List<String> pettype = new ArrayList<>();
		List<String> petphoto = new ArrayList<>();
		List<String> services = new ArrayList<>();
		List<String> timetype = new ArrayList<>();
		for(String time : timearr) {
			times.add(service.gettime(time));
			timetype.add(time);
		}
		for(String petname : petnamearr) {
			pettype.add(service.getpettype(petname));
		}
		for(String petname : petnamearr) {
			petphoto.add(service.petphoto(petname));
		}
		for(String service : servicearr) {
			services.add(service);
		}

		m.addAttribute("times", times);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", id);
		m.addAttribute("petphoto", petphoto);
		m.addAttribute("timetype", timetype);
		return "mb_board/board";
	}

	@RequestMapping("modified")
	public String redlist_modified(Model m,String mb_seq) {
		MemboardDto modlist = service.modlist(mb_seq);
		String[] petnamearr = modlist.getMb_pet_name().split(",");
		String[] servicearr = modlist.getMb_service().split(",");
		String[] timearr = modlist.getMb_time().split(",");
		List<String> times = new ArrayList<>();
		List<String> petnames = new ArrayList<>();
		List<String> services = new ArrayList<>();

		for(String time : timearr) {
			times.add(time);
		}

		for(String service : servicearr) {
			services.add(service);
		}

		for(String petname : petnamearr) {
			petnames.add(petname);
		}


		List<PetDto> list = service.Petselect();

		String add = "천호대로 79길 31";
		m.addAttribute("list", list);
		m.addAttribute("add", add);	
		m.addAttribute("modlist", modlist);	
		m.addAttribute("times", times);	
		m.addAttribute("petnames", petnames);	
		m.addAttribute("services", services);

		return "mb_board/board_Modified";
	}

	@RequestMapping("modified_con")
	public String modified_con(MemboardDto mdto) {
		service.Memboardupdate(mdto);	
		return "redirect:redlist";
	}

	@RequestMapping("mb_board")
	public String mb_board(Model m,HttpServletRequest req) throws Exception{
		 int cpage = 1;
		 try {
	         cpage= Integer.parseInt(req.getParameter("cpage"));
	      } catch(Exception e) {}

		List<MemboardDto> mblist = service.mb_boardList(cpage);
		System.out.println(mblist.size());
		for(MemboardDto mb : mblist) {
			if(mb.getMb_petphoto() != null) {
				String[] photoarr = mb.getMb_petphoto().split(",",-1);
				mb.setPhoto(photoarr);
			}
		}
		String navi = service.getPageNavi(cpage);
		m.addAttribute("navi", navi);
		m.addAttribute("mblist", mblist);
		return "mb_board/board_list";
	}
}
