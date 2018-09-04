package com.scmaster.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController 
{
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) 
	{
		Object loginNo= httpSession.getAttribute("loginNo");
		if(loginNo!=null)
		{
			MainMapper mapper= sqlSession.getMapper(MainMapper.class);
			ArrayList<BS_Baby> babyList= mapper.selectBabyList((Integer)loginNo);
			model.addAttribute("babyList", babyList);
		}
		return "home";
	}
	//회원정보 수정페이지
	@RequestMapping(value = "/openAccountEdit", method = RequestMethod.GET)
	public String openAccountEdit(Model model) {
		
		int loginNo=(Integer)httpSession.getAttribute("loginNo");
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		
		System.out.println(loginNo);
		
		BS_User user=mapper.myAccount(loginNo);
		model.addAttribute("user",user);
		
		System.out.println(user);	
		
		return "accountEdit";
	}
	//회원정보 수정(기능)
	@RequestMapping(value = "/updateMyPage", method = RequestMethod.POST)
	public String updateMyPage(BS_User user, String oldUserPwd, HttpServletResponse response){
		
		String url="";
		
		int loginNo=(Integer)httpSession.getAttribute("loginNo");
		String loginId=(String)httpSession.getAttribute("loginId");
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);

		//비밀번호 체크용
		BS_User checkM = mapper.myAccount(loginNo);
		String oldpwd = checkM.getUserPwd();
		
		//기존비밀번호가 일치할 경우에만 수정
		if (oldpwd.equals(oldUserPwd) && loginId != null) {
			
			user.setUserId(loginId);
			mapper.updateUser(user);
			
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('정보수정완료!');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			//내 정보 페이지로 이동
			url="redirect:/openAccountEdit";
		}
		else if(!oldpwd.equals(oldUserPwd)) {
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('기존 비밀번호가 올바르지 않습니다. 확인 후 다시 시도해주세요.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return url;
	}
	
	
	
	@RequestMapping(value = "/openNewBaby", method = RequestMethod.GET)
	public String openNewBaby() 
	{
		return "newBaby";
	}
	@RequestMapping(value = "/openLogin", method = RequestMethod.GET)
	public String openLogin() 
	{
		return "login";
	}
	/*
	@RequestMapping(value = "/insertNewAccount", method = RequestMethod.POST)
	public String insertNewAccount(Model model,BS_User user) 
	{
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		user.setUserType("n");
		mapper.insertUser(user);
		return home(model);
	}
	*/
	@RequestMapping(value = "/insertNewBaby", method = RequestMethod.POST)
	public String insertNewBaby(Model model,BS_Baby baby) 
	{
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		mapper.insertBaby(baby);
		return home(model);
	}
	/*
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, String userid, String userpwd) 
	{
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		HashMap<String, String> userMap=new HashMap<String,String>();
		userMap.put("userId", userid);
		userMap.put("userPwd",userpwd);
		BS_User user=mapper.selectUser(userMap);
		if(user!=null)
		{
			httpSession.setAttribute("loginId",user.getUserId());
			httpSession.setAttribute("loginNo",user.getUserNo());
		}
		return home(model);
	}
	*/
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) 
	{
		httpSession.invalidate();
		return "home";
	}
	
	//AJax용 코드
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public @ResponseBody String login( String userid, String userpwd) 
	{
		//response.setContentType("text/html;charset=UTF-8");
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		HashMap<String, String> userMap=new HashMap<String,String>();
		userMap.put("userId", userid);
		userMap.put("userPwd",userpwd);
		BS_User user=mapper.selectUser(userMap);
		if(user!=null)
		{
			httpSession.setAttribute("loginId",user.getUserId());
			httpSession.setAttribute("loginNo",user.getUserNo());
			httpSession.setAttribute("loginNick",user.getUserNick());
			return "로그인 완료되었습니다.";
		}
		return "로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요.";
	}
	
	@RequestMapping(value = "/insertNewAccount", method = RequestMethod.POST)
	public @ResponseBody String insertNewAccount(BS_User user) 
	{
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		if(mapper.countUser(user.getUserId())!=0)
			return "false";
		user.setUserType("n");
		mapper.insertUser(user);
		return "true";
	}
}
