package kh.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.MessageDAO;
import kh.pet.dto.MessageDTO;


@Service
public class MessageService {
	@Autowired
	private MessageDAO dao;
	
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
	
	public List<MessageDTO> sendlist(String id){
		return dao.sendlist(id);
	}
	
	public MessageDTO sendview(int seq) {
		return dao.sendView(seq);
	}
	
	public List<MessageDTO> recievelist(String id){
		List<MessageDTO> list = dao.recievelist(id);
		dao.recievefirstView(id);
		return list;
	}
	
	public MessageDTO recieveview(int seq) {
		dao.recieveSecendView(seq);
		dao.sendfirstView(seq);
		return dao.recieveView(seq);
	}
	
	public int deletesendMessage(int seq) {
		return dao.senddelete(seq);
	}
	
	public int deleterecieveMessage(int seq) {
		return dao.recievedelete(seq);
	}
}
