package kh.pet.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kh.pet.dao.MemberDAO;
import kh.pet.dto.MemberDTO;
import kh.pet.info.MailHandler;
import kh.pet.info.Tempkey;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	@Autowired
    private JavaMailSender mailSender;

	
	public String isExistId(String ps_id) throws Exception{
		return mdao.isExistId(ps_id);
	}
	
	public String getSHA512(String input){

		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}

	public int emailCheck(String email) throws Exception {
		
		int result = mdao.emailCheck(email);
		return result;
	}
	public int idDuplCheck(String id) throws Exception{
		int result = mdao.idDuplCheck(id);
		return result;
	}

	

	public void signup(MemberDTO mdto) throws Exception{ //�쉶�썝媛��엯.
		String key = new Tempkey().getKey(20, false);		
		System.out.println("key: "+key);
		mdto.setMem_authkey(key);
			
		mdao.signup(mdto);
		String id = mdto.getMem_id();
		
		//硫붿씪 �쟾�넚
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("萸먰븯�깷�룄��二쇨컻 �씠硫붿씪 �씤利�");
        sendMail.setText(
                new StringBuffer()
                .append(id)
                .append("�떂, 媛��엯�쓣 �솚�쁺�빀�땲�떎. �븘�옒 留곹겕瑜� �늻瑜대㈃ �씤利앹씠 �셿猷뚮맗�땲�떎.")
                .append("<br>")
                .append("(�샊�떆 �옒紐� �쟾�떖�릺�뿀�떎硫�, �씠 �씠硫붿씪�쓣 臾댁떆�븯�뀛�룄 �맗�땲�떎)")
                .append("<br>")
                .append("<br>")
                .append("<a href='http://localhost/member/emailConfirm?authKey=")
                .append(key)
                .append("&userid=")
                .append(id)
                .append("' target='_blank'>�씠硫붿씪 �씤利� �솗�씤</a>")
                .toString());
        
        sendMail.setFrom("whatcathelpdog@gmail.com", "萸먰븯�깷�룄��二쇨컻");
        sendMail.setTo(mdto.getMem_email());
        sendMail.send();

	}
	
	public int emailConfirm(String authKey, String userid) {
		int result = 0;		
		int chkey = mdao.authkey(authKey);	
		
		if(chkey > 0) {
			try {
				result = mdao.successAuthkey(userid);				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		return result;
		
	}
	
	public int verify(String id) { //�씠硫붿씪 �씤利앺솗�씤
		
		int result = mdao.verify(id);
		return result;
	}
	
	public boolean login(Map<String, String> map)throws Exception{
		
		boolean result = mdao.login(map);		
		return result;		
	}
		
	public MemberDTO loginInfo(String id)throws Exception{
		
		MemberDTO mdto = mdao.myInfo(id);
		return mdto;		
		
	}
	
	public String findID(String email) { //ID李얘린
				
		return mdao.findID(email);
		
	}
	
	public int findPw(Map<String, String> map) { //�씪移� 鍮꾨쾲�솗�씤
		
		return mdao.findPw(map);		
		
	}
	
	public int replacepw(String id, String email) throws Exception { //鍮꾨�踰덊샇 �옱�꽕�젙
				
		String key = new Tempkey().getKey(8, false);		
		System.out.println("�옱�꽕�젙 key: "+key);
				
		//硫붿씪 �쟾�넚
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[萸먰븯�깷�룄��二쇨컻] �엫�떆 鍮꾨� 踰덊샇 �븞�궡�뱶由쎈땲�떎. ");
        sendMail.setText(
                new StringBuffer()
                .append(id)
                .append("�떂�쓽 �엫�떆 鍮꾨�踰덊샇�뒗")
                .append("&nbsp;<strong>") 
                .append(key)
                .append("</strong>&nbsp;")
                .append("�엯�땲�떎.") 
                .append("<br>")
                .append("(�샊�떆 �옒紐� �쟾�떖�릺�뿀�떎硫�, �씠 �씠硫붿씪�� 臾댁떆�븯�뀛�룄 �맗�땲�떎)")
                .append("<br>")
                .append("�엫�떆 鍮꾨�踰덊샇濡� 濡쒓렇�씤 �썑, 留덉씠�럹�씠吏��뿉�꽌 �썝�븯�뒗 鍮꾨�踰덊샇濡� �닔�젙�빐二쇱꽭�슂.")
                .append("<br>")
                .append("<a href='http://192.168.60.13/'")
                .append("' target='_blank'>萸먰븯�깷 �룄��二쇨컻</a>")
                .toString());
        
        sendMail.setFrom("whatcathelpdog@gmail.com", "萸먰븯�깷�룄��二쇨컻");
        sendMail.setTo(email);
        sendMail.send();
		
				
		String pw = this.getSHA512(key); //�븫�샇�솕
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);	
		
		return mdao.replacepw(map);	
	}
}
