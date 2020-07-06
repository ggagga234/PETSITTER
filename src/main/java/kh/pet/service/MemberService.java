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

	

	public void signup(MemberDTO mdto) throws Exception{ //회원가입.
		String key = new Tempkey().getKey(20, false);		
		System.out.println("key: "+key);
		mdto.setMem_authkey(key);
			
		mdao.signup(mdto);
		String id = mdto.getMem_id();
		
		//메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("뭐하냥도와주개 이메일 인증");
        sendMail.setText(
                new StringBuffer()
                .append(id)
                .append("님, 가입을 환영합니다. 아래 링크를 누르면 인증이 완료됩니다.")
                .append("<br>")
                .append("(혹시 잘못 전달되었다면, 이 이메일을 무시하셔도 됩니다)")
                .append("<br>")
                .append("<br>")
                .append("<a href='http://192.168.60.42:8099/member/emailConfirm?authKey=")
                .append(key)
                .append("&userid=")
                .append(id)
                .append("' target='_blank'>이메일 인증 확인</a>")
                .toString());
        
        sendMail.setFrom("whatcathelpdog@gmail.com", "뭐하냥도와주개");
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
	
	public int verify(String id) { //이메일 인증확인
		
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
	
	public String findID(String email) { //ID찾기
				
		return mdao.findID(email);
		
	}
	
	public int findPw(Map<String, String> map) { //일치 비번확인
		
		return mdao.findPw(map);		
		
	}
	
	public int replacepw(String id, String email) throws Exception { //비밀번호 재설정
				
		String key = new Tempkey().getKey(8, false);		
		System.out.println("재설정 key: "+key);
				
		//메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[뭐하냥도와주개] 임시 비밀 번호 안내드립니다. ");
        sendMail.setText(
                new StringBuffer()
                .append(id)
                .append("님의 임시 비밀번호는")
                .append("&nbsp;<strong>") 
                .append(key)
                .append("</strong>&nbsp;")
                .append("입니다.") 
                .append("<br>")
                .append("(혹시 잘못 전달되었다면, 이 이메일은 무시하셔도 됩니다)")
                .append("<br>")
                .append("임시 비밀번호로 로그인 후, 마이페이지에서 원하는 비밀번호로 수정해주세요.")
                .append("<br>")
                .append("<a href='http://192.168.60.13/'")
                .append("' target='_blank'>뭐하냥 도와주개</a>")
                .toString());
        
        sendMail.setFrom("whatcathelpdog@gmail.com", "뭐하냥도와주개");
        sendMail.setTo(email);
        sendMail.send();
		
				
		String pw = this.getSHA512(key); //암호화
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);	
		
		return mdao.replacepw(map);	
	}
}
