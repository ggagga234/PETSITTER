package kh.pet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetDto;
import kh.pet.service.Petservice;

@Controller
@RequestMapping("/mb/")
public class Mb_boardController {

	@Autowired
	private Petservice service; 
	@Autowired
	private HttpSession session;	

	//	반려인 등록게시판 정보 출력	
	@RequestMapping("home")
	public String home(Model m) {
		List<PetDto> list = service.Petselect();
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		String add = service.addselec(mdto.getMem_id());
		System.out.println(mdto.getMem_id());
		System.out.println(add);
		m.addAttribute("list", list);
		m.addAttribute("add", add);
		return "mb_board/board_register";
	}

	//	예약등록 - 1
	@RequestMapping("index")
	public String index(MemboardDto mbdto) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		System.out.println(mbdto.getMb_service());
		mbdto.setMb_writer(mdto.getMem_id());
		service.Memboardinsert(mbdto);

		return "redirect:redlist";
	}

	// 등록뷰 보드seq값추가해줘야함	
	@RequestMapping("redlist")
	public String redlist(Model m,MemboardDto mbdto) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		String add = service.addselec(mdto.getMem_id());
		String mb_seq = service.seqid(mdto.getMem_id());
		MemboardDto mlist = service.redlist(mb_seq);
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
			System.out.println(petname);
			pettype.add(service.getpettype(petname));
		}
		for(String petname : petnamearr) {

			petphoto.add(service.petphoto(petname));
		}
		for(String service : servicearr) {
			services.add(service);
		}

		System.out.println(pettype);
		System.out.println("seq : "+mlist.getMb_seq());
		m.addAttribute("times", times);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", mdto.getMem_id());
		m.addAttribute("petphoto", petphoto);
		m.addAttribute("timetype", timetype);
		return "mb_board/board";
	}

	// 수정 뷰	
	@RequestMapping("modfilist")
	public String modfilist(Model m,MemboardDto mbdto) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		String add = service.addselec(mdto.getMem_id());
		MemboardDto mlist = service.redlist(mbdto.getMb_seq());
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
			System.out.println(petname);
			pettype.add(service.getpettype(petname));
		}
		for(String petname : petnamearr) {

			petphoto.add(service.petphoto(petname));
		}
		for(String service : servicearr) {
			services.add(service);
		}

		System.out.println(pettype);
		System.out.println("seq : "+mlist.getMb_seq());
		m.addAttribute("times", times);
		m.addAttribute("mlist", mlist);
		m.addAttribute("add", add);
		m.addAttribute("services", services);
		m.addAttribute("pettype", pettype);
		m.addAttribute("id", mdto.getMem_id());
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

		String add = service.addselec(modlist.getMb_writer());
		m.addAttribute("list", list);
		m.addAttribute("add", add);	
		m.addAttribute("modlist", modlist);	
		m.addAttribute("times", times);	
		m.addAttribute("petnames", petnames);	
		m.addAttribute("services", services);

		return "mb_board/board_Modified";
	}

	@RequestMapping("modified_con")
	public String modified_con(MemboardDto mbdto,Model m) {
		System.out.println(mbdto.getMb_pet_name());
		System.out.println(mbdto.getMb_startday());
		System.out.println(mbdto.getMb_endday());
		System.out.println(mbdto.getMb_unique());
		System.out.println(mbdto.getMb_time());
		System.out.println(mbdto.getMb_service());

		service.Memboardupdate(mbdto);	
		m.addAttribute("mb_seq", mbdto.getMb_seq());
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

		System.out.println("현재페이지 : "+cpage);
		String navi = service.getPageNavi(cpage);
		m.addAttribute("navi", navi);
		m.addAttribute("mblist", mblist);
		return "mb_board/board_list";
	}

	@RequestMapping("deleteboard")
	public String deleteboard(MemboardDto mbdto) {
		service.deleteboard(mbdto);
		return "redirect:mb_board";
	}

	@RequestMapping("apply")
	public void apply(MemboardDto mbdto,HttpServletResponse response) {
		MemberDTO mdto = (MemberDTO)this.session.getAttribute("loginInfo");
		JSONObject jobj = new JSONObject();
	  
       String re = "false";
		if(!mdto.getMem_id().contentEquals(mbdto.getMb_writer())) {
			mbdto.setMb_booker(mdto.getMem_id());
			System.out.println(mbdto.getMb_writer());
			service.applyup(mbdto);
			re = "true";
		}
		jobj.put("re", re) ;
		try {
			response.getWriter().append(jobj.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
