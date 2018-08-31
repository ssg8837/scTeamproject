package com.scmaster.home;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VaccineController {


	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	@RequestMapping(value = "/vaccine_Test", method = RequestMethod.GET)
	public String vaccine_Test(Model model) 
	{
		return "home";
	}
}
