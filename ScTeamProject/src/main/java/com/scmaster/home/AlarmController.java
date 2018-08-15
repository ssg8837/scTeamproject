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
import com.scmaster.vo.Ajax_Alarm;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;

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
		ArrayList<Ajax_Alarm> alarmList= new ArrayList<Ajax_Alarm>();
		if(loginNo!=null)
		{
			ArrayList<BS_Baby> babyList=mainMapper.selectBabyList((Integer)loginNo);
			for(BS_Baby item : babyList)	
			{
				int babyNum=item.getBabyNo();
				alarmList.addAll(alarmMapper.selectBabyAlarmList(babyNum));
			}
		}
		model.addAttribute("alarmList", alarmList);
		return "calendar";
	}
	
	@RequestMapping(value = "/alarm_OpenNewAlarm", method = RequestMethod.GET)
	public String alarm_OpenNewAlarm(Model model) 
	{
		AlarmMapper alarmMapper=sqlSession.getMapper(AlarmMapper.class);
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
}
