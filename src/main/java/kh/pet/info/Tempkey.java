package kh.pet.info;

import java.util.Random;

public class Tempkey {
	
	private boolean lowerCheck;
    private int size;

    public String getKey(int size, boolean lowerCheck) { //이 값은 메소드를 쓴데서 넣는다.
        this.size = size;
        this.lowerCheck = lowerCheck;
        //this로 쓴 이유가 이 값이 저 private 값임을 알려주려고?
        return init();
    }

    private String init() {
        Random  ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do {
            num = ran.nextInt(75)+48;
            if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
                sb.append((char)num);
            }else {
                continue;
            }
        } while (sb.length() < size);
        if(lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    } 
    
}
