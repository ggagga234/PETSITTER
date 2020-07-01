package kh.pet.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.pet.dto.MessageDTO;
import kh.pet.filter.xssfilter;
import kh.pet.service.MessageService;

@Controller
@RequestMapping("/message/")
public class MessageController {
	@Autowired
	private HttpSession session;

	@Autowired
	private MessageService service;

	@Autowired
	private xssfilter xss;
	
	@RequestMapping("writepage")
	public String messageWritepage() {
		return "message/messageWrite";	
	}
	
	@RequestMapping("rewritepage")
	public String messagerewirte() {
		return "message/messagerewirte";
	}
	
	@RequestMapping("checkreciver")
	public void checkreciver(String reciever,HttpServletResponse response) {
		int re = service.searchMen(reciever);
		JSONObject jobj = new JSONObject();
		jobj.put("re", re) ;
		try {
			response.getWriter().append(jobj.toString());
		} catch (IOException e) {
		}
	}
	
	@RequestMapping("write")
	public void messageWrite(MessageDTO dto,HttpServletResponse response) {
		dto.setMsg_sender((String)session.getAttribute("id"));
		dto.setMsg_title(xss.cleanXSS(dto.getMsg_title()));
		int re = service.sendMessage(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			if(re==1) {
				out.println("<script> location.href='/message/recievelist';</script>");
				out.flush();
			}
			else {
				out.println("<script>alert('메세지 전송에 실패했습니다.'); history.go(-1);</script>");
				out.flush();
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@RequestMapping("sendViewmessage")
	public String sendMessageView(int seq) {
		MessageDTO dto = service.sendview(seq);
		session.setAttribute("viewmessage", dto);
		return "message/sendMessageView";
	}

	@RequestMapping("recievelist")
	public String messagerecievelist(Integer cpage) {
		String id = (String)session.getAttribute("id");
		List<MessageDTO> recievelist = new ArrayList<MessageDTO>();
		if(cpage == null) {
			cpage = 1;
		}
		recievelist = service.recievemessagelist(cpage, id);
		String recievenavi = service.recievePageNavi(cpage, id);
		session.setAttribute("recievelist", recievelist);
		session.setAttribute("recievenavi", recievenavi);
		return "message/messageMain";
	}

	@RequestMapping("recieveMessageView")
	public String recieveMessageView(int seq) {
		MessageDTO dto = service.recieveview(seq);
		session.setAttribute("viewmessage", dto);
		return "message/recieveMessageView";
	}

	
	@RequestMapping("sendlist")//보낸 메세지함 리스트
	public String messagesendlist(Integer cpage) {
		String id = (String)session.getAttribute("id");
		List<MessageDTO> sendlist = new ArrayList<MessageDTO>();
		if(cpage == null) {
			cpage = 1;
		}
		sendlist = service.sendmessagelist(cpage, id);
		String sendnavi = service.sendPageNavi(cpage, id);
		session.setAttribute("sendlist", sendlist);
		session.setAttribute("sendnavi", sendnavi);
		return "message/messageSendcollection";
	}

	@RequestMapping("senddelete")
	public void senddelete(int seq,String recieve,HttpServletResponse response) {
		String send = (String)session.getAttribute("id");
		int re = service.deletesendMessage(seq,send,recieve);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			if(re>0) {
				out.println("<script>alert('성공적으로 삭제했습니다.');location.href = '/message/sendlist'</script>");
			}
			else {
				out.println("<script>alert('이상한 경로로 삭제할려고 들지마라');location.href = '/message/recievelist'</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("recievedelete")
	public void recievedelete(int seq,String send,HttpServletResponse response){
		String reciever = (String)session.getAttribute("id");
		int re = service.deleterecieveMessage(seq,send,reciever);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			if(re>0) {
				out.println("<script>alert('성공적으로 삭제했습니다.');location.href = '/message/recievelist'</script>");
			}
			else {
				out.println("<script>alert('이상한 경로로 삭제할려고 들지마라');location.href = '/message/recievelist'</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("summerimage")
	public void summernoteimage(MultipartFile uploadFile,HttpServletResponse response) throws Exception{
		String upload = session.getServletContext().getRealPath("summerimageup/");
		File uploadPathF = new File(upload);
		if(!uploadPathF.exists()) {
			uploadPathF.mkdir();
		}
		UUID uuid = UUID.randomUUID();
		String sysName = uuid+"_"+uploadFile.getOriginalFilename();
		File targetLoc = new File(uploadPathF +"/"+sysName);
		uploadFile.transferTo(targetLoc);
		JSONObject jobj = new JSONObject();
		jobj.put("url", "/summerimageup/"+sysName);
		response.getWriter().append(jobj.toString());
	}
}
