package com.scmaster.home;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		Object loginNo= httpSession.getAttribute("loginNo");
		if(loginNo!=null)
		{
			MainMapper mapper= sqlSession.getMapper(MainMapper.class);
			ArrayList<BS_Baby> babyList= mapper.selectBabyList((Integer)loginNo);
			System.out.println(babyList);
			model.addAttribute("babyList", babyList);
		}
		return "home";
	}
	@RequestMapping(value = "/openNewAccount", method = RequestMethod.GET)
	public String openNewAccount() {
		return "newAccount";
	}
	@RequestMapping(value = "/openNewBaby", method = RequestMethod.GET)
	public String openNewBaby() {
		return "newBaby";
	}
	@RequestMapping(value = "/openLogin", method = RequestMethod.GET)
	public String openLogin() 
	{
		return "login";
	}
}
