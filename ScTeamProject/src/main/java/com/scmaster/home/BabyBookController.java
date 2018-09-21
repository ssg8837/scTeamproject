package com.scmaster.home;

<<<<<<< HEAD

=======
import java.io.BufferedOutputStream;
>>>>>>> refs/remotes/origin/leesa
import java.io.File;
<<<<<<< HEAD
=======
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
>>>>>>> refs/remotes/origin/leesa
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.BabyBookMapper;
import com.scmaster.mapper.MainMapper;
<<<<<<< HEAD
import com.scmaster.vo.BS_User;
=======
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
>>>>>>> refs/remotes/origin/leesa
import com.scmaster.vo.BabyBook;


@Controller
public class BabyBookController {
	
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	private static final String UPLOADPATH = "C://FileRepo";
	
	
	@RequestMapping(value = "/babyBook", method = RequestMethod.GET)
	public String joinForm(Model model) {
		
		Calendar today = Calendar.getInstance();
		
		String smonth;
		if(today.get(Calendar.MONTH)+1>=10) {
			smonth = today.get(Calendar.YEAR)+"-"+(today.get(Calendar.MONTH)+1);
		}else{
			smonth = today.get(Calendar.YEAR)+"-0"+(today.get(Calendar.MONTH)+1);
		}
		
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		List<BabyBook> list = mapper.selectListByMonth(smonth);
		
		
		model.addAttribute("list", list);
		
		//프로필사진 불러오기
		Object loginNo=httpSession.getAttribute("loginNo");
		MainMapper mapperM=sqlSession.getMapper(MainMapper.class);
		BS_User user=mapperM.myAccount((Integer)loginNo);
		model.addAttribute("user",user);
		
		return "babyBook";
	}
	
	@RequestMapping(value = "/selectBabyBookByMonth", method = RequestMethod.GET)
	public @ResponseBody List<BabyBook> selectBabyBookByMonth(String smonth) {
		
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		List<BabyBook> list = mapper.selectListByMonth(smonth);
		
		return list;
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
	
	@RequestMapping(value = "/deleteBabyBook", method = RequestMethod.GET)
	public String deleteBabyBook(int boardnum) {
		
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		mapper.deleteBabyBook(boardnum);
		
		return "redirect:babyBook";
	}
	
	@RequestMapping(value = "/updateBabyBook", method = RequestMethod.POST)
	public String updateBabyBook(BabyBook babyBook, MultipartFile uploadfile, HttpSession session) {
		
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
		mapper.updateBabyBook(babyBook);

		return "redirect:babyBook";
	}
	
	
}
