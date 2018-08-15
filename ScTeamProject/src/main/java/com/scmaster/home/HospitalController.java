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

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.vo.Hospital;

@Controller
public class HospitalController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	HttpSession httpSession;

	@RequestMapping(value = "/hospital_Test", method = RequestMethod.GET)
	public String hospital_Test(Model model) throws IOException{
		List<Hospital> hspts = new ArrayList<Hospital>();
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncFullDown"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /* 공공데이터포털에서 받은 인증키 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
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
		Hospital hspt = new Hospital();	
		String line2;
		StringBuilder t = new StringBuilder();
		while ((line = rd.readLine()) != null) {
			sb.append(line);
			if (line.contains("<dutyAddr>")) {
				line2 = line.replace("<dutyAddr>", "");
				line = line2.replace("</dutyAddr>", "");
				hspt.setAddress(line);
			} else if (line.contains("<dutyDivNam>")) {
				line2 = line.replace("<dutyDivNam>", "");
				line = line2.replace("</dutyDivNam>", "");
				hspt.setDivNam(line);
			} else if (line.contains("<dutyEryn>")) {
				line2 = line.replace("<dutyEryn>", "");
				line = line2.replace("</dutyEryn>", "");
				hspt.setEryn(Integer.parseInt(line));
			} else if (line.contains("<dutyName>")) {
				line2 = line.replace("<dutyName>", "");
				line = line2.replace("</dutyName>", "");
				hspt.setName(line);
			} else if (line.contains("<dutyTel1>")) {
				line2 = line.replace("<dutyTel1>", "");
				line = line2.replace("</dutyTel1>", "");
				hspt.setPhone(line);
			}/* else if (line.contains("<dutyTime1s>")) {
				line2 = line.replace("<dutyTime1s>", "");
				line = line2.replace("</dutyTime1s>", "");
				line = line.substring(0, 2) + ":" + line.substring(2, line.length());
				t.append("평일 : "+ line);
			} else if (line.contains("<dutyTime2c>")) {
				line2 = line.replace("<dutyTime2c>", "");
				line = line2.replace("</dutyTime2c>", "");
				line = line.substring(0, 2) + ":" + line.substring(2, line.length());
				t.append("~" + line);
				hspt.setTime(line);
			} else if (line.contains("<dutyTime1s>")) {
				line2 = line.replace("<dutyTime1s>", "");
				line = line2.replace("</dutyTime1s>", "");
				line = line.substring(0, 2) + ":" + line.substring(2, line.length());
				t.append("평일 : "+ line);
			} else if (line.contains("<dutyTime2c>")) {
				line2 = line.replace("<dutyTime2c>", "");
				line = line2.replace("</dutyTime2c>", "");
				line = line.substring(0, 2) + ":" + line.substring(2, line.length());
				t.append("~" + line);
				hspt.setTime(line);
			}*/ else if (line.contains("<hpid>")) {
				line2 = line.replace("<hpid>", "");
				line = line2.replace("</hpid>", "");
				hspt.setHpid(line);
			} else if (line.contains("<wgs84Lat>")) {
				line2 = line.replace("<wgs84Lat>", "");
				line = line2.replace("</wgs84Lat>", "");
				hspt.setLatitude(line);
			} else if (line.contains("<wgs84Lon>")) {
				line2 = line.replace("<wgs84Lon>", "");
				line = line2.replace("</wgs84Lon>", "");
				hspt.setLatitude(line);
			}  else if (line.contains("</item>")) {
				hspts.add(hspt);
				sb.setLength(0);
			}
		}
		rd.close();
		conn.disconnect();
		
		System.out.println("마지막병원"+sb.toString());
		for (int i = 0; i < hspts.size(); i++) {
			System.out.println("i번째> "+hspts.get(i));
		}
		
		model.addAttribute("hospital", sb.toString());
		return "hospital";
	}
}
