package kh.pet.scheduler;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.pet.staticInfo.Log_Count;

@Service
public class Log_Count_DB {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Scheduled(cron = "0 */1 * * * ?")
	public void logWrite() {
		System.out.println(Log_Count.log_count);
	}
}
