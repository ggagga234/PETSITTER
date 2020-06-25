package kh.pet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.pet.dto.MessageDTO;

import kh.pet.service.MessageService;

@Controller
@RequestMapping("/message/")
public class MessageController {
	@Autowired
	private HttpSession session;

	@Autowired
	private MessageService service;

	@RequestMapping("writepage")
	public String messageWritepage() {
		return "message/messageWrite";	
	}

	@RequestMapping("write")
	public void messageWrite(MessageDTO dto,HttpServletResponse response) {
		dto.setMsg_sender((String)session.getAttribute("id"));
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
				out.println("<script>alert('받는 이를 확인해 주시길 바랍니다.'); history.go(-1);</script>");
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
	public String recieveList() {
		String id = (String)session.getAttribute("id");
		List<MessageDTO> list = service.recievelist(id);
		session.setAttribute("recievelist", list);
		return "message/messageMain";
	}

	@RequestMapping("recieveMessageView")
	public String recieveMessageView(int seq) {
		String id = (String)session.getAttribute("id");
		MessageDTO dto = service.recieveview(seq);
		session.setAttribute("viewmessage", dto);
		return "message/recieveMessageView";
	}

	@RequestMapping("sendlist")
	public String messagesend() {
		String id = (String)session.getAttribute("id");
		List<MessageDTO> send = service.sendlist(id);
		session.setAttribute("sendlist", send);
		return "message/messageSendcollection";	
	}

	@RequestMapping("senddelete")
	public void senddelete(int seq,HttpServletResponse response) {
		int re = service.deletesendMessage(seq);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			if(re>0) {
				out.println("<script>alert('성공적으로 삭제했습니다.');location.href = 'message/messageSendcollection'</script>");
			}
			else {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("recievedelete")
	public void recievedelete(int seq){
		int re = service.deleterecieveMessage(seq);
	}
}
