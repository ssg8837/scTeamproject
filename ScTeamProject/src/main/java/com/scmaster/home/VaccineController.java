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
		DiseaseMapper mapper = sqlSession.getMapper(DiseaseMapper.class);
		List<Disease> list = mapper.selectList();
		
		session.getAttribute("loginId");
		
		model.addAttribute("list", list);
		
		return "vaccineTest1";
	}
	
}
