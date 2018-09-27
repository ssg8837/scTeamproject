package com.scmaster.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.mapper.AlarmMapper;
import com.scmaster.mapper.BabyListMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

@Controller
public class BabyListController {

	//아이정보(babyList), 아이추가, 아이생활기록(개별 확인) 관련 기능 이쪽 컨트롤러에 있습니다.

	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	//아이정보 페이지(이동)
	@RequestMapping(value = "/openNewBaby", method = RequestMethod.GET)
	public String openNewBaby(Model model) {
		Object loginNo= httpSession.getAttribute("loginNo");
		if(loginNo!=null){
			MainMapper mapper= sqlSession.getMapper(MainMapper.class);
				
			ArrayList<BS_Baby> babyList= mapper.selectBabyList((Integer)loginNo);
			model.addAttribute("babyList", babyList);
				
		}
		
		return "babyList";
	}
	//아이정보삭제
	@RequestMapping(value = "/deleteBaby", method = RequestMethod.GET)
	public String deleteBaby(int babyNo) {

		MainMapper mapper= sqlSession.getMapper(MainMapper.class);		
		mapper.deleteBaby(babyNo);
		
		return "redirect:/openNewBaby";
	}
	
	//아이 나이 계산
	@RequestMapping(value = "/babyAge", method = RequestMethod.GET)
	@ResponseBody public int babyAge(int babyNo) {
		//System.out.println(babyNo);
		
		MainMapper mapper= sqlSession.getMapper(MainMapper.class);		
		int babyAge = mapper.babyAge(babyNo);
		
		//System.out.println(babyAge);
		
		return babyAge;
	}
	//아이생활기록(개별)으로 이동
	@RequestMapping(value = "/checkPattern", method = RequestMethod.GET)
	public String checkPattern(int babyNo, Model model) {
			Object loginNo= httpSession.getAttribute("loginNo");
			if(loginNo!=null)
			{
				MainMapper mapper= sqlSession.getMapper(MainMapper.class);
				BS_Baby baby = mapper.selectBaby(babyNo);
				model.addAttribute("baby", baby);
				
				BabyListMapper mapperBL = sqlSession.getMapper(BabyListMapper.class);
				//그래프용 데이터 불러오기
				ArrayList<BS_Alarm> milk = mapperBL.selectMilkCount(babyNo);
				ArrayList<BS_Alarm> bottle = mapperBL.selectBottleAmount(babyNo);
				ArrayList<BS_Alarm> food = mapperBL.selectFoodAmount(babyNo);
				ArrayList<BS_Alarm> pee = mapperBL.selectPeeCount(babyNo);
				ArrayList<BS_Alarm> shower = mapperBL.selectShowerCount(babyNo);
				ArrayList<BS_Alarm> sleep = mapperBL.selectSleepCount(babyNo);
				
				model.addAttribute("milk", milk);
				model.addAttribute("bottle", bottle);
				model.addAttribute("food", food);
				model.addAttribute("pee", pee);
				model.addAttribute("shower", shower);
				model.addAttribute("sleep", sleep);
				
				//프로필사진 불러오기(사이드바)
			}
		
		return "babyLifePattern";
	}
	//아이추가(기능)
	@RequestMapping(value = "/insertNewBaby", method = RequestMethod.POST)
	public String insertNewBaby(Model model,BS_Baby baby) {
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		mapper.insertBaby(baby);
		return openNewBaby(model);
	}
	
}
