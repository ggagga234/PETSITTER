package kh.pet.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

public class LogAdvisor {
	
	@Autowired
	private HttpSession session;
	
	public Object logincheck(ProceedingJoinPoint pj) throws Throwable{
		if(session.getAttribute("id")==null) {
			return "redirect:/";
		}
		else {
			
		}
		Object re = pj.proceed();
		return re;
	}
}
