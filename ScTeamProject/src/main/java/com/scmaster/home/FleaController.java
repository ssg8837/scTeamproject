package com.scmaster.home;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.FleaMapper;
import com.scmaster.mapper.FleaReplyMapper;
import com.scmaster.util.PageNavigator;
import com.scmaster.vo.Flea;
import com.scmaster.vo.FleaReply;


//메인화면, 로그인, 회원가입, 회원정보수정, 아이추가 기능 이쪽 컨트롤러에 있습니다.

@Controller
public class FleaController 
{
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	final int countPerPage = 10;			//페이지 당 글 수
	final int pagePerGroup = 5;			//페이지 이동 그룹 당 표시할 페이지 수
	
	private static final String UPLOADPATH = "C://FileRepo//FleaPics"; //프로필사진 저장용
	//게시판 리스트 불러오기
	@RequestMapping(value = "/flea_list", method = RequestMethod.GET)
	public String boardList(
							@RequestParam(value="page", defaultValue="1") int page, 
							@RequestParam(value="searchText", defaultValue="") String searchText,
																							Model model) {
		
		Map<String,String> search = new HashMap<String,String>();
		search.put("searchText", searchText);
		
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		
		int total=mapper.countTotal(search);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		RowBounds rb = new RowBounds(navi.getStartRecord(),navi.getCountPerPage());
		
		List<Flea> boardList=mapper.getBoardList(search,rb);
		
		for(Flea list:boardList) {
			System.out.println(list);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "flea_market_list";
	}
	//게시글 읽기
	@RequestMapping(value = "/flea_read", method = RequestMethod.GET)
	public String boardRead(int fleaNum, Model model) {
		
		System.out.println(fleaNum+"게시글 ");
		
		model.addAttribute("board", boardRead(fleaNum));
		model.addAttribute("replylist", replyList(fleaNum));
		
		return "flea_market_read_write";
	}
	//게시글 읽기
	public Flea boardRead(int fleaNum) {
		Flea board=selectOne(fleaNum);
		return board;
	}
	//게시글 +리플 읽기
	public Flea selectOne(int fleaNum) {
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		Flea board=mapper.selectOne(fleaNum);
		mapper.updateHits(fleaNum);
		
		return board;
	}
	//게시판 쓰기 폼 이동
	@RequestMapping(value = "/flea_new", method = RequestMethod.GET)
	public String newWrite() {
		return "flea_market_read_write";
	}
	//게시판 쓰기
	@RequestMapping(value = "/flea_write", method = RequestMethod.POST)
	public String boardWrite(Flea write, MultipartFile fleaSavedFile, Model model) {
		write.setFleaSavedFile(uploadfile(fleaSavedFile));
		System.out.println(write.toString());
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		int result=mapper.boardWrite(write);
		System.out.println(write.getFleaNum()+"게시글"+result+"개 게시글 삽입 성공");
		model.addAttribute("board", boardRead(write.getFleaNum()));
		
		return "flea_market_read_write";
	}
	//파일업로드
	public String uploadfile(MultipartFile fleaSavedFile) {
		if(fleaSavedFile == null) {
			return null;
		}
		//랜덤번호 생성
		UUID uuid =UUID.randomUUID();
		//저장된 파일이름을 새로 생성(보안상, 덮어씌워짐 방지, 바이러스 침입등을 방지)
		String saveName=uuid+"_"+fleaSavedFile.getOriginalFilename();//이름의 중복을 피하기위해 바꿔주려는 문자열
		//껍데기 파일 생성
		File file=new File(UPLOADPATH,saveName);
		System.out.println(file);
		try {
			//파일 껍데이기에 저장할 파일을 추가
			fleaSavedFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return saveName;
	}
	//게시판 삭제
	@RequestMapping(value = "/flea_delete", method = RequestMethod.GET)
	public String deleteBoard(int fleaNum) {
		int loginNo= (Integer) httpSession.getAttribute("loginNo");
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		int result=mapper.deleteBoard(fleaNum, loginNo);
		System.out.println(result);
		return "redirect:flea_list";
	}
	//게시판 업데이트
	@RequestMapping(value = "/flea_update", method = RequestMethod.POST)
	public String updateBoard(Flea update, Model model, MultipartFile uploadedfile) {
		if(uploadfile(uploadedfile)!=null) {
		update.setFleaSavedFile(uploadfile(uploadedfile));
		}
		System.out.println(update);
		
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		int result=mapper.updateBoard(update);
		System.out.println(result);
		
		model.addAttribute("board", boardRead(update.getFleaNum()));
		model.addAttribute("replylist", replyList(update.getFleaNum()));
		return "flea_read";
	}
	/******
	 리플 관련
	 ******/
	//리플 리스트 불러오기
	public List<FleaReply> replyList(int boardnum) {
		
		FleaReplyMapper mapper=sqlSession.getMapper(FleaReplyMapper.class);
		
		List<FleaReply> replyList=mapper.getReplyList(boardnum);
		
		for(FleaReply list:replyList) {
			System.out.println(list);
		}
		return replyList;
	}
	
	//리플 쓰기
	@RequestMapping(value = "/reply_write", method = RequestMethod.POST)
	public String writeReply(FleaReply write, Model model) {
		
		System.out.println(write.toString());
		
		FleaReplyMapper mapper=sqlSession.getMapper(FleaReplyMapper.class);
		int result=mapper.writeReply(write);
		
		System.out.println(write.getFleaNum()+"번 게시글 리플"+result+"개 리플 삽입 성공");
		
		Flea board = boardRead(write.getFleaNum());
		List<FleaReply> replylist= replyList(write.getFleaNum());
		
		model.addAttribute("board", board);
		model.addAttribute("replylist", replylist);
		
		return "flea_market_read_write";
	}
	@RequestMapping(value = "/flea_reply_delete", method = RequestMethod.GET)
	public String deleteReply(int replyNum,int boardNum, Model model) {
		System.out.println("리플삭제");
		int loginNo= (Integer) httpSession.getAttribute("loginNo");
		System.out.println("리플번호:"+replyNum+", 게시판번호:"+boardNum+", 로그인된 시리얼번호:"+loginNo);
		Map<String, Integer> delete = new HashMap<String, Integer>();
		delete.put("replyNum", replyNum);
		delete.put("loginNo", loginNo);
		FleaReplyMapper mapper=sqlSession.getMapper(FleaReplyMapper.class);
		int result=mapper.deleteReply(delete);
		System.out.println("replyNum번 리플 "+result+" 삭제");
		
		
		model.addAttribute("board", boardRead(boardNum));
		model.addAttribute("replylist", replyList(boardNum));
		
		return "flea_market_read_write";
	};
	
	//게시판 업데이트
		@RequestMapping(value = "/flea_reply_update", method = RequestMethod.POST)
		public @ResponseBody String updateReply(int replyNum, String updateText, Model model) {
			System.out.println("변경텍스트: "+updateText+"리플번호"+replyNum);
			int loginNo= (Integer) httpSession.getAttribute("loginNo");
			Map<String,Object> update=new HashMap<String,Object>();
			update.put("replyText", updateText);
			update.put("userNo", loginNo);
			update.put("replyNum", replyNum);
			
			FleaReplyMapper mapper=sqlSession.getMapper(FleaReplyMapper.class);
			int result=mapper.updateReply(update);
			System.out.println(replyNum+"리플 "+result+"개 수정성공");
			
			return updateText;
		}
	
}
