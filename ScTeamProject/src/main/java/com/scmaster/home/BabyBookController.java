package com.scmaster.home;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.BabyBookMapper;
import com.scmaster.vo.BabyBook;


@Controller
public class BabyBookController {
	
	@Autowired
	SqlSession sqlsession;
	
	private static final String UPLOADPATH = "C:\\\\\\\\FileRepo";
	
	
	@RequestMapping(value = "/babyBookForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		
		BabyBookMapper mapper = sqlsession.getMapper(BabyBookMapper.class);
		List<BabyBook> list = mapper.selectList();
		
		for(int i=0;i<list.size();i++) {
			String s1 = list.get(i).getRegdate().replaceAll(" ", "T");
			list.get(i).setRegdate(s1);
		}
		
		model.addAttribute("list", list);
		
		return "babyBookForm";
	}
	
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm() {
		
		return "registerForm";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(BabyBook babyBook, MultipartFile uploadfile, HttpSession session) {
		
		babyBook.setOriginalfile(uploadfile.getOriginalFilename());
		
		String savedName = savedName(uploadfile);
		babyBook.setSavedfile(savedName);
		
		File file = new File(UPLOADPATH, savedName);
		try {
			uploadfile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		babyBook.setUserid((String)session.getAttribute("loginId"));
		BabyBookMapper mapper = sqlsession.getMapper(BabyBookMapper.class);
		mapper.insertBabyBook(babyBook);

		return "redirect:babyBookForm";
	}
	
	public String savedName(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid+""+uploadfile.getOriginalFilename();
		
		return savedName;
	}
	
	@RequestMapping(value = "/babyBookDetail", method = RequestMethod.GET)
	public @ResponseBody BabyBook detailForm(int boardnum) {
		
		BabyBookMapper mapper = sqlsession.getMapper(BabyBookMapper.class);
		BabyBook babyBook = mapper.selectOne(boardnum);
		
		return babyBook;
	}
	
	
}
