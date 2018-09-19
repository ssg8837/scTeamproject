package com.scmaster.home;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.scmaster.mapper.MainMapper;
import com.scmaster.mapper.SNSMapper;
import com.scmaster.vo.Bell;
import com.scmaster.vo.Friend;
import com.scmaster.vo.Likely;
import com.scmaster.vo.MultiFiles;
import com.scmaster.vo.SNS;
import com.scmaster.vo.SNS_Reply;

@Controller
public class SNSController {

	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;

	private static final String UPLOADPATH = "C://FileRepo//SNS";
	
	@RequestMapping(value = "/openSNS", method = RequestMethod.GET)
	public String openSNS(Model model) 
	{
		SNSMapper snsMapper = sqlSession.getMapper(SNSMapper.class);
		MainMapper mainMapper = sqlSession.getMapper(MainMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		ArrayList<SNS> snsList=null;
		ArrayList<Integer> likelyList=new ArrayList<Integer>();
		if(loginNo==null)
		{
			snsList=snsMapper.selectPublicSNS();
			for(SNS item :snsList)
			{
				ArrayList<SNS_Reply> replyList=snsMapper.selectReply(item.getSNSNo());
				Object obj_item=mainMapper.selectImg(item.getUserNo());
				if(obj_item!=null)
				{
					item.setImgExist(1);
				}
				for(SNS_Reply s : replyList)
				{
					Object obj=mainMapper.selectImg(s.getUserNo());
					if(obj!=null)
					{
						s.setImgExist(1);
					}
				}
				item.setReplyList(replyList);
			}
		}
		else
		{
			snsList=snsMapper.selectSNS((Integer)loginNo);
			for(SNS item :snsList)
			{
				ArrayList<SNS_Reply> replyList=snsMapper.selectReply(item.getSNSNo());
				Object obj_item=mainMapper.selectImg(item.getUserNo());
				if(obj_item!=null)
				{
					item.setImgExist(1);
				}
				for(SNS_Reply s : replyList)
				{
					Object obj=mainMapper.selectImg(s.getUserNo());
					if(obj!=null)
					{
						s.setImgExist(1);
					}
				}
				item.setReplyList(replyList);
				Likely temp =new Likely((Integer)loginNo,item.getSNSNo());
				likelyList.add(snsMapper.selectLikely(temp));
				model.addAttribute("likelyList", likelyList);
			}
		}
		//System.out.println(snsList);
		
		
		model.addAttribute("snsList", snsList);
		return "snsMain";
	}
	@RequestMapping(value = "/openNewSns", method = RequestMethod.GET)
	public String openNewSns(Model model) 
	{
		return "newSns";
	}
	@RequestMapping(value = "/sns_OpenChoose", method = RequestMethod.POST)
	public String sns_OpenChoose(Model model,int snsNo) 
	{
		SNSMapper snsMapper= sqlSession.getMapper(SNSMapper.class);
		SNS sns = snsMapper.selectSNSbySnsNo(snsNo);
		model.addAttribute("sns", sns);
		return "Sns_SelectOption";
	}
	@RequestMapping(value = "/reply_OpenChoose", method = RequestMethod.POST)
	public String reply_OpenChoose(Model model,int rplyNo) 
	{
		SNSMapper snsMapper= sqlSession.getMapper(SNSMapper.class);
		SNS_Reply reply = snsMapper.selectReplyByRplyNo(rplyNo);
		model.addAttribute("reply", reply);
		return "Reply_SelectOption";
	}
	//sns_OpenUpdate
	@RequestMapping(value = "/sns_OpenUpdate", method = RequestMethod.POST)
	public String sns_OpenUpdate(Model model,int selectNo) 
	{
		SNSMapper snsMapper= sqlSession.getMapper(SNSMapper.class);
		SNS sns = snsMapper.selectSNSbySnsNo(selectNo);
		model.addAttribute("sns", sns);
		return "modifySns";
	}
	
	@RequestMapping(value = "/likePlus", method = RequestMethod.POST)
	public @ResponseBody int likePlus(int snsNo) 
	{
		Object loginNo=httpSession.getAttribute("loginNo");
		SNSMapper snsMapper = sqlSession.getMapper(SNSMapper.class);
		if(loginNo!=null)
		{
			Likely likely =new Likely((Integer)loginNo,snsNo);
			snsMapper.insertLikely(likely);
			HashMap<String,Integer> map =new HashMap<String,Integer>();
			map.put("snsNo", snsNo);
			map.put("plusMinus", 1);
			snsMapper.updateCountLikely(map);
		}
		return snsMapper.selectCountLikely(snsNo);
		//return "newSns";
	}
	

	@RequestMapping(value = "/alarm_load",method = RequestMethod.POST)
	public @ResponseBody ArrayList<Bell> alarm_load(int loginNo)
	{
		SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
		MainMapper mainMapper=sqlSession.getMapper(MainMapper.class);
		ArrayList<Bell> bellList=new ArrayList<Bell>();
		ArrayList<Friend> friendList=snsMapper.selectApplyList(loginNo);
		for(Friend item : friendList)
		{
			int sender = item.getUserNo();
			int receiver =item.getFriendNo();
			String sendNick = mainMapper.selectNick(sender);
			String str=sendNick+"님으로 부터 친구 신청";
			Bell bell= new Bell(sender, receiver, str,1);
			bellList.add(bell);
		}
		friendList=snsMapper.selectDenyList(loginNo);
		for(Friend item : friendList)
		{
			int sender = item.getUserNo();
			int receiver =item.getFriendNo();
			String sendNick = mainMapper.selectNick(receiver);
			String str=sendNick+"님이 친구 신청을 거절하였습니다.";
			Bell bell= new Bell(sender, receiver, str,2);
			bellList.add(bell);
		}
		return bellList;
	}
	
	@RequestMapping(value = "/likeMinus", method = RequestMethod.POST)
	public @ResponseBody int likeMinus(int snsNo) 
	{
		SNSMapper snsMapper = sqlSession.getMapper(SNSMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		if(loginNo!=null)
		{
			Likely likely =new Likely((Integer)loginNo,snsNo);
			snsMapper.deleteLikely(likely);
			HashMap<String,Integer> map =new HashMap<String,Integer>();
			map.put("snsNo", snsNo);
			map.put("plusMinus", -1);
			snsMapper.updateCountLikely(map);
		}
		return snsMapper.selectCountLikely(snsNo);
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
				//System.out.println(file.getOriginalFilename());
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
		return openSNS( model) ;
	}
	
	@RequestMapping(value = "/insertNewReply", method = RequestMethod.POST)
	public @ResponseBody int insertNewReply(int snsNo,String content) 
	{
		SNS_Reply reply= new SNS_Reply();
		SNSMapper snsMapper = sqlSession.getMapper(SNSMapper.class);
		Object loginNo=httpSession.getAttribute("loginNo");
		int count=0;
		if(loginNo!=null)
		{
			String userNick=(String)httpSession.getAttribute("loginNick");
			reply.setSnsNo(snsNo);
			reply.setContent(content);
			reply.setUserNo((Integer)loginNo);
			reply.setUserNick(userNick);
			count=snsMapper.insertReply(reply);
		}
		return count;
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
	
	//sentFriend
	@RequestMapping(value = "/sentFriend",method = RequestMethod.POST)
	public @ResponseBody int sentFriend(int sender,int receiver) 
	{
		int result=0;
		SNSMapper snsMapper =sqlSession.getMapper(SNSMapper.class);
		Friend friend =new Friend(receiver,sender,"Y");
		result=snsMapper.checkFriend(friend);
		if(result==0)
		{
			friend =new Friend(sender,receiver,"Y");
			result=snsMapper.applyFriend(friend);
		}
		else
		{
			friend = new Friend(sender,receiver,"N");
			result=snsMapper.applyFriend(friend);
			friend = new Friend(receiver,sender,"N");
			result+=snsMapper.updateApply(friend);
		}
		return result;
	}
	
	@RequestMapping(value = "/checkFriend",method = RequestMethod.POST)
	public @ResponseBody int checkFriend(int sender,int receiver) 
	{
		int result=0;
		SNSMapper snsMapper =sqlSession.getMapper(SNSMapper.class);
		Friend friend =new Friend(sender,receiver,"Y");
		result=snsMapper.checkFriend(friend);
		return result;
	}
	@RequestMapping(value = "/acceptFriend",method = RequestMethod.POST)
	public @ResponseBody int acceptFriend(int sender,int receiver) 
	{
		int result=0;
		SNSMapper snsMapper =sqlSession.getMapper(SNSMapper.class);
		Friend friend =new Friend(receiver,sender,"N");
		result=snsMapper.applyFriend(friend);
		friend =new Friend(sender,receiver,"N");
		result+=snsMapper.updateApply(friend);
		return result;
	}
	@RequestMapping(value = "/denyFriend",method = RequestMethod.POST)
	public @ResponseBody int denyFriend(int sender,int receiver) 
	{
		int result=0;
		SNSMapper snsMapper =sqlSession.getMapper(SNSMapper.class);
		Friend friend =new Friend(sender,receiver,"D");
		result=snsMapper.updateApply(friend);
		return result;
	}
	@RequestMapping(value = "/acceptDeny",method = RequestMethod.POST)
	public @ResponseBody int acceptDeny(int sender,int receiver)
	{
		int result=0;
		SNSMapper snsMapper =sqlSession.getMapper(SNSMapper.class);
		Friend friend =new Friend(sender,receiver,"D");
		result=snsMapper.deleteFriend(friend);
		return result;
	}

	//sns_Delete
	@RequestMapping(value = "/sns_Delete", method = RequestMethod.POST)
	public String sns_Delete(Model model, int selectNo) 
	{
		SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
		snsMapper.deleteSns(selectNo);
		snsMapper.deleteReplyBySnsNo(selectNo);
		return openSNS(model);
	}
	
	@RequestMapping(value = "/updateNewSns", method = RequestMethod.POST)
	public String updateNewSns(Model model, String content,boolean permission,int snsNo) 
	{
		Object loginNo=httpSession.getAttribute("loginNo");
		if(loginNo!=null)
		{
			SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
			SNS sns = new SNS();
			sns.setContent(content);
			sns.setSNSNo(snsNo);
			if(permission==true)//1은 전체공개, 0은 친구들만.
			{
				sns.setPermission(1);
			}
			else
			{
				sns.setPermission(0);
			}
			snsMapper.updateSNS(sns);
		}
		return openSNS(model);
	}
	
		@RequestMapping(value = "/reply_Delete", method = RequestMethod.POST)
		public String reply_Delete(Model model, int selectNo) 
		{
			SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
			snsMapper.deleteReplyByRplyNo(selectNo);
			return openSNS(model);
		}
		@RequestMapping(value = "/reply_Update", method = RequestMethod.POST)
		public String reply_Update(Model model, int selectNo, String content) 
		{
			SNSMapper snsMapper=sqlSession.getMapper(SNSMapper.class);
			SNS_Reply reply= new SNS_Reply();
			reply.setRplyNo(selectNo);
			reply.setContent(content);
			snsMapper.updateReply(reply);
			return openSNS(model);
		}
		
}
