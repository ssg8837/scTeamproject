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
	
	/*
	@RequestMapping(value = "/alarm_OpenCalendar", method = RequestMethod.GET)
	public String alarm_OpenCalendar(Model model) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		ArrayList<BS_Alarm> alarmList= new ArrayList<BS_Alarm>();
		ArrayList<String> nameList =new ArrayList<String>();
		if(loginNo!=null)
		{
			ArrayList<BS_Baby> babyList=mainMapper.selectBabyList((Integer)loginNo);
			for(BS_Baby item : babyList)	
			{
				int babyNum=item.getBabyNo();
				alarmList.addAll(alarmMapper.selectBabyAlarmList(babyNum));
			}
			for(BS_Alarm item : alarmList)
			{
				nameList.add(mainMapper.selectBaby(item.getBabyNo()).getBabyName());
			}
		}
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("nameList", nameList);
		return "calendar";
	}
	*/
	@RequestMapping(value = "/alarm_OpenCalendar", method = RequestMethod.GET)
	public String alarm_OpenCalendar() 
	{
		
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
	public String alarm_insertNewAlarm(Model model, BS_Alarm alarm) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		alarmMapper.insertAlarm(alarm);
		return alarm_OpenCalendar();
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
		return "modifyAlarm";
	}
	
	@RequestMapping(value = "/alarm_UpdateAlarm", method = RequestMethod.POST)
	public String alarm_UpdateAlarm(Model model, BS_Alarm alarm) 
	{
		System.out.println(alarm);
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		alarmMapper.updateAlarm(alarm);
		return alarm_OpenCalendar();
	}
	
	//alarm_Delete
	@RequestMapping(value = "/alarm_Delete", method = RequestMethod.POST)
	public String alarm_Delete(Model model, int alarmNo) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		alarmMapper.deleteAlarm(alarmNo);
		return alarm_OpenCalendar();
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
    		ArrayList<String> nameList =new ArrayList<String>();
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
    				//item.setAlarmTitle();
    	            Cal_Event event = new Cal_Event();
    	            event.setTitle(item.getAlarmTitle()+" [ "+(mainMapper.selectBaby(item.getBabyNo()).getBabyName())+" ] ");
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
