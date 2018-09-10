package com.scmaster.home;

import java.util.ArrayList;
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

import com.scmaster.mapper.HospitalMapper;
import com.scmaster.vo.Hospital;

@Controller
public class HospitalController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	HttpSession httpSession;

	@RequestMapping(value = "/hospital_Test", method = RequestMethod.GET)
	public String hospital_Test(Model model) {
		
		return "map";
	}
	
	//, produces="applicatoin/text; charset=UTF8"
	@RequestMapping(value = "/hospital_All", method = RequestMethod.GET)
	public @ResponseBody List<Hospital> hospital_All() throws Exception{
		
		List<Hospital> hspts = new ArrayList<Hospital>();
		Hospital hspt = new Hospital();
		List<String> time = new ArrayList<String>();
		StringBuilder t = new StringBuilder();
		int totalCount = 10;
		for (int i = 1; i < /*totalCount*/2; i++) {
			String api = i + "";
			if (i==1) {
				System.out.println("1번토탈카운트 >" +totalCount);
			}
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncFullDown?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-&pageNo="+api+"&numOfRows=10");
			
			doc.getDocumentElement().normalize();
			
			if (i ==1) {
				NodeList nList1 = doc.getElementsByTagName("body");
				Node nNode1 = nList1.item(0);
				Element eElement1 = (Element) nNode1;
				String count = getTagValue("totalCount", eElement1);
				totalCount = Integer.parseInt(count);
				System.out.println(totalCount);
			}
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int j = 0; j < nList.getLength(); j++) {
				Node nNode = nList.item(j);
				Element eElement = (Element) nNode;
				String hpid = getTagValue("hpid", eElement);
				String load_address = getTagValue("dutyAddr", eElement);
				if (load_address.indexOf("(") > 0) {
					load_address = load_address.substring(0, load_address.indexOf("("));
				}
				String name = getTagValue("dutyName", eElement);
				String divNam = getTagValue("dutyDivNam", eElement);
				String phone = getTagValue("dutyTel1", eElement);
				String eryn = getTagValue("dutyEryn", eElement);
				String eryynphone = "";
				if (eryn.equals("1")) {
					eryynphone = getTagValue("dutyTel2", eElement);
				}
				String latitude = getTagValue("wgs84Lat", eElement);
				String longitude = getTagValue("wgs84Lon", eElement);
				
				for (int k = 1; k < 9; k++) {
					String timec = getTagValue("dutyTime"+k+"c", eElement);
					String times = getTagValue("dutyTime"+k+"s", eElement);
						if (timec != null && times != null) {
						timec = timec.substring(0, 2) + ":" + timec.substring(2, timec.length());
						times = times.substring(0, 2) + ":" + times.substring(2, times.length());
						switch (k) {
						case 1:
							time.add("월 :" + times);
							time.add("~" + timec + " ");
							break;
						case 2:
							time.add("화 :" + times);
							time.add("~" + timec + " ");
							break;
						case 3:
							time.add("수 :" + times);
							time.add("~" + timec + " ");
							break;
						case 4:
							time.add("목 :" + times);
							time.add("~" + timec + " ");
							break;
						case 5:
							time.add("금 :" + times);
							time.add("~" + timec + " ");
							break;
						case 6:
							time.add("토 :" + times);
							time.add("~" + timec + " ");
							break;
						case 7:
							time.add("일 :" + times);
							time.add("~" + timec + " ");
							break;
						case 8:
							time.add("공휴일 :" + times);
							time.add("~" + timec + " ");
							break;
						default:
							break;
						}
					}
				}
				
				for (int k = 0; k < time.size(); k++) {
					t.append(time.get(k));
				}
				
				Hospital h = new Hospital(hpid, load_address, name, divNam, phone, Integer.parseInt(eryn), eryynphone, t.toString(), latitude, longitude, "");
				hspt = h;
				time.clear();
				t.setLength(0);
				hspts.add(hspt);
			}
		}
		HospitalMapper hsptmapper = sqlSession.getMapper(HospitalMapper.class);
		Hospital hsptDB = new Hospital();
		for (int j = 0; j < hspts.size(); j++) {
			System.out.println(j+">"+hspts.get(j));
			//병원 설렉트하고 인설트 하기 병원 날리기
			hsptDB = hsptmapper.selectHspt(hspts.get(j).getHpid());
			if (hsptDB == null) {
				hsptmapper.insertHspt(hspts.get(j));
			}
		}
		return hspts;
	}
	
	@RequestMapping(value = "/babiesHospital", method = RequestMethod.GET)
	public @ResponseBody List<Hospital> babiesHospital(String lat, String lon) throws Exception{
		
		List<Hospital> hspts = new ArrayList<Hospital>();
		Hospital hspt = new Hospital();
		List<String> time = new ArrayList<String>();
		StringBuilder t = new StringBuilder();
		int totalCount = 10;
		for (int i = 1; i < /*totalCount*/2; i++) {
			String api = i + "";
			if (i==1) {
				System.out.println("1번토탈카운트 >" +totalCount);
			}
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getBabyLcinfoInqire?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-&WGS84_LON="
					+ lon + "&WGS84_LAT=" + lat + "&pageNo="+api+"&numOfRows=100");
			doc.getDocumentElement().normalize();
			
			if (i ==1) {
				NodeList nList1 = doc.getElementsByTagName("body");
				Node nNode1 = nList1.item(0);
				Element eElement1 = (Element) nNode1;
				String count = getTagValue("totalCount", eElement1);
				totalCount = Integer.parseInt(count);
				System.out.println(totalCount);
			}
			
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println(nList.getLength());
			for (int j = 0; j < nList.getLength(); j++) {
				Node nNode = nList.item(j);
				Element eElement = (Element) nNode;
				String hpid = getTagValue("hpid", eElement);
				String distance = getTagValue("distance", eElement);
				if (Double.parseDouble(distance) > 0.5) {
					continue;
				}
				String address = getTagValue("dutyAddr", eElement);
				String name = getTagValue("dutyName", eElement);
				String divNam = getTagValue("dutyDivName", eElement);
				String phone = getTagValue("dutyTel1", eElement);
				String latitude = getTagValue("latitude", eElement);
				String longitude = getTagValue("longitude", eElement);		
				
					String timec = getTagValue("endTime", eElement);
					String times = getTagValue("startTime", eElement);
						timec = timec.substring(0, 2) + ":" + timec.substring(2, timec.length());
						times = times.substring(0, 2) + ":" + times.substring(2, times.length());
						time.add(times+"~");
						time.add(timec);
				
				for (int k = 0; k < time.size(); k++) {
					t.append(time.get(k));
				}
				
				Hospital h = new Hospital(hpid, address, name, divNam, phone, 0, "", t.toString(), latitude, longitude, distance);
				hspt = h;
				time.clear();
				t.setLength(0);
				hspts.add(hspt);
			}
		}
		for (int j = 0; j < hspts.size(); j++) {
			System.out.println(j+">"+hspts.get(j));
		}
		System.out.println(lon + "," + lat);
		return hspts;
	}
	
	@RequestMapping(value = "/hospital_myLocation", method = RequestMethod.GET)
	public @ResponseBody List<Hospital> hospital_myLocation(String lat, String lon) throws Exception{
		
		List<Hospital> hspts = new ArrayList<Hospital>();
		Hospital hspt = new Hospital();
		List<String> time = new ArrayList<String>();
		StringBuilder t = new StringBuilder();
		int totalCount = 10;
		for (int i = 1; i < /*totalCount*/2; i++) {
			String api = i + "";
			if (i==1) {
				System.out.println("1번토탈카운트 >" +totalCount);
			}
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-"
					+ "&WGS84_LON=" + lon + "&WGS84_LAT=" + lat + "&pageNo="+api+"&numOfRows=100");
			doc.getDocumentElement().normalize();
			
			if (i ==1) {
				NodeList nList1 = doc.getElementsByTagName("body");
				Node nNode1 = nList1.item(0);
				Element eElement1 = (Element) nNode1;
				String count = getTagValue("totalCount", eElement1);
				totalCount = Integer.parseInt(count);
				System.out.println(totalCount);
				System.out.println(totalCount/10 + 1);
			}
			
			NodeList nList = doc.getElementsByTagName("item");
			System.out.println(nList.getLength());
			for (int j = 0; j < nList.getLength(); j++) {
				Node nNode = nList.item(j);
				Element eElement = (Element) nNode;
				String hpid = getTagValue("hpid", eElement);
				String distance = getTagValue("distance", eElement);
				if (Double.parseDouble(distance) > 5.0) {
					continue;
				}
				String address = getTagValue("dutyAddr", eElement);
				String name = getTagValue("dutyName", eElement);
				String divNam = getTagValue("dutyDivName", eElement);
				String phone = getTagValue("dutyTel1", eElement);
				String latitude = getTagValue("latitude", eElement);
				String longitude = getTagValue("longitude", eElement);		
				
					String timec = getTagValue("endTime", eElement);
					String times = getTagValue("startTime", eElement);
						timec = timec.substring(0, 2) + ":" + timec.substring(2, timec.length());
						times = times.substring(0, 2) + ":" + times.substring(2, times.length());
						time.add(times+"~");
						time.add(timec);
				
				for (int k = 0; k < time.size(); k++) {
					t.append(time.get(k));
				}
				
				Hospital h = new Hospital(hpid, address, name, divNam, phone, 0, "", t.toString(), latitude, longitude, distance);
				hspt = h;
				time.clear();
				t.setLength(0);
				hspts.add(hspt);
			}
		}
		for (int j = 0; j < hspts.size(); j++) {
			System.out.println(j+">"+hspts.get(j));
		}
		System.out.println(lon + "," + lat);
		return hspts;
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
