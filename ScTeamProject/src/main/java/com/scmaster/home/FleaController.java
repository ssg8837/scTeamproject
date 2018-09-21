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
import org.springframework.web.multipart.MultipartFile;

import com.scmaster.mapper.FleaMapper;
import com.scmaster.util.PageNavigator;
import com.scmaster.vo.Flea;


//메인화면, 로그인, 회원가입, 회원정보수정, 아이추가 기능 이쪽 컨트롤러에 있습니다.

@Controller
public class FleaController 
{
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	final int countPerPage = 10;			//페이지 당 글 수
	final int pagePerGroup = 5;			//페이지 이동 그룹 당 표시할 페이지 수
	
	private static final String UPLOADPATH = "C://FileRepo//FleaPics"; //프로필사진 저장용
	
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
	
	@RequestMapping(value = "/flea_read", method = RequestMethod.GET)
	public String boardRead(int fleaNum, Model model) {
		System.out.println(fleaNum+"게시글 ");
		model.addAttribute("board", boardRead(fleaNum));
		
		return "flea_market_read_write";
	}
	
	public Flea boardRead(int fleaNum) {
		Flea board=selectOne(fleaNum);
		return board;
	}
	
	public Flea selectOne(int fleaNum) {
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		Flea board=mapper.selectOne(fleaNum);
		mapper.updateHits(fleaNum);
		
		return board;
	}
	
	@RequestMapping(value = "/flea_new", method = RequestMethod.GET)
	public String newWrite() {
		return "flea_market_read_write";
	}
	
	@RequestMapping(value = "/flea_write", method = RequestMethod.POST)
	public String boardWrite(Flea write, MultipartFile fleaSavedFile,Model model) {
		write.setFleaSavedFile(uploadfile(fleaSavedFile));
		System.out.println(write.toString());
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		int result=mapper.boardWrite(write);
		System.out.println(write.getFleaNum()+"게시글"+result+"개 게시글 삽입 성공");
		model.addAttribute("board", boardRead(write.getFleaNum()));
		
		return "flea_market_read_write";
	}
	
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
	
	@RequestMapping(value = "/flea_delete", method = RequestMethod.GET)
	public String deleteBoard(int fleaNum) {
		
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		int result=mapper.deleteBoard(fleaNum);
		System.out.println(result);
		return "redirect:flea_list";
	}
	
	@RequestMapping(value = "/flea_update", method = RequestMethod.POST)
	public String updateBoard(Flea update, Model model, MultipartFile uploadedfile) {
		if(uploadfile(uploadedfile)!=null) {
		update.setFleaSavedFile(uploadfile(uploadedfile));
		}
		System.out.println(update);
		
		FleaMapper mapper=sqlSession.getMapper(FleaMapper.class);
		int result=mapper.updateBoard(update);
		System.out.println(result);
		
		return "redirect:flea_read";
	}

}
