package com.scmaster.home;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

//메인화면, 로그인, 회원가입, 회원정보수정, 아이추가 기능 이쪽 컨트롤러에 있습니다.

@Controller
public class HomeController 
{
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	private static final String UPLOADPATH = "C://FileRepo//profilePic"; //프로필사진 저장용
	
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
	
	//로그인 페이지(이동)
	@RequestMapping(value = "/openLogin", method = RequestMethod.GET)
	public String openLogin() 
	{
		return "login";
	}
	//AJax용 코드
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public @ResponseBody String login( String userid, String userpwd) 
	{
		//response.setContentType("text/html; charset=UTF-8");
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
	//회원가입(기능)
	@RequestMapping(value = "/insertNewAccount", method = RequestMethod.POST)
	public @ResponseBody String insertNewAccount(BS_User user, MultipartFile uploadfile) 
	{
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		if(mapper.countUser(user.getUserId())!=0)
			return "false";
		user.setUserType("n");
		
		//기본프로필사진 추가하기
		user.setUserOriginalFile(uploadfile.getOriginalFilename());
		String savedName = savedName(uploadfile);
		user.setUserSavedFile(savedName);
		
		File path = new File(UPLOADPATH);
		if(!path.exists())
		{
			path.mkdirs();
			System.out.println("폴더생성");
		}
		
		File file = new File(UPLOADPATH, savedName);
		try {
			uploadfile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		
		mapper.updateUser(user);
		}
		mapper.insertUser(user);
		return "true";
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
	public String savedName(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid+""+uploadfile.getOriginalFilename();
			
		return savedName;
	}
	//로그아웃(기능)
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) 
	{
		httpSession.invalidate();
		return "home";
	}
	
	//회원정보 수정페이지(이동)
	@RequestMapping(value = "/openAccountEdit", method = RequestMethod.GET)
	public String openAccountEdit(Model model) {
		
		int loginNo=(Integer)httpSession.getAttribute("loginNo");
		MainMapper mapper=sqlSession.getMapper(MainMapper.class);
		
		//System.out.println(loginNo);
		
		BS_User user=mapper.myAccount(loginNo);
		model.addAttribute("user",user);
		
		//System.out.println(user);	
		
		return "accountEdit";
	}
	//회원정보 수정(기능)
	@RequestMapping(value = "/updateMyPage", method = RequestMethod.POST)
	public String updateMyPage(BS_User user, String oldUserPwd, MultipartFile uploadfile, HttpServletResponse response){
		
		System.out.println(uploadfile);
		
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

			//수정 시 새로 첨부한 파일이 있으면 기존 파일을 삭제하고 새로 업로드
			if (!uploadfile.isEmpty()) {
				String savedfile = user.getUserSavedFile();	//첨부되어있던 파일의 원본이름
				//기존 파일이 있으면 삭제
				if (savedfile != null) {
					deleteFile(UPLOADPATH + "/" + savedfile);
				}
				
				//새로 업로드한 파일 저장
				user.setUserOriginalFile(uploadfile.getOriginalFilename());			
				//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
				String savedName = savedName(uploadfile);
				user.setUserSavedFile(savedName);
				
				mapper.updateUser(user);
				
				System.out.println(user);
			}
			
			//수정 후 띄워줄 alert창
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('정보수정완료!');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}

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
	/**
	 * 서버에 저장된 파일의 전체 경로를 전달받아, 해당 파일을 삭제
	 * @param fullpath 삭제할 파일의 경로
	 * @return 삭제 여부
	 */
	public static boolean deleteFile(String fullpath) {
		//파일 삭제 여부를 리턴할 변수
		boolean result = false;
		
		//전달된 전체 경로로 File객체 생성
		File delFile = new File(fullpath);
		
		//해당 파일이 존재하면 삭제
		if (delFile.isFile()) {
			delFile.delete();
			result = true;
		}	
		return result;
	}

	//아이추가 페이지(이동)
	@RequestMapping(value = "/openNewBaby", method = RequestMethod.GET)
	public String openNewBaby() 
	{
		return "newBaby";
	}
	//아이추가(기능)
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

}
