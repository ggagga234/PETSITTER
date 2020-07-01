package kh.pet.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.pet.dto.MessageDTO;


@Repository
public class MessageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int sendgetAritcleCount(String id) {
		return mybatis.selectOne("Messages.sendgetCount",id);
	}
	
	public List<MessageDTO> sendMessagelist(Map<String, Object> map) {
		return mybatis.selectList("Messages.sendmessagelist", map);
	}
	
	public int recievegetAritcleCount(String id) {
		return mybatis.selectOne("Messages.recievegetCount",id);
	}
	
	public List<MessageDTO> recieveMessagelist(Map<String, Object> map) {
		return mybatis.selectList("Messages.recievemassagelist", map);
	}
	
	public int sendMessage(MessageDTO dto) {
		return mybatis.insert("Messages.send",dto);
	}
	
	public int recieveMessage(MessageDTO dto) {
		return mybatis.insert("Messages.recieve",dto);
	}
	
	public int searchMem(String reciver) {
		return mybatis.selectOne("Messages.search",reciver);
	}
	
	public MessageDTO sendView(int seq) {
		return mybatis.selectOne("Messages.sendview",seq);
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
	
	public int senddelete(Map<String, Object> map) {
		return mybatis.delete("Messages.senddelete",map);
	}
	
	public int recievedelete(Map<String, Object> map) {
		return mybatis.delete("Messages.recievedelete", map);
	}
}
