package com.scmaster.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.mapper.GrowDefaultMapper;
import com.scmaster.mapper.GrowMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.Grow;
import com.scmaster.vo.Grow_Default;

@Controller
public class GrowController {


	@Autowired SqlSession session;
	@Autowired HttpSession httpSession;
	
	@RequestMapping(value = "/grow_Test", method = RequestMethod.GET)
	public String grow_Test(Model model) 
	{
		return "home";
	}
	
	//성장기록 화면으로 이동(+그래프 띄우기)
	@RequestMapping(value = "/gotoGrow", method = {RequestMethod.GET , RequestMethod.POST})
	public String gotoGrow(Model model, HttpServletResponse response) 
	{
		String url = "";	//이동할 jsp
		
		Object loginNo= httpSession.getAttribute("loginNo");
		
		//로그인 됐을 경우
		if(loginNo != null ) {
			//사용자의 자녀목록 불러오기(자녀선택용)
			MainMapper mapperM = session.getMapper(MainMapper.class);
			List<BS_Baby> babyList = mapperM.selectBabyList((Integer)loginNo);
			model.addAttribute("babyList", babyList);
			
			//표준성장도표 데이터 가져오기
			GrowDefaultMapper mapperGD=session.getMapper(GrowDefaultMapper.class);
			List<Grow_Default> female=mapperGD.showDefaultValueFemale();
			List<Grow_Default> male=mapperGD.showDefaultValueMale();
			List<Grow_Default> femaleBMI=mapperGD.showDefaultValueFemaleBMI();
			List<Grow_Default> maleBMI=mapperGD.showDefaultValueMaleBMI();
			
			model.addAttribute("female", female);	
			model.addAttribute("male", male);
			model.addAttribute("femaleBMI", femaleBMI);	
			model.addAttribute("maleBMI", maleBMI);
			
			url="grow";
		}
		//로그인 끊겼을 경우
		else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인 후 이용가능한 페이지입니다.');</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			url="home";
		}
		return url;
	}
	
	//아이 성장정보 가져오기 - 그래프 추가(ajax)  +  아이 성장정보 조회 - 나이 가져오기
	@RequestMapping(value = "/grow_selectBabyData", method = {RequestMethod.GET , RequestMethod.POST})
	@ResponseBody public List<Grow> grow_selectBabyData(int babyno) 
	{
		//사용자 자녀의 성장기록 가져오기
		GrowMapper mapperG = session.getMapper(GrowMapper.class);
		List<Grow> myBabyGrowList = mapperG.showBabyData(babyno);

		return myBabyGrowList;
	}
	
	//아이 성장정보 가져오기: BMI - 그래프 추가(ajax)
	@RequestMapping(value = "/grow_selectBabyBMI", method = {RequestMethod.GET , RequestMethod.POST})
	@ResponseBody public List<Grow> grow_selectBabyBMI(int babyno) 
	{
		//사용자 자녀의 성장기록 가져오기
		GrowMapper mapperG = session.getMapper(GrowMapper.class);
		List<Grow> myBabyBMIList = mapperG.showBabyBMI(babyno);

		return myBabyBMIList;
	}

	//아이 성장정보 조회 - 또래 아이들과 비교하여 계산
	@RequestMapping(value = "/grow_selectBabyDataByAge", method = {RequestMethod.GET , RequestMethod.POST})
	@ResponseBody public List<HashMap<String, BigInteger>> grow_selectBabyDataByAge(int babyno, int babyage) 
	{	

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("babyno", babyno);
		map.put("babyage", babyage);
		
		//입력받은 아이+나이에 해당하는 성장기록 가져오기
		GrowMapper mapperG = session.getMapper(GrowMapper.class);
		List<HashMap<String, BigInteger>> myBabyGrowListByAge = mapperG.showBabyDataByAge(map);
			
		return myBabyGrowListByAge;
	}
	
	//아이 성장정보 수정
	@RequestMapping(value = "/grow_updateGrowData", method = RequestMethod.POST)
	@ResponseBody public String grow_updateGrowData(int babyno, int babyage, double newGrowHeight, double newGrowWeight, double newGrowHead) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("babyno", babyno);
		map.put("babyage", babyage);
		map.put("newGrowHeight", newGrowHeight);
		map.put("newGrowWeight", newGrowWeight);
		map.put("newGrowHead", newGrowHead);
		
		GrowMapper mapperG=session.getMapper(GrowMapper.class);
		int result  = mapperG.updateGrowData(map);

		if(result ==1) {
			//수정 성공
			return "success";
		} else {
			//수정 실패
			return "failed";
		}

	}
	
	//아이 성장정보 기록 - 최근갱신일 확인(ajax)  //날짜 비교할 때 이거 비슷하게 쓰면 될 것 같...? String growregdate나 age 넣어서 같으면 안 넘어가게.
	@RequestMapping(value = "/grow_checkRegdate", method = RequestMethod.GET)
	@ResponseBody public String grow_checkRegdate(int babyno) 
	{
		//선택한 아이의 가장 최근에 기록한 성장정보 불러오기
		GrowMapper mapperG = session.getMapper(GrowMapper.class);
		Grow lastInsertData = mapperG.lastInsertData(babyno);

		if(lastInsertData != null) {
			String lastRegdate = lastInsertData.getGrowregdate();
			return lastRegdate;
		}else {
			return "null";
		}
	}
	
	//아이 성장정보 기록(아이정보입력)
	@RequestMapping(value = "/grow_insertBabyData", method = {RequestMethod.GET , RequestMethod.POST})
	@ResponseBody public String grow_insertBabyData(int babyno, double growheight, double growweight, double growhead, String growregdate, Grow grow) 
	{
		
		//아이정보(bs_baby) 가져오기
		MainMapper mapperM=session.getMapper(MainMapper.class);
		BS_Baby baby = mapperM.selectBaby(babyno);

		GrowMapper mapperG=session.getMapper(GrowMapper.class);
		String babyBirth = baby.getBabyBirth();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("babyBirth", babyBirth);
		map.put("growregdate", growregdate);
		map.put("babyno", babyno);
		
		System.out.println(map);
		
		Grow checkAge = mapperG.checkAge(map);
		
		if(checkAge == null) {
			//가져온 아이정보 set
			grow.setUserno(baby.getUserNo());
			grow.setBabyname(baby.getBabyName());
			grow.setBabygender(baby.getBabyGender());
			grow.setBabybirth(baby.getBabyBirth());
			
			//성장정보 기록
			int result = mapperG.insertBabyData(grow);
			
			if(result ==1) {
				//수정 성공
				return "success";
			} else {
				//수정 실패
				return "failed";
			}
		}else {
			return "sameAge";
		}
	}
	
}
