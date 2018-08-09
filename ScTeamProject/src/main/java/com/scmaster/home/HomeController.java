package com.scmaster.home;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	@RequestMapping(value = "/openNewAccount", method = RequestMethod.GET)
	public String openNewAccount(Model model) {
		return "newAccount";
	}
	@RequestMapping(value = "/insertNewAccount", method = RequestMethod.GET)
	public String insertNewAccount(Model model) {
		return "insertNewAccount";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "home";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		httpSession.invalidate();
		return "home";
	}
	
}
