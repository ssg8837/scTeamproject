package com.scmaster.home;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.SNSMapper;
import com.scmaster.vo.BabyBook;
import com.scmaster.vo.SNS;

@Controller
public class SNSController {

	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	@RequestMapping(value = "/openSNS", method = RequestMethod.GET)
	public String openSNS(Model model) 
	{
		SNSMapper snsMapper = sqlSession.getMapper(SNSMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		ArrayList<SNS> snsList=null;
		if(loginNo==null)
		{
			snsList=snsMapper.selectPublicSNS();
		}
		else
		{
			snsList=snsMapper.selectSNS();
		}
		model.addAttribute("snsList", snsList);
		return "snsMain";
	}
	
	@RequestMapping(value = "/openNewSns", method = RequestMethod.GET)
	public String openNewSns(Model model) 
	{
		return "newSns";
	}
	@RequestMapping(value = "/insertNewSns", method = RequestMethod.GET)
	public String insertNewSns(SNS sns, MultipartFile uploadfile, HttpSession session) 
	{
		return "snsMain";
	}
}
