package com.scmaster.home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.scmaster.mapper.AlarmMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.Cal_Event;

@Controller
public class AlarmController {


	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	

	@RequestMapping(value = "/alarm_OpenCalendar", method = RequestMethod.GET)
	public String alarm_OpenCalendar(Model model) 
	{
		//프로필사진 불러오기
		
		return "calendar";
	}
	
	@RequestMapping(value = "/alarm_OpenNewAlarm", method = RequestMethod.GET)
	public String alarm_OpenNewAlarm(Model model) 
	{
		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		ArrayList<Integer> noList= new ArrayList<Integer>();
		ArrayList<String> nameList= new ArrayList<String>();
		if(loginNo!=null)
		{
			ArrayList<BS_Baby> babyList=mainMapper.selectBabyList((Integer)loginNo);
			for(BS_Baby item : babyList)	
			{
				noList.add(item.getBabyNo());
				nameList.add(item.getBabyName());
			}
		}
		model.addAttribute("noList", noList);
		model.addAttribute("nameList", nameList);
		
		
		return "newAlarm";
	}
	
	@RequestMapping(value = "/alarm_insertNewAlarm", method = RequestMethod.POST)
	public @ResponseBody String alarm_insertNewAlarm(Model model, BS_Alarm alarm) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		System.out.println(alarm);
		int type=alarm.getAlarmType();

		switch(type)
		{
		//모유
		case 1:
			alarmMapper.insertAlarm_EndTimeNDetail(alarm);
			break;
		//젖병,유축 (시간기록,양,디테일 필요)
		case 2:
		case 4:
			alarmMapper.insertAlarm_All(alarm);
			break;
		//이유식 (시간기록, 양 필요)
		case 3:
			alarmMapper.insertAlarm_AmountNTEndTime(alarm);
			break;
		//배소변 (디테일 필요)
		case 5:
			alarmMapper.insertAlarm_Detail(alarm);
			break;
		//목욕, 디폴트
		case 6:
		default :
			alarmMapper.insertAlarm(alarm);
			break;
		//기타, 수면 (시간기록 필요)
		case 0:
		case 7:	
			alarmMapper.insertAlarm_EndTime(alarm);
			break;
		}

