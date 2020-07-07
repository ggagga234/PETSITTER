package kh.pet.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.PetsitterboardDAO;
import kh.pet.dto.PetsitterboardDTO;
import kh.pet.dto.TotboardDTO;
import kh.pet.staticInfo.PetSitterConfiguration;

@Service
public class PetsitterboardService {

	@Autowired
	private PetsitterboardDAO psbdao;
	
	public String selectNextSeq() throws Exception{
		return psbdao.selectNextSeq();
	}
	
	public int selectCnt(String psb_writer) throws Exception{
		System.out.println("service에서:"+psb_writer);
		return psbdao.selectCnt(psb_writer);
	}
	
	public int insert(TotboardDTO totdto) throws Exception{
		return psbdao.insert(totdto);
	}
	
	public List<PetsitterboardDTO> outputList(int cpage)throws Exception{
		int start = cpage*PetSitterConfiguration.recordPerPage - (PetSitterConfiguration.recordPerPage-1);
		int end = start +(PetSitterConfiguration.recordPerPage-1);
		HashMap<String, Integer> page = new HashMap<String, Integer>();
		 page.put("start", start);
		 page.put("end", end);
		 return psbdao.selectByPage(page);
	}
	
	public String getPageNavi(int cpage)throws Exception{
		int recordTotalCnt = psbdao.selectAllCnt();
		int recordPerPage = 10;
		int naviPerPage = 5;
		int totalPage = 0;
		
		if((recordTotalCnt%recordPerPage)>0) {
			totalPage = recordTotalCnt/recordPerPage+1;
		} else {
			totalPage = recordTotalCnt/recordPerPage;
		}
		
		if(cpage<1) {cpage=1;}
		else if(cpage>totalPage) {cpage=totalPage;}
		
		int startNavi = (cpage-1)/naviPerPage*naviPerPage+1;
		int endNavi = startNavi + (naviPerPage-1);
		
		if(endNavi>totalPage) {endNavi=totalPage;}
		 
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {needPrev=false;}
		if(endNavi==totalPage) {needNext=false;}
		
		StringBuilder sb = new StringBuilder();
		if(needPrev) {sb.append("<a href='/board/outputList?cpage="+(startNavi-1)+"'>< </a>");}
		for(int i=startNavi;i<=endNavi;i++) {sb.append("<a href='/board/outputList?cpage="+i+"'>"+i+"</a>");}
		if(needNext) {sb.append("<a href='/board/outputList?cpage="+(endNavi+1)+"'>></a>");}
		
		return sb.toString();
	}
	
	public TotboardDTO selectBoard(String psb_writer,String psb_seq) throws Exception{
		return psbdao.selectBoard(psb_writer,psb_seq);
	}
}
