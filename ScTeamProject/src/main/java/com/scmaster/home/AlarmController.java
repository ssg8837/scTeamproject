package com.scmaster.home;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.mapper.AlarmMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

@Controller
public class AlarmController {


	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
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
	public String alarm_insertNewAlarm(Model model,BS_Alarm alarm) {

		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		alarmMapper.insertAlarm(alarm);
		return alarm_OpenCalendar(model);
	}
	
	@RequestMapping(value = "/alarm_OpenUpdate", method = RequestMethod.POST)
	public String alarm_OpenUpdate(Model model, String alarmNo) {

		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		BS_Alarm alarm = alarmMapper.selectAlarm(alarmNo);
		model.addAttribute("alarm", alarm);
		return "modifyAlarm";
	}
	
	@RequestMapping(value = "/alarm_UpdateAlarm", method = RequestMethod.POST)
	public String alarm_UpdateAlarm(Model model,BS_Alarm alarm) {

		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
		alarmMapper.updateAlarm(alarm);
		return alarm_OpenCalendar(model);
	}
}
