package kh.pet.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MessageDTO;


@Repository
public class MessageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int sendMessage(MessageDTO dto) {
		return mybatis.insert("Messages.send",dto);
	}
	
	public int recieveMessage(MessageDTO dto) {
		return mybatis.insert("Messages.recieve",dto);
	}
	
	public int searchMem(MessageDTO dto) {
		return mybatis.selectOne("Messages.search",dto.getMsg_reciever());
	}
	
	public List<MessageDTO> sendlist(String id){ 
		return mybatis.selectList("Messages.sendlist",id);
	}
	
	public MessageDTO sendView(int seq) {
		return mybatis.selectOne("Messages.sendview",seq);
	}
	
	public List<MessageDTO> recievelist(String id){
		return mybatis.selectList("Messages.recievelist",id);
	}
	
	public MessageDTO recieveView(int seq) {
		return mybatis.selectOne("Messages.recieveview",seq);
	}
	
	public void recievefirstView(String id) {
		mybatis.update("Messages.recievefirstView",id);
	}
	
	public void recieveSecendView(int seq) {
		mybatis.update("Messages.recieveSecendView",seq);
	}
	
	public void sendfirstView(int seq) {
		mybatis.update("Messages.sendfirstView",seq);
	}
	
	public int senddelete(int seq) {
		return mybatis.delete("Messages.senddelete",seq);
	}
	
	public int recievedelete(int seq) {
		return mybatis.delete("Messages.recievedelete",seq);
	}
}
