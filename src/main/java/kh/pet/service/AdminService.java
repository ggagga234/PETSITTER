package kh.pet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.pet.dao.AdminDAO;
import kh.pet.dao.MessageDAO;
import kh.pet.dto.MemberDTO;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.MessageDTO;
import kh.pet.dto.PetsitterDTO;
import kh.pet.staticInfo.Admin_Configuration;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private MessageDAO mdao;
	
	//게시판 관리
	
	public int board_stop(String seq, String boardType,String state) {
		Map<String, Object> edit_date = new HashMap<String, Object>();
		edit_date.put("seq", seq);
		edit_date.put("boardType", boardType);
		edit_date.put("state", state);
		return dao.board_state(edit_date);
	}
	
	public List<PetsitterDTO> petsitter(){
		return dao.petsitter();
	}
	
	//펫 시터 신청서 관리
	
	@Transactional("txManager")
	public int petaccept(String id) {
		MessageDTO dto = new MessageDTO();
		dto.setMsg_reciever(id);
		dto.setMsg_title("펫 시터 관련 글입니다.");
		dto.setMsg_contents("승인되었습니다. 지금부터는 펫 시터로 활동이 가능합니다.");
		dto.setMsg_sender("관리자");
		mdao.sendMessage(dto);
		return dao.petaccept(id);
	}
	
	//회원 관리
	
	public List<MemberDTO> member(int cpage){
		int start = cpage*Admin_Configuration.member_RECORD_COUNT_PER_PAGE - (Admin_Configuration.member_RECORD_COUNT_PER_PAGE-1);
		int end = start + (Admin_Configuration.member_RECORD_COUNT_PER_PAGE-1);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end", end);
		return dao.memberlist(map);
	}
	
	public String memberPagNavi(int currentPage){
		int recordTotalCount = this.dao.membercount(); //총 게시물의 갯수.
		int pageTotalCount = 0; //전체 페이지의 갯수

		if(recordTotalCount%Admin_Configuration.member_RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Admin_Configuration.member_RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Admin_Configuration.member_RECORD_COUNT_PER_PAGE +1;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage -1) / Admin_Configuration.member_NAVI_COUNT_PAGE *Admin_Configuration.member_NAVI_COUNT_PAGE + 1;
		int endNavi = startNavi +Admin_Configuration.member_NAVI_COUNT_PAGE - 1;

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		StringBuilder sb = new StringBuilder();

		if(startNavi ==1) {
			needPrev =false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}

		if(needPrev) {
			sb.append("<a href=\"/admin/memberlist?cpage="+(startNavi-1)+"\"class=\"badge badge-pill badge-info\"><</a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a href=\"/admin/memberlist?cpage="+i+"\"class=\"badge badge-pill badge-info\">"+i+"</a>");	
		}
		if(needNext) {
			sb.append("<a href=\"/admin/memberlist?cpage="+(endNavi+1)+"\"class=\"badge badge-pill badge-info\">></a>");
		}
		return sb.toString();
	}
	
	//예약 관리 페이지
	public List<MemboardDto> re_memboard(){
		return dao.re_memboard();
	}
	
}
