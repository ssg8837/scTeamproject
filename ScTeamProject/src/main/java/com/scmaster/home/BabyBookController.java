package com.scmaster.home;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.scmaster.mapper.BabyBookMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BabyBook;
import com.scmaster.vo.Cal_Event;


@Controller
public class BabyBookController {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final String UPLOADPATH = "C://FileRepo";
	
	
	@RequestMapping(value = "/babyBook", method = RequestMethod.GET)
	public String joinForm(Model model) {
		
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		List<BabyBook> list = mapper.selectList();
		
		for(int i=0;i<list.size();i++) {
			String s1 = list.get(i).getRegdate().replaceAll(" ", "T");
			list.get(i).setRegdate(s1);
			
			
		}
		
		model.addAttribute("list", list);
		
		return "babyBook";
	}
	
	@RequestMapping(value = "/registerBabyBook", method = RequestMethod.POST)
	public String registerBabyBook(BabyBook babyBook, MultipartFile uploadfile, HttpSession session) {
		
		babyBook.setOriginalfile(uploadfile.getOriginalFilename());
		
		String savedName = savedName(uploadfile);
		babyBook.setSavedfile(savedName);
		
		File path = new File(UPLOADPATH);
		if(!path.exists())
		{
			path.mkdirs();
			System.out.println("폴더가 존재하지 않아 만들었습니다.");
		}
		
		File file = new File(UPLOADPATH, savedName);
		try {
			uploadfile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		babyBook.setUserNo((Integer)session.getAttribute("loginNo"));
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		mapper.insertBabyBook(babyBook);

		return "redirect:babyBook";
	}
	
	public String savedName(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid+""+uploadfile.getOriginalFilename();
		
		return savedName;
	}
	
	@RequestMapping(value = "/getImage",method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<InputStreamResource> getImage(int boardnum) throws Exception {

		BabyBookMapper bookMapper=sqlSession.getMapper(BabyBookMapper.class);
		BabyBook book = bookMapper.selectOne(boardnum);
		String fullname=book.getSavedfile();
		
		HttpHeaders responseHeaders = new HttpHeaders();

		responseHeaders.setContentType(MediaType.IMAGE_JPEG);
		
		String path = String.format("%s//%s", UPLOADPATH, fullname);

		FileSystemResource resource = new FileSystemResource(path);


		return new ResponseEntity<InputStreamResource>(new InputStreamResource(resource.getInputStream()), responseHeaders, HttpStatus.OK);

	}
	
	
}
