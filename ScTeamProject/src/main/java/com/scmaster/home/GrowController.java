package com.scmaster.home;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.mapper.GrowDefaultMapper;
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

	@RequestMapping(value = "/gotoGrow", method = {RequestMethod.GET , RequestMethod.POST})
	public String gotoGrow(Model model) 
	{
		GrowDefaultMapper mapper=session.getMapper(GrowDefaultMapper.class);
		
		
		List<Grow_Default> female=mapper.showDefaultValueFemale();
		List<Grow_Default> male=mapper.showDefaultValueMale();
		
		model.addAttribute("female", female);	
		model.addAttribute("male", male);
		
		return "grow";
	}
}
