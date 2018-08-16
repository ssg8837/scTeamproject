package com.scmaster.home;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.scmaster.vo.Hospital;

@Controller
public class HospitalController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	HttpSession httpSession;

	@RequestMapping(value = "/hospital_Test", method = RequestMethod.GET)
	public String hospital_Test(Model model) throws Exception {
		List<Hospital> hspts = new ArrayList<Hospital>();
		int j = 1;
		String k = j + "";
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncFullDown"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /* 공공데이터포털에서 받은 인증키 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(k, "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		System.out.println("Response code: " + conn.getResponseCode());
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		StringBuilder t = new StringBuilder();
		while ((line = rd.readLine()) != null) {
			//sb.append(line);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			org.w3c.dom.Document doc = dBuilder.parse("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncFullDown?ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D&ServiceKey=-&pageNo="+k+"&numOfRows=10");
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				Element eElement = (Element) nNode;
				String hpid = getTagValue("hpid", eElement);
				String address = getTagValue("dutyAddr", eElement);
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
				List<String> time = new ArrayList<String>();
				/*int timeNum = 6;
				
				if (getTagValue("dutyTime6c", eElement) != null) {
					timeNum = 7;
				} if (getTagValue("dutyTime7c", eElement) != null) {
					timeNum = 8;
				} if (getTagValue("dutyTime8c", eElement) != null) {
					timeNum = 9;
				}*/
				
				for (int l = 1; l < 9; l++) {
					String timec = getTagValue("dutyTime"+l+"c", eElement);
					String times = getTagValue("dutyTime"+l+"s", eElement);
						if (timec != null && times != null) {
						timec = timec.substring(0, 2) + ":" + timec.substring(2, timec.length());
						times = times.substring(0, 2) + ":" + times.substring(2, times.length());
						switch (l) {
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
				
				for (int l = 0; l < time.size(); l++) {
					t.append(time.get(l));
				}
				
				Hospital hspt = new Hospital(hpid, address, name, divNam, phone, Integer.parseInt(eryn), eryynphone, t.toString(), latitude, longitude);
				time.clear();
				t.setLength(0);
				hspts.add(hspt);
			}
		}
		rd.close();
		conn.disconnect();
		
		for (int i = 0; i < hspts.size(); i++) {
			System.out.println(i+"번째> "+hspts.get(i));
		}
		
		model.addAttribute("hospital", hspts.get(0));
		return "hospital";
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
