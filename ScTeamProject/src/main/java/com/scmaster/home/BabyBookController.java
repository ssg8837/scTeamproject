package com.scmaster.home;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.scmaster.mapper.BabyBookMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BabyBook;
import com.scmaster.vo.Cal_Event;


@Controller
public class BabyBookController {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	HttpSession httpSession;
	
	private static final String UPLOADPATH = "C://FileRepo";
	
	
	@RequestMapping(value = "/babyBookForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		List<BabyBook> list = mapper.selectList();
		
		for(int i=0;i<list.size();i++) {
			String s1 = list.get(i).getRegdate().replaceAll(" ", "T");
			list.get(i).setRegdate(s1);
		}
		
		model.addAttribute("list", list);
		
		return "babyBookForm";
	}
	
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm(Model model) 
	{
		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		ArrayList<Integer> noList= new ArrayList<Integer>();
		ArrayList<String> nameList= new ArrayList<String>();
		if(loginNo!=null)
		{
			ArrayList<BS_Baby> babyList=mainMapper.selectBabyList((Integer)loginNo);
			for(BS_Baby item : babyList)	
			{
				noList.add(item.getBabyNo());
				nameList.add(item.getBabyName());
			}
		}
		model.addAttribute("noList", noList);
		model.addAttribute("nameList", nameList);
		return "registerForm";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(BabyBook babyBook, MultipartFile uploadfile, HttpSession session) {
		
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

		return "redirect:babyBookForm";
	}
	
	public String savedName(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid+""+uploadfile.getOriginalFilename();
		
		return savedName;
	}
	
	@RequestMapping(value = "/babyBookDetail", method = RequestMethod.GET)
	public @ResponseBody BabyBook detailForm(int boardnum) {
		
		BabyBookMapper mapper = sqlSession.getMapper(BabyBookMapper.class);
		BabyBook babyBook = mapper.selectOne(boardnum);
		
		return babyBook;
	}
	
	@RequestMapping(value = "/babyBook_calenderLoad",method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public @ResponseBody String babyBook_calenderLoad()
	{
		String jsonMsg = null;
        try {
        	
        	BabyBookMapper bookMapper=sqlSession.getMapper(BabyBookMapper.class);
    		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
    		Object loginNo=httpSession.getAttribute("loginNo");
    		ArrayList<BabyBook> alarmList= new ArrayList<BabyBook>();
    		ArrayList<String> nameList =new ArrayList<String>();
    		if(loginNo!=null)
    		{
				List<Cal_Event> events = new ArrayList<Cal_Event>();
    			ArrayList<BabyBook> babyBookList=bookMapper.selectBabyBookListLoginNo((Integer)loginNo);
    			for(BabyBook item : babyBookList)
    			{
    	            Cal_Event event = new Cal_Event();
    	            event.setTitle(item.getTitle()+" [ "+(mainMapper.selectBaby(item.getBabyNo()).getBabyName())+" ] ");
    	            event.setStart(item.getRegdate());
    	            event.setId(Integer.toString(item.getBoardnum()));
    	            events.add(event);
    			}

                ObjectMapper mapper = new ObjectMapper();
                jsonMsg =  mapper.writerWithDefaultPrettyPrinter().writeValueAsString(events);
    		}
        } catch (IOException ioex) {
            System.out.println(ioex.getMessage());
        }
        return jsonMsg;
	}
	
	@RequestMapping(value = "/getImage",method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<InputStreamResource> getImage(int boardnum ) throws Exception {

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
