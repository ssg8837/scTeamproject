package com.scmaster.home;

import java.util.ArrayList;
import java.util.Collections;
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
	public String hospital_Test(Model model) 
	{
		return "map";
	}
	/*
	 * public String hospital_Test(Model model) {
		
		return "hospital";
	}
	
	 * 
	 * 
	*/
	/*@RequestMapping(value = "/hospital_Location", method = RequestMethod.GET)
	public String hospital_Location(Model model) throws Exception {
		address를 받아서 위도, 경도 변환 API 사용 후 위도, 경도로 병원 조회
		조회한 병원 jsp에 뿌리기
		
		String lon = "127.07421";
		String lat = "37.507175";
		
		List<Hospital> hspts = getHospital(lon, lat);
		
		model.addAttribute("hspts", hspts);
		return "hospital";
	}*/
	//, produces="applicatoin/text; charset=UTF8"
	@RequestMapping(value = "/hospital_input", method = RequestMethod.GET, produces = "text/html;charset=utf8")
	public @ResponseBody String hospital_input() throws Exception{
		
		List<Hospital> hspts = new ArrayList<Hospital>();
		Hospital hspt = new Hospital();
		List<String> time = new ArrayList<String>();
		StringBuilder t = new StringBuilder();
		int totalCount = 10;
		for (int i = 1; i < totalCount; i++) {
			String api = i + "";
			if (i==1) {
				System.out.println("1번토탈카운트 >" +totalCount);
			}
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncFullDown?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-&pageNo="+api+"&numOfRows=1000");
			
			doc.getDocumentElement().normalize();
			
			if (i ==1) {
				NodeList nList1 = doc.getElementsByTagName("body");
				Node nNode1 = nList1.item(0);
				Element eElement1 = (Element) nNode1;
				String count = getTagValue("totalCount", eElement1);
				int tCount = Integer.parseInt(count) / 1000;
	            int restCount = Integer.parseInt(count) % 1000;
	            if (tCount == 0) {
	               totalCount = 1;
	            } else {
	               if (restCount != 0) {
	                  totalCount = tCount + 1;
	               }
	               else totalCount = tCount;
	            }
	            System.out.println("전체페이지" + totalCount);
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
			//hspts.add(hspt);
		}
		HospitalMapper hsptmapper = sqlSession.getMapper(HospitalMapper.class);
		if (hspts.size() == 0) {
			return "실패";
		}
		for (int j = 0; j < hspts.size(); j++) {
	       //병원 인설트 하기 병원 날리기
	       hsptmapper.insertHspt(hspts.get(j));
	    }
	    return "성공";
	}
	
	@RequestMapping(value = "/hospital_delete", method = RequestMethod.GET, produces = "text/html;charset=utf8")
	public @ResponseBody String hospital_delete() 
	{
	      HospitalMapper mapper = sqlSession.getMapper(HospitalMapper.class);
	      int result = mapper.deleteHspt();
	      if (result == 0) {
	         return "삭제실패";
	      }
	      return "삭제성공";
	 }
	
	@RequestMapping(value = "/hospital_myLocation", method = RequestMethod.GET)
	public @ResponseBody List<Hospital> hospital_myLocation(String lat, String lon) throws Exception{
		if (lat.length() > 10) {
			lat = lat.substring(0, 10);
		}
		if (lon.length() > 10) {
			lon = lon.substring(0, 10);
		}
		
		List<Hospital> hspts = new ArrayList<Hospital>();
		Hospital hspt = new Hospital();
		List<String> time = new ArrayList<String>();
		String totalcount;
		StringBuilder t = new StringBuilder();
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-"
					+ "&WGS84_LON=" + lon + "&WGS84_LAT=" + lat + "&pageNo=1"+"&numOfRows=300");
			doc.getDocumentElement().normalize();
			
			NodeList nList1 = doc.getElementsByTagName("body");
			Node nNode1 = nList1.item(0);
			Element eElement1 = (Element) nNode1;
			totalcount = getTagValue("totalCount", eElement1);
			System.out.println("전체" + totalcount);
			totalcount="0";
	        System.out.println("수정전체" + totalcount);
			if (!totalcount.equals("0")) {
				NodeList nList = doc.getElementsByTagName("item");
				System.out.println("rows"+nList.getLength());
				for (int j = 0; j < nList.getLength(); j++) {
					Node nNode = nList.item(j);
					Element eElement = (Element) nNode;
					String hpid = getTagValue("hpid", eElement);
					String distance = getTagValue("distance", eElement);
					/*if (Double.parseDouble(distance) > 3.0) {
			               continue;
			        }*/
					String address = getTagValue("dutyAddr", eElement);
					String name = getTagValue("dutyName", eElement);
					String divNam = getTagValue("dutyDivName", eElement);
					if (!divNam.equals("종합병원") && !divNam.equals("병원") && !divNam.equals("의원") && !divNam.equals("한방병원") && !divNam.equals("한의원")) {
			               continue;
			        }
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
					if (hspts.size() > 14) {
						break;
					}
				}
			} else {
				HospitalMapper hmapper = sqlSession.getMapper(HospitalMapper.class);
				List<Hospital> hsptAll = hmapper.selectAllHspt();
				List<Hospital> hp = new ArrayList<Hospital>();
				double distanceKiloMeter, hlat, hlon;
				String divNam;
				System.out.println("DB병원개수"+hsptAll.size());
				for (int i = 0; i < hsptAll.size(); i++) {
					hlat = Double.parseDouble(hsptAll.get(i).getLatitude());
					hlon = Double.parseDouble(hsptAll.get(i).getLongitude());
					divNam = hsptAll.get(i).getDivNam();
					if (!divNam.equals("종합병원") && !divNam.equals("병원") && !divNam.equals("의원") && !divNam.equals("한방병원") && !divNam.equals("한의원")) { 
						continue;
			        }
					distanceKiloMeter = distance(lat, lon, hlat, hlon);
					hsptAll.get(i).setDistance(distanceKiloMeter+"");
					if (distanceKiloMeter < 1.0) {
						hp.add(hsptAll.get(i));
					}
				}
				Collections.shuffle(hp);
				for (int i = 0; i < 15; i++) {
					System.out.println(hp.get(i));
				}
				for (int i = hp.size()-1; i > 0; i--) {
					for (int j = 0; j < i; j++) {
						if(Double.parseDouble(hp.get(j).getDistance()) > Double.parseDouble(hp.get(j+1).getDistance())){
					        hspt = hp.get(j);
					        hp.add(j, hp.get(j+1));
					        hp.remove(j+1);
					        hp.add(j+1, hspt);
					        hp.remove(j+2);
					      }
					}
				}
				for (int i = 0; i < 15; i++) {
					hspts.add(hp.get(i));
				}
			}
		for (int j = 0; j < hspts.size(); j++) {
			System.out.println(j+">"+hspts.get(j));
		}
		System.out.println(lon + "," + lat);
		return hspts;
	}
	
	@RequestMapping(value = "/hospital_baby", method = RequestMethod.GET)
	public @ResponseBody List<Hospital> hospital_baby(String lat, String lon) throws Exception{
		if (lat.length() > 10) {
			lat = lat.substring(0, 10);
		}
		if (lon.length() > 10) {
			lon = lon.substring(0, 10);
		}
		
		
		List<Hospital> hspts = new ArrayList<Hospital>();
		Hospital hspt = new Hospital();
		List<String> time = new ArrayList<String>();
		StringBuilder t = new StringBuilder();
		int totalCount = 10;
		for (int i = 1; i < totalCount; i++) {
			String api = i + "";
			if (i==1) {
				System.out.println("1번토탈카운트 >" +totalCount);
			}
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-"
					+ "&WGS84_LON=" + lon + "&WGS84_LAT=" + lat + "&pageNo="+api+"&numOfRows=1000");
			System.out.println(doc);
			doc.getDocumentElement().normalize();
			
			if (i ==1) {
				NodeList nList1 = doc.getElementsByTagName("body");
				Node nNode1 = nList1.item(0);
				Element eElement1 = (Element) nNode1;
				String count = getTagValue("totalCount", eElement1);
				int tCount = Integer.parseInt(count) / 1000;
	            int restCount = Integer.parseInt(count) % 1000;
	            if (tCount == 0) {
	               totalCount = 1;
	            } else {
	               if (restCount != 0) {
	                  totalCount = tCount + 1;
	               }
	               else totalCount = tCount;
	            }
	            System.out.println("전체페이지" + totalCount);
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
				String divNam = getTagValue("dutyDivName", eElement);
	            if (!divNam.equals("종합병원") && !divNam.equals("병원") && !divNam.equals("의원")) {
	               continue;
	            }
	            String name = getTagValue("dutyName", eElement);
	            if (divNam.equals("병원") || divNam.equals("의원")) {
	            	if (!name.contains("아동") || !name.contains("소아")) {
	            		continue;
	            	}
	            }
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
			if (hspts.size() > 15) {
				break;
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
	//거리계산
    private static double distance(String lat, String lon, double lat2, double lon2) {
        double lat1 = Double.parseDouble(lat);
        double lon1 = Double.parseDouble(lon);
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;

        //거리 mile 단위를 km로 환산
        dist = dist * 1.609344;
 
        return (dist);
    }
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
}
