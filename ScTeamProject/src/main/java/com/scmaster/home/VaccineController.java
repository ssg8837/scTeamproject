package com.scmaster.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.mapper.DiseaseMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.Disease;

@Controller
public class VaccineController {


	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	@RequestMapping(value = "/vaccine_Test", method = RequestMethod.GET)
	public String vaccine_Test(Model model) 
	{
		return "home";
	}
	
	@RequestMapping(value = "/vaccineForm", method = RequestMethod.GET)
	public String vaccineTest1(HttpSession session,Model model){
		DiseaseMapper diseaseMapper = sqlSession.getMapper(DiseaseMapper.class);
		List<Disease> diseaseList = diseaseMapper.selectList();
		
		//Integer.parseInt((String)session.getAttribute("loginNo"));
		int userno = 1;
		MainMapper mainMapper = sqlSession.getMapper(MainMapper.class);
		List<BS_Baby> babyList =  mainMapper.selectBabyList(userno);
		
		for(BS_Baby b:babyList) {
			System.out.println(b);
		}
		
		model.addAttribute("babyList", babyList);
		model.addAttribute("diseaseList", diseaseList);
		
		return "vaccineForm";
	}
	
}