		return "success";
	}
	
	@RequestMapping(value = "/alarm_OpenChoose", method = RequestMethod.POST)
	public String alarm_OpenChoose(Model model, int alarmNo) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		BS_Alarm alarm = alarmMapper.selectAlarm(alarmNo);
		model.addAttribute("alarm", alarm);
		return "alarm_SelectOption";
	}
	@RequestMapping(value = "/alarm_OpenUpdate", method = RequestMethod.POST)
	public String alarm_OpenUpdate(Model model, int alarmNo) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		BS_Alarm alarm = alarmMapper.selectAlarm(alarmNo);
		model.addAttribute("alarm", alarm);
		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		
		model.addAttribute("babyName", mainMapper.selectBabyName(alarm.getBabyNo()));
				
		return "modifyAlarm";
	}
	
	@RequestMapping(value = "/alarm_UpdateAlarm", method = RequestMethod.POST)
	public String alarm_UpdateAlarm(Model model, BS_Alarm alarm) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		System.out.println(alarm);
		int type=alarm.getAlarmType();
		switch(type)
		{
		//모유
		case 1:
			alarmMapper.updateAlarm_EndTimeNDetail(alarm);
			break;
		//젖병,유축 (시간기록,양,디테일 필요)
		case 2:
		case 4:
			alarmMapper.updateAlarm_All(alarm);
			break;
		//이유식 (시간기록, 양 필요)
		case 3:
			alarmMapper.updateAlarm_AmountNTEndTime(alarm);
			break;
		//배소변 (디테일 필요)
		case 5:
			alarmMapper.updateAlarm_Detail(alarm);
			break;
		//목욕, 디폴트
		case 6:
		default :
			alarmMapper.updateAlarm(alarm);
			break;
		//기타, 수면 (시간기록 필요)
		case 0:
		case 7:
			alarmMapper.updateAlarm_EndTime(alarm);
			break;
		}
		return "redirect:alarm_OpenCalendar";
	}
	
	//alarm_Delete
	@RequestMapping(value = "/alarm_Delete", method = RequestMethod.POST)
	public String alarm_Delete(Model model, int alarmNo) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		alarmMapper.deleteAlarm(alarmNo);
		return alarm_OpenCalendar(model);
	}
	
	
	@RequestMapping(value = "/alarm_calenderLoad",method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public @ResponseBody String alarm_calenderLoad()
	{
		String jsonMsg = null;
        try {
        	
        	AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
    		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
    		Object loginNo=httpSession.getAttribute("loginNo");
    		ArrayList<BS_Alarm> alarmList= new ArrayList<BS_Alarm>();
    		if(loginNo!=null)
    		{
				List<Cal_Event> events = new ArrayList<Cal_Event>();
    			ArrayList<BS_Baby> babyList=mainMapper.selectBabyList((Integer)loginNo);
    			for(int i=0;i<babyList.size();i++)	
    			{
    				int babyNum=babyList.get(i).getBabyNo();
    				alarmList.addAll(alarmMapper.selectBabyAlarmList(babyNum));
    			}
    			for(BS_Alarm item : alarmList)
    			{
    				int alarmType=item.getAlarmType();
    				String str="";
    	            Cal_Event event = new Cal_Event();
    	            switch(alarmType)
    	            {
    	            case 1:
    	            	str+="모유 : ";
    	            	if(item.getAlarmDetail()==1) {
    	            		str+="왼쪽";
    	            	}else if(item.getAlarmDetail()==2) {
    	            		str+="오른쪽";
    	            	};	
    	            	event.setColor("#4286f4");
    	            	break;
    	            case 2:
    	            	str+="젖병 : ";
    	            	if(item.getAlarmDetail()==3) {
    	            		str+="모유";
    	            	}else if(item.getAlarmDetail()==4) {
    	            		str+="분유";
    	            	};
    	            	str+=item.getAlarmAmount();
    	            	str+="ml";
    	            	event.setColor("#3aff85");
    	            	break;
    	            case 3:
    	            	str+="이유식 : ";
    	            	str+=item.getAlarmAmount();
    	            	event.setColor("#b2a867");
    	            	str+="ml";
    	            	break;
    	            case 4:
    	            	str+="유축 : ";
    	            	if(item.getAlarmDetail()==1) {
    	            		str+="왼쪽";
    	            	}else if(item.getAlarmDetail()==2) {
    	            		str+="오른쪽";
    	            	};
    	            	str+=item.getAlarmAmount();
    	            	str+="ml";
    	            	event.setColor("#ffe0c9");
    	            	break;
    	            case 5:
    	            	if(item.getAlarmDetail()==5) {
    	            		str+="배변";
    	            	}else if(item.getAlarmDetail()==6) {
    	            		str+="소변";
    	            	}
    	            	event.setColor("#996416");
    	            	break;
    	            case 6:
    	            	str+="목욕";
    	            	event.setColor("#abcfd8");
    	            	break;
    	            case 7:
    	            	str+="수면";
    	            	event.setColor("#9e80ad");
    	            	break;
    	            }
    	            event.setTitle(str+" [ "+(mainMapper.selectBaby(item.getBabyNo()).getBabyName())+" ] "+item.getAlarmTitle());
    	            event.setStart(item.getAlarmTime());
    	            event.setId(Integer.toString(item.getAlarmNo()));
    	            events.add(event);
    			}

                ObjectMapper mapper = new ObjectMapper();
                jsonMsg =  mapper.writerWithDefaultPrettyPrinter().writeValueAsString(events);
    		}
        } catch (IOException ioex) {
            System.out.println(ioex.getMessage());
        }
        return jsonMsg;
	}
	

	
}
