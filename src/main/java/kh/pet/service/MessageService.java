package kh.pet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.pet.dao.MessageDAO;
import kh.pet.dto.MessageDTO;
import kh.pet.staticInfo.Message_Configuration;


@Service
public class MessageService {
	@Autowired
	private MessageDAO dao;
	
	@Transactional("txManager")
	public int sendMessage(MessageDTO dto) {
		int re = dao.searchMem(dto);
		if(re ==1) {
			dao.sendMessage(dto);
			dao.recieveMessage(dto);
			return 1;
		}
		else {
			System.out.println(re);
			return 0;
		}
	}
	
	public MessageDTO sendview(int seq) {
		return dao.sendView(seq);
	}
	
	
	@Transactional("txManager")
	public MessageDTO recieveview(int seq) {
		MessageDTO dto = dao.recieveView(seq);
		dao.recieveSecendView(seq);
		dao.sendfirstView(seq);
		return dto;
	}
	
	public int deletesendMessage(int seq) {
		return dao.senddelete(seq);
	}
	
	public int deleterecieveMessage(int seq) {
		return dao.recievedelete(seq);
	}
	
	public List<MessageDTO> sendmessagelist(int cpage,String id){
		int start = cpage*Message_Configuration.RECORD_COUNT_PER_PAGE - (Message_Configuration.RECORD_COUNT_PER_PAGE-1);
		int end = start + (Message_Configuration.RECORD_COUNT_PER_PAGE-1);
		Map<String, Object> tmp = new HashMap<String, Object>();
		tmp.put("start",start);
		tmp.put("end", end);
		tmp.put("id",id);
		return dao.sendMessagelist(tmp);
	}	
	
	public String sendPageNavi(int currentPage, String id){
		int recordTotalCount = this.dao.sendgetAritcleCount(id); //총 게시물의 갯수.
		int pageTotalCount = 0; //전체 페이지의 갯수

		if(recordTotalCount%Message_Configuration.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Message_Configuration.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Message_Configuration.RECORD_COUNT_PER_PAGE +1;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}//공격자가 currentPage를 공격할 때를 대비한 보안 코드

		int startNavi = (currentPage -1) / Message_Configuration.NAVI_COUNT_PAGE *Message_Configuration.NAVI_COUNT_PAGE + 1;
		int endNavi = startNavi +Message_Configuration.NAVI_COUNT_PAGE - 1;

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
			sb.append("<a href=\"/message/sendlist?cpage="+(startNavi-1)+"\"class=\"badge badge-pill badge-info\"><</a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a href=\"/message/sendlist?cpage="+i+"\"class=\"badge badge-pill badge-info\">"+i+"</a>");	
		}
		if(needNext) {
			sb.append("<a href=\"/message/sendlist?cpage="+(endNavi+1)+"\"class=\"badge badge-pill badge-info\">></a>");
		}
		return sb.toString();
	}
	
	
	@Transactional("txManager")
	public List<MessageDTO> recievemessagelist(int cpage,String id){
		int start = cpage*Message_Configuration.RECORD_COUNT_PER_PAGE - (Message_Configuration.RECORD_COUNT_PER_PAGE-1);
		int end = start + (Message_Configuration.RECORD_COUNT_PER_PAGE-1);
		Map<String, Object> tmp = new HashMap<String, Object>();
		tmp.put("start",start);
		tmp.put("end", end);
		tmp.put("id",id);
		List<MessageDTO> list = dao.recieveMessagelist(tmp);
		dao.recievefirstView(id);
		return list;
	}	
	
	public String recievePageNavi(int currentPage, String id){
		int recordTotalCount = this.dao.recievegetAritcleCount(id); //총 게시물의 갯수.
		int pageTotalCount = 0; //전체 페이지의 갯수

		if(recordTotalCount%Message_Configuration.RECORD_COUNT_PER_PAGE == 0) {
			pageTotalCount = recordTotalCount / Message_Configuration.RECORD_COUNT_PER_PAGE;
		}else {
			pageTotalCount = recordTotalCount / Message_Configuration.RECORD_COUNT_PER_PAGE +1;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}//공격자가 currentPage를 공격할 때를 대비한 보안 코드

		int startNavi = (currentPage -1) / Message_Configuration.NAVI_COUNT_PAGE *Message_Configuration.NAVI_COUNT_PAGE + 1;
		int endNavi = startNavi +Message_Configuration.NAVI_COUNT_PAGE - 1;

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
			sb.append("<a href=\"/message/recievelist?cpage="+(startNavi-1)+"\"class=\"badge badge-pill badge-info\"><</a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a href=\"/message/recievelist?cpage="+i+"\" class=\"badge badge-pill badge-info\">"+i+"</a>  ");	
		}
		if(needNext) {
			sb.append("<a href=\"/message/recievelist?cpage="+(endNavi+1)+"\"class=\"badge badge-pill badge-info\">></a>");
		}
		return sb.toString();
	}
}
