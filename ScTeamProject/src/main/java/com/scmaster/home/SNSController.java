package com.scmaster.home;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.SNSMapper;
import com.scmaster.vo.MultiFiles;
import com.scmaster.vo.SNS;

@Controller
public class SNSController {

	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;

	private static final String UPLOADPATH = "C://FileRepo";
	
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
			String fileGroup="";
			
			for(MultipartFile file : boardfiles.getFileSet())
			{
					
				System.out.println(file.getOriginalFilename());
				if(file.getOriginalFilename().length()!=0)
				{
					count++;
					
					String savedName = savedName(file);
					fileGroup+=savedName+"*";
					
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
			System.out.println(fileGroup);
			System.out.println(count);
			SNS sns = new SNS();
			sns.setContent(content);
			sns.setPermission(0);
			if(permission==true)//1은 전체공개, 0은 친구들만.
			{
				sns.setPermission(1);
			}
			sns.setUserNo((Integer)loginNo);
			sns.setPhotoCount(count);
			sns.setPhotoGroup(fileGroup);
					
			snsMapper.insertSNS(sns);
		}
		return "snsMain";
	}
	
	public String savedName(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid+""+uploadfile.getOriginalFilename();
		
		return savedName;
	}
}
