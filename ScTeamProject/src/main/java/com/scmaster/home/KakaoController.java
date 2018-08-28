package com.scmaster.home;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.scmaster.vo.message;
import com.scmaster.mapper.AlarmMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.Cal_Event;
import com.scmaster.vo.Kakao_Request;
import com.scmaster.vo.Kakao_Response;


@RestController
public class KakaoController {

	@Autowired SqlSession sqlSession;
	@RequestMapping(value = "/keyboard", method = RequestMethod.GET)
	public String keyboard() {


	    JSONObject jobjBtn = new JSONObject();
	    jobjBtn.put("type", "text");

	    return jobjBtn.toString();
	}
	// 메세지
	@RequestMapping(value = "/message", method = RequestMethod.POST, produces = "application/json;charset=utf8")
	public String message(@RequestBody Kakao_Request vo)
	{
		//System.out.println(vo);
		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		JSONObject jobResp = new JSONObject();
		JSONObject jobMess = new JSONObject();
		jobResp.put("message", jobMess);
		vo.getContent();
		String id=vo.getContent();
		try {
			String str_item="알람목록";
    		ArrayList<BS_Alarm> alarmList= new ArrayList<BS_Alarm>();
			int userNo=mainMapper.selectUserById(id);
			
			ArrayList<BS_Baby> babyList=mainMapper.selectBabyList(userNo);
			for(int i=0;i<babyList.size();i++)	
			{
				alarmList=alarmMapper.selectAlarmList(userNo);
			}
			for(BS_Alarm item : alarmList)
			{
				str_item+="\n";
				/*str_item+=mainMapper.selectBaby(item.getBabyNo()).getBabyName();
				str_item+=" : ";*/
				str_item+=item.getAlarmTitle()+" [ "+item.getAlarmTime()+" ]";
			}
			jobMess.put("text", str_item);
		}
		catch(Exception e)
		{
			jobMess.put("text", "없는 아이디 같습니다");
		}
		
		ArrayList<BS_Alarm> alarmList= new ArrayList<BS_Alarm>();
		ArrayList<String> nameList =new ArrayList<String>();
		
		Kakao_Response result=new Kakao_Response(new message("text2"));
		
		

	    return jobResp.toString();
	}
	
}


/*pom.xml
 * 
 <!-- https://mvnrepository.com/artifact/org.json/json -->
<dependency>
    <groupId>org.json</groupId>
    <artifactId>json</artifactId>
    <version>20180130</version>
</dependency>

 */