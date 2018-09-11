package com.scmaster.home;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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

import com.scmaster.mapper.BabyBookMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.mapper.SNSMapper;
import com.scmaster.vo.BabyBook;
import com.scmaster.vo.MultiFiles;
import com.scmaster.vo.SNS;

@Controller
public class SNSController {

	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;

	private static final String UPLOADPATH = "C://FileRepo//SNS";
	
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
			snsList=snsMapper.selectSNS((Integer)loginNo);
		}
		System.out.println(snsList);
		
		model.addAttribute("snsList", snsList);
		return "snsMain";
	}
	
	@RequestMapping(value = "/openNewSns", method = RequestMethod.GET)
	public String openNewSns(Model model) 
	{
		return "newSns";
	}
	@RequestMapping(value = "/insertNewSns", method = RequestMethod.POST)
	public String insertNewSns(MultiFiles boardfiles,String content, boolean permission, MultipartFile fileSet,Model model,HttpServletRequest request) throws IllegalStateException, IOException
	{
		Object loginNo=httpSession.getAttribute("loginNo");
		if(loginNo!=null)
		{
			SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
			int count=0;
			ArrayList<String> fileGroup=new ArrayList<String>();
			
			for(MultipartFile file : boardfiles.getFileSet())
			{
					
				System.out.println(file.getOriginalFilename());
				if(file.getOriginalFilename().length()!=0)
				{
					count++;
					
					String savedName = savedName(file);
					fileGroup.add(savedName);
					
					File path = new File(UPLOADPATH);
					if(!path.exists())
					{
						path.mkdirs();
						System.out.println("폴더가 존재하지 않아 만들었습니다.");
					}
					File realFile = new File(UPLOADPATH, savedName);
					try {
						file.transferTo(realFile);
					} catch (Exception e) {
						e.printStackTrace();
					} 
				}
			}//for
			//System.out.println(fileGroup);
			//System.out.println(count);
			SNS sns = new SNS();
			sns.setContent(content);
			sns.setPermission(0);
			if(permission==true)//1은 전체공개, 0은 친구들만.
			{
				sns.setPermission(1);
			}
			sns.setUserNo((Integer)loginNo);
			sns.setPhotoCount(count);
			switch(count)
			{
			case 4:
				sns.setPhoto_4(fileGroup.get(3));
			case 3:
				sns.setPhoto_3(fileGroup.get(2));
			case 2:
				sns.setPhoto_2(fileGroup.get(1));
			case 1:
				sns.setPhoto_1(fileGroup.get(0));
				break;
			}
			sns.setUserNick((String)httpSession.getAttribute("loginNick"));
			snsMapper.insertSNS(sns);
		}
		return "snsMain";
	}
	
	public String savedName(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid+""+uploadfile.getOriginalFilename();
		
		return savedName;
	}
	
	@RequestMapping(value = "/getImageSns",method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<InputStreamResource> getImageSns(String fullname) throws Exception {

		
		HttpHeaders responseHeaders = new HttpHeaders();

		responseHeaders.setContentType(MediaType.IMAGE_JPEG);
		
		String path = String.format("%s//%s", UPLOADPATH, fullname);

		FileSystemResource resource = new FileSystemResource(path);


		return new ResponseEntity<InputStreamResource>(new InputStreamResource(resource.getInputStream()), responseHeaders, HttpStatus.OK);

	}
}
