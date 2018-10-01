package com.scmaster.home;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.scmaster.mapper.AlarmMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.mapper.SNSMapper;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.Bell;
import com.scmaster.vo.Friend;
import com.scmaster.vo.Kakao_Request;


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
		JSONObject jobResp = new JSONObject();
		JSONObject jobMess = new JSONObject();
		jobResp.put("message", jobMess);
		vo.getContent();
		String id=vo.getContent();
		SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
		
		//AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		try {
			String str_item="알람목록";
    		ArrayList<Friend> alarmList= new ArrayList<Friend>();
			int userNo=mainMapper.selectUserById(id);
			
			ArrayList<String> bellList=new ArrayList<String>();
			ArrayList<Friend> friendList=snsMapper.selectApplyList(userNo);
			for(Friend item : friendList)
			{
				int sender = item.getUserNo();
				int receiver =item.getFriendNo();
				String sendNick = mainMapper.selectNick(sender);
				String str=sendNick+"님으로 부터 친구 신청";
				//Bell bell= new Bell(sender, receiver, str,1);
				bellList.add(str);
			}
			friendList=snsMapper.selectDenyList(userNo);
			for(Friend item : friendList)
			{
				int sender = item.getUserNo();
				int receiver =item.getFriendNo();
				String sendNick = mainMapper.selectNick(receiver);
				String str=sendNick+"님이 친구 신청을 거절하였습니다.";
				//Bell bell= new Bell(sender, receiver, str,2);
				bellList.add(str);
			}
			if(bellList.isEmpty())
			{
				str_item+="새로운 알람이 없는 것 같습니다.";
			}
			else
			{
				for(String item : bellList)
				{
					str_item+="\n";
					str_item+=item;
				}
			}
			jobMess.put("text", str_item);
		}
		catch(Exception e)
		{
			jobMess.put("text", "없는 아이디 같습니다");
		}
		
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