package com.scmaster.home;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scmaster.mapper.DiseaseMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.mapper.VaccineMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;
import com.scmaster.vo.Disease;
import com.scmaster.vo.Vaccine;

@Controller
public class VaccineController {


	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	@RequestMapping(value = "/vaccineForm", method = RequestMethod.GET)
	public String vaccineTest(HttpSession session,Model model,
								@RequestParam(value="babyNo", defaultValue="0") int babyNo){
		
		//예방접종 정보 가지고 오기
		DiseaseMapper diseaseMapper = sqlSession.getMapper(DiseaseMapper.class);
		List<Disease> diseaseList = diseaseMapper.selectList();

		//아기 정보 가지고 오기
		MainMapper mainMapper = sqlSession.getMapper(MainMapper.class);
		int userno = (Integer)session.getAttribute("loginNo");
		List<BS_Baby> babyList =  mainMapper.selectBabyList(userno);

		//예방접종+아기정보 
		VaccineMapper vaccineMapper = sqlSession.getMapper(VaccineMapper.class);
		List<Vaccine> vaccineList = vaccineMapper.selectList(babyNo); 
		
		//vaccine 테이블에 넣고 가지고 오기
		List<Vaccine> vaccineList2 = vaccineMapper.selectList2(babyNo);
		if(vaccineList2.size()==0) {
			for(int i=0;i<vaccineList.size();i++) {
				vaccineMapper.insertVaccine(vaccineList.get(i));
			}
		}
		List<Vaccine> vaccineList3 = vaccineMapper.selectList2(babyNo);

		//예방접종 권장일 처리
		BS_Baby selectedBaby = mainMapper.selectBaby(babyNo);
		
		for(int i=0;i<vaccineList3.size();i++){
			
			Calendar cal = Calendar.getInstance();
			if(selectedBaby!=null) {
				String y = selectedBaby.getBabyBirth().substring(0, 4);
				String m = selectedBaby.getBabyBirth().substring(5, 7);
				String d = selectedBaby.getBabyBirth().substring(8, 10);
				
				cal.set(Calendar.YEAR, Integer.parseInt(y));
				cal.set(Calendar.MONTH, Integer.parseInt(m)-1);
				cal.set(Calendar.DATE, Integer.parseInt(d));	 
			}
			
			cal.add(Calendar.MONTH, Integer.parseInt(vaccineList3.get(i).getVaccineDate()));
			vaccineList3.get(i).setVaccineDate(cal.get(Calendar.YEAR)+"년 "+(cal.get(Calendar.MONTH)+1)+"월 "+cal.get(Calendar.DATE)+"일");
			
			//예방접종 권장일 예외 사항들 처리
			if(vaccineList3.get(i).getDiseaseName().equals("결핵(Tuberculosis) ")) {
				vaccineList3.get(i).setVaccineDate("생후 4주 이내 1회 접종");
			}
			
			if(vaccineList3.get(i).getDiseaseName().equals("인플루엔자 (Influenza : Flu)")) {
				vaccineList3.get(i).setVaccineDate("매년");
			}
		}
		
		model.addAttribute("babyList", babyList);
		model.addAttribute("diseaseList", diseaseList);
		model.addAttribute("vaccineList", vaccineList3);
		model.addAttribute("babyNo", babyNo);
		
		
		//프로필사진 불러오기
		Object loginNo=httpSession.getAttribute("loginNo");
		MainMapper mapperM=sqlSession.getMapper(MainMapper.class);
		BS_User user=mapperM.myAccount((Integer)loginNo);
		model.addAttribute("user",user);
		
		return "vaccineForm";
	}
	
	//질병 상세 정보
	@RequestMapping(value = "/diseaseDetail", method = RequestMethod.GET)
	public @ResponseBody Disease diseaseDetail(String diseasenum){
		
		System.out.println("호엥엥ㅇㅇㅇㅇㅇ");
		System.out.println(diseasenum);
		DiseaseMapper diseaseMapper = sqlSession.getMapper(DiseaseMapper.class);
		Disease disease = diseaseMapper.selectOne(Integer.parseInt(diseasenum));
		
		return disease;
	}
	
	//접종등록 팝업창	
	@RequestMapping(value = "/registerPopup", method = RequestMethod.GET)
	public String registerPopup(int babyNo, int diseaseNum, String diseaseName, String vaccineType, Model model){
		
		model.addAttribute("babyNo", babyNo);
		model.addAttribute("diseaseNum", diseaseNum);
		model.addAttribute("diseaseName", diseaseName);
		model.addAttribute("vaccineType", vaccineType);
		return "registerPopup";
	}
	
	//접종등록취소	
	@RequestMapping(value = "/registerCheck", method = RequestMethod.GET)
	public @ResponseBody String registerCheck(int babyNo, int diseaseNum, String vaccineCheck, String checkdate, String memo, String vaccineType){
	
		VaccineMapper vaccineMapper = sqlSession.getMapper(VaccineMapper.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("babyNo", babyNo);
		map.put("diseaseNum", diseaseNum);
		map.put("vaccineCheck", vaccineCheck);
		if(checkdate!=null) {
			map.put("checkdate", checkdate.replace("-", ""));
		}
		map.put("vaccineType", vaccineType);
		map.put("memo", memo);
			
		vaccineMapper.updateVaccine(map);
			
		return "ok";
	}
	
}
