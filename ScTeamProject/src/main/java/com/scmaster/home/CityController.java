package com.scmaster.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.scmaster.mapper.CityMapper;
import com.scmaster.mapper.MainMapper;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;
import com.scmaster.vo.City;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CityController 
{
	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/admin_hospital", method = RequestMethod.GET)
	public String city_Test() 
	{
		return "adminHospital";
	}
	
	@RequestMapping(value = "/location_input", method = RequestMethod.POST)
	public @ResponseBody String location_input() throws Exception 
	{
		List<City> city = cityCode();
		if (city == null) {
			return "실패";
		}
		return "성공";
	}
	
	public List<City> cityCode() throws Exception {
		String brtcCd = "";
		List<City> city = cityfirstCode();
		List<City> list2 = new ArrayList<City>();
		
		for (int i=0; i<city.size(); i++) {
		brtcCd = city.get(i).getCityCode();
		
		String url="https://nip.cdc.go.kr/irapi/rest/getCondSggCd.do?serviceKey=PSBYfvxvFrIVh4PnMZ6HDIwOlEcDc7K3NAbmJ5PAOSOB9BLTWfXOZdYAw65Qecliwnk4vJMfIw8kAjwA%2B2UEsw%3D%3D";
	     url+="&brtcCd="+brtcCd;

	      DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse(url);
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("item");

	       for(int j=0; j<nList.getLength(); j++){
	           Node nNode=nList.item(j);
	           String cd,cdNm;
	           Element eElement =(Element) nNode;
	           
	           cd = getTagValue("cd",eElement);
	           cdNm = getTagValue("cdNm",eElement);

	           City secondCity = new City();
	           
	           secondCity.setCityCode(cd);
	           secondCity.setCityName(city.get(i).getCityName()+" "+cdNm);  
	         
	           list2.add(secondCity);
	       }
		}
		CityMapper cmapper = sqlSession.getMapper(CityMapper.class);
		City city2 = new City();
		for (int j = 0; j < list2.size(); j++) {
			System.out.println(j+", "+list2.get(j));
			//지역코드 설렉트하고 인설트 하기 지역코드 날리기
			city2 = cmapper.selectCityCode(list2.get(j).getCityCode());
			if (city2 == null) {
				cmapper.insertCity(list2.get(j));
			}
		}
		return list2;
	}
	public List<City> cityfirstCode() throws Exception {
		   DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse("https://nip.cdc.go.kr/irapi/rest/getCondBrtcCd.do?serviceKey=PSBYfvxvFrIVh4PnMZ6HDIwOlEcDc7K3NAbmJ5PAOSOB9BLTWfXOZdYAw65Qecliwnk4vJMfIw8kAjwA%2B2UEsw%3D%3D");
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("item");
	       
	       List<City> list = new ArrayList<City>();
	       
	       for(int i=0;i<nList.getLength();i++)
	        {
	           Node nNode=nList.item(i);
	           String cd,cdNm;
	           Element eElement =(Element) nNode;
	           
	           cd=getTagValue("cd",eElement);
	           cdNm=getTagValue("cdNm",eElement);
	           
	           City firstCity = new City();
	           firstCity.setCityCode(cd);
	           firstCity.setCityName(cdNm);

	           list.add(firstCity);
	        }
	        CityMapper cmapper = sqlSession.getMapper(CityMapper.class);
			City city = new City();
			for (int j = 0; j < list.size(); j++) {
				System.out.println(j+", "+list.get(j));
				//지역코드 설렉트하고 인설트 하기 지역코드 날리기
				city = cmapper.selectCityCode(list.get(j).getCityCode());
				if (city == null) {
					cmapper.insertCity(list.get(j));
				}
			}
		return list;
	}
	
	@RequestMapping(value = "/location_delete", method = RequestMethod.POST)
	public @ResponseBody String location_delete() 
	{
		CityMapper cmapper = sqlSession.getMapper(CityMapper.class);
		int result = cmapper.deleteCity();
		if (result != 1) {
			return "실패";
		}
		return "성공";
	}
	
	private String getTagValue(String string, Element eElement) {
		if (eElement.getElementsByTagName(string).item(0) == null)
			return null;
		NodeList nlList = eElement.getElementsByTagName(string).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null) {
			return null;
		} return nValue.getNodeValue();
	}
}
