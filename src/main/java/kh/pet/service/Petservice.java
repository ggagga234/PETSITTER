package kh.pet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.staticInfo.Mb_Configuration;
import kh.pet.dao.PetDao;
import kh.pet.dto.MemboardDto;
import kh.pet.dto.PetDto;

@Service
public class Petservice {
	@Autowired
	private PetDao dao;
	
	public List<PetDto> Petselect(){
		return dao.Petselect();
	}
	
	public int Memboardinsert(MemboardDto mdto) {
		return dao.Memboardinsert(mdto);
	}
	
	public MemboardDto redlist(String mb_seq){
		return dao.redlist(mb_seq);
	}
	
	public String petphoto(String  mb_pet_name) {
		return dao.petphoto(mb_pet_name);
	}
	
	public String gettime(String time) {
		return dao.gettime(time);
	}
	
	public String getpettype(String petname) {
		System.out.println(dao.getpettype(petname));
		return dao.getpettype(petname);
	}
	
	public MemboardDto modlist(String mb_seq) {
		return dao.modlist(mb_seq);
	}
	
	public int Memboardupdate(MemboardDto mdto) {
		return dao.Memboardupdate(mdto);
	}
	
	public int deleteboard(MemboardDto mdto) {
		System.out.println("삭제 페이지 번호 : "+mdto.getMb_seq());
		return dao.deleteboard(mdto);
	}
	
	public String seqid(String id) {
		return dao.seqid(id);
	}
	
	public String addselec(String id) {
		return dao.addselec(id);
	}
	
	public int applyup(MemboardDto mbdto) {
		return dao.applyup(mbdto);
	}
	
	public List<MemboardDto> mb_boardList(int cpage){
		int start =  cpage*Mb_Configuration.recordCountPerPage-(Mb_Configuration.recordCountPerPage-1);
		int end = start + (Mb_Configuration.recordCountPerPage-1);
		
		Map<String,Integer> con = new HashMap<String,Integer>();
		con.put("start",start);
		con.put("end",end);
		return dao.mb_boardList(con);
	}
	
	public String getPageNavi(int currentPage) throws Exception {
		// int currentPage 현재 내가 있는 페이지 번호
		
		int recordTotalCount = dao.getArticleCount();//총 게시물의 개수
		
//		int recordCountPerPage = 10;// 한 페이지에 게시글 몇개를 보여줄 것인가?
//		
//		int naviCountPerpage = 10; // 한 페이지에서 네비게이터 몇개를 보여줄 것인가?
		
		int pageTotalCount = 0; // 전체 페이지 개수
		
		if(recordTotalCount % Mb_Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Mb_Configuration.recordCountPerPage + 1;
			//나머지가있으면 페이지 게시글이 넘처 나머지값이 있으면 +1을 해줘 페이지를 추가해준다. 
		}else {
			pageTotalCount = recordTotalCount / Mb_Configuration.recordCountPerPage;//나머지값이 없으면 더할 필요가없다
		}
		
	
		
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}//공격자가 currentPage 을 변조할 경우에 대한 보안 코드
		
		int startNavi = (currentPage - 1) / Mb_Configuration.naviCountPerPage * Mb_Configuration.naviCountPerPage + 1;
		//어느페이지를 갈때 해당 페이지 값의 맞는 네비가 범위가 출력  1,11,21,31
		int endNavi = startNavi + (Mb_Configuration.naviCountPerPage -1);

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
	
		if(startNavi == 1) {needPrev=false;}
		if(endNavi == pageTotalCount) {needNext = false;}
		
		StringBuilder sb = new StringBuilder();
		
		if(needPrev) {sb.append("<a href='/mb/mb_board?cpage="+(startNavi-1)+"'>< </a>");}
		for(int i = startNavi;i<= endNavi;i++) {
			sb.append("<a href='/mb/mb_board?cpage="+i+"'>"+i+"</a>");
		}
		if(needNext) {sb.append("<a href='/mb/mb_board?cpage="+(endNavi+1)+"'> ></a>");}
		
		return sb.toString();
	}
}
