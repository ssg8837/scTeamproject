package com.scmaster.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.scmaster.vo.City;
import com.scmaster.vo.VaccineHospital;


@Controller
public class VaccineControllerForHospital{

	private String getTagValue(String string, Element eElement) {
		NodeList nlList =eElement.getElementsByTagName(string).item(0).getChildNodes();
		Node nValue =(Node) nlList.item(0);
		if(nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	// 시/도 가져오깅
	@RequestMapping(value = "/vaccineFormForHospital", method = RequestMethod.GET)
	public String vaccineFormForHospital(Model model) throws Exception{
		
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
	    
	    model.addAttribute("list", list);
	    
		return "vaccineFormForHospital";
	}
	
	// 시/군/구 가져오깅
	@RequestMapping(value = "/SearchSecondCity", method = RequestMethod.GET)
	public @ResponseBody List<City> SearchSecondCity(String brtcCd) throws Exception{
		
		String url="https://nip.cdc.go.kr/irapi/rest/getCondSggCd.do?serviceKey=PSBYfvxvFrIVh4PnMZ6HDIwOlEcDc7K3NAbmJ5PAOSOB9BLTWfXOZdYAw65Qecliwnk4vJMfIw8kAjwA%2B2UEsw%3D%3D";
		url+="&brtcCd="+brtcCd;
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	    org.w3c.dom.Document doc = dBuilder.parse(url);
	    doc.getDocumentElement().normalize();
	     
	    NodeList nList =doc.getElementsByTagName("item");
	     
	    List<City> list2 = new ArrayList<City>();

	    for(int i=0;i<nList.getLength();i++){
	        Node nNode=nList.item(i);
	        String cd,cdNm;
	        Element eElement =(Element) nNode;
	        
	        cd = getTagValue("cd",eElement);
	        cdNm = getTagValue("cdNm",eElement);
	        //System.out.println(cd);
	        City secondCity = new City();
	        
	        secondCity.setCityCode(cd);
	        secondCity.setCityName(cdNm);  
	        
	        list2.add(secondCity);
        }
	    
	    return list2;    
	}//SearchSecondCity
	
	//병원 검색 ㅠㅠ
	@RequestMapping(value = "/Searchhospital", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> hopitalTest3(String brtcCd, String sggCd,
															@RequestParam(value="page", defaultValue="1") String page
															) throws Exception{
		
		List<VaccineHospital> vhList = new ArrayList<VaccineHospital>();
		
		String url="https://nip.cdc.go.kr/irapi/rest/getOrgList.do?serviceKey=PSBYfvxvFrIVh4PnMZ6HDIwOlEcDc7K3NAbmJ5PAOSOB9BLTWfXOZdYAw65Qecliwnk4vJMfIw8kAjwA%2B2UEsw%3D%3D";
		url += "&brtcCd="+brtcCd;
		url += "&sggCd="+sggCd;
		url += "&pageNo="+page;
		url += "&numberOfRows=15";
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	    org.w3c.dom.Document doc = dBuilder.parse(url);
	    doc.getDocumentElement().normalize();
	     
	    NodeList tempList = doc.getElementsByTagName("body"); 
	    Node tempNode=tempList.item(0);
	    Element tempElement =(Element) tempNode;
	    String totalCount = getTagValue("totalCount",tempElement);
	    
	    NodeList nList = doc.getElementsByTagName("item"); 
	    
	    
	    for(int i=0;i<nList.getLength();i++){
	        Node nNode=nList.item(i);
	        String orgnm,orgTlno,orgAddr,expnYmd;
	        Element eElement =(Element) nNode;
	        
	        orgnm = getTagValue("orgnm",eElement);
	        orgTlno = getTagValue("orgTlno",eElement);
	        orgAddr = getTagValue("orgAddr",eElement);
	        expnYmd = getTagValue("expnYmd",eElement);
	        
	        VaccineHospital vaccineHospital = new VaccineHospital();
	        vaccineHospital.setOrgnm(orgnm);
	        vaccineHospital.setOrgTlno(orgTlno);
	        vaccineHospital.setOrgAddr(orgAddr);
	        vaccineHospital.setExpnYmd(expnYmd);
	        
	        vhList.add(vaccineHospital);   
        }
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", totalCount);
		map.put("vhList", vhList);
	    
	
	    return map;
	}
	
	
}
