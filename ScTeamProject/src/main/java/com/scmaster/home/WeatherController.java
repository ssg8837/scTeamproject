package com.scmaster.home;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.scmaster.mapper.CityMapper;
import com.scmaster.vo.City;
import com.scmaster.vo.Weather;

@Controller
public class WeatherController {


	@Autowired SqlSession sqlSession;
	@Autowired HttpSession httpSession;
	
	@RequestMapping(value = "/weather_Test", method = RequestMethod.GET)
	public String weather_Test() 
	{
		return "weather";
	}
	
	@RequestMapping(value = "/city_Test", method = RequestMethod.GET)
	public String city_Test() 
	{
		return "city";
	}
	
	@RequestMapping(value = "/weather", method = RequestMethod.GET)
	public @ResponseBody Weather weather(String lon, String lat, String location, HttpServletRequest request) throws Exception {

        Weather weather = weatherApi(lon, lat, location, request);
        
		return weather;
	}
	
	@RequestMapping(value = "/weather_search", method = RequestMethod.GET)
	public @ResponseBody Weather weather_search(String lon, String lat, String location, HttpServletRequest request) throws Exception {
		
        Weather weather = weatherApi(lon, lat, location, request);
        
		return weather;
	}
	
	@RequestMapping(value = "/code", method = RequestMethod.GET, produces="text/html; charset=UTF8")
	public @ResponseBody String city() throws Exception {
        
		cityCode();
		
		return "성공";
	}
	
	public Weather weatherApi(String lon, String lat, String location, HttpServletRequest request) throws Exception {
		
		StringBuilder result = new StringBuilder();
        
        try {

			String urlstr = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&APPID=752e7907b1eeed5e0cdafda23c8deca6";
			URL url = new URL(urlstr);
			BufferedReader bf;
			String line;

			bf = new BufferedReader(new InputStreamReader(url.openStream()));

			while ((line = bf.readLine()) != null) {
				result.append(line);		
			}

			bf.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
        System.out.println(result.toString());
        String rweather = "";
        /*rweather = result.toString().split("main\":")[1];
		String main1 = rweather.substring(0, rweather.indexOf(","));
		rweather = result.toString().split("description\":")[1];
		String main2 = rweather.substring(0, rweather.indexOf(","));*/
        rweather = result.toString().split("icon\":\"")[1];
		String main = rweather.substring(0, rweather.indexOf("\""));
		main = "http://openweathermap.org/img/w/"+ main + ".png";
		rweather = result.toString().split("all\":")[1];
		String cloud = rweather.substring(0, rweather.indexOf("}"));
		
		rweather = result.toString().split("temp\":")[1];
		String temp = rweather.substring(0, rweather.indexOf(","));
		temp = (double)(Math.round((Double.parseDouble(temp) - 273.15)*10))/10 + "";

		rweather = result.toString().split("temp_min\":")[1];
		String temp_min = rweather.substring(0, rweather.indexOf(","));
		temp_min =  (double)(Math.round((Double.parseDouble(temp_min) - 273.15)*10))/10 + "";
		
		rweather = result.toString().split("temp_max\":")[1];
		String temp_max = rweather.substring(0, rweather.indexOf("}"));
		temp_max =  (double)(Math.round((Double.parseDouble(temp_max) - 273.15)*10))/10 + "";
		
		rweather = result.toString().split("humidity\":")[1];
		String humidity = rweather.substring(0, rweather.indexOf(","));
		
		rweather = result.toString().split("speed\":")[1];
		String wind = rweather.substring(0, rweather.indexOf(","));
		
		//userNo 가져오기
		httpSession = request.getSession();
		/*String usernum = (String) httpSession.getAttribute("userNo");
		int userNo = Integer.parseInt(usernum);*/
		Weather weather = new Weather(1, location, main, cloud, temp, temp_min, temp_max, humidity, wind);
		
		weather = life(weather);
		System.out.println("1>"+weather);
		weather = air(weather);
		
		System.out.println("2>"+weather);
		
		return weather;
	}

	public List<City> cityCode() throws Exception {
		String brtcCd = "";
		List<City> city = cityDetailCode();
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
	public List<City> cityDetailCode() throws Exception {
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
	private String getTagValue(String string, Element eElement) {
		if (eElement.getElementsByTagName(string).item(0) == null)
			return null;
		NodeList nlList = eElement.getElementsByTagName(string).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null) {
			return null;
		} return nValue.getNodeValue();
	}
	
	public Weather air(Weather weather) throws Exception {
		String location = weather.getLocation().substring(0, 2);
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?"
	       		+ "sidoName="+location+"&searchCondition=HOUR&pageNo=1&numOfRows=50&ServiceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D");
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("item");
	       
	       for(int i=0;i<nList.getLength();i++)
	        {
	           Node nNode=nList.item(i);
	           String pm10,pm25,cityName;
	           Element eElement =(Element) nNode;
	           
	           cityName=getTagValue("cityName",eElement);
	           pm10=getTagValue("pm10Value",eElement);
	           pm25=getTagValue("pm25Value",eElement);

	           if (weather.getLocation().contains(cityName)) {
	        	   weather.setPm10(pm10);
		           weather.setPm25(pm25);
		           //코드로 수정  ->
		           if (!pm10.contains("-")) {
		        	   int p10 = Integer.parseInt(pm10);
			           
			           if (p10<=15) {
			        	   weather.setPm10Grade("좋음");
			           } else if (p10<=35) {
			        	   weather.setPm10Grade("보통");
			           } else if (p10<=75) {
			        	   weather.setPm10Grade("나쁨");
			           } else weather.setPm10Grade("매우나쁨");
		           } else weather.setPm10Grade("-");
		           
		           if (!pm10.contains("-")) {
			           int p25 = Integer.parseInt(pm25);
			           
			           if (p25<=15) {
			        	   weather.setPm25Grade("좋음");
			           } else if (p25<=35) {
			        	   weather.setPm25Grade("보통");
			           } else if (p25<=75) {
			        	   weather.setPm25Grade("나쁨");
			           } else weather.setPm25Grade("매우나쁨");
		           } else weather.setPm25Grade("-");
		       break;//<-코드 수정
	           }
	        }
	    return weather;  
	}
	public Weather life(Weather weather) throws Exception {
		String address = weather.getLocation();
		System.out.println("1"+address);
		address = addressCode(address);
		System.out.println(address);

		String add[] = weather.getLocation().split(" ");
		
		CityMapper cmapper = sqlSession.getMapper(CityMapper.class);
		City city = new City();
		if (add.length > 1) {
			city = cmapper.selectCityName(add[1]);
			System.out.println(add[1]);
		} else city = cmapper.selectCityNM(weather.getLocation());
		//주소를 DB에서 검색해서 지역코드로 변환
		System.out.println(city);
		String addressCode = city.getCityCode();
		if (addressCode.length() == 5) {
			addressCode += "00000";
		} else if (addressCode.length() == 4) {
			addressCode += "000000";
		}
		System.out.println(addressCode);
		weather = uv(weather, addressCode);
		weather = food(weather, addressCode);
		weather = thi(weather, addressCode);
		weather = sensibleTemp(weather, addressCode);

		return weather;
	}
	
	private String addressCode(String address) {
		String add[] = address.split(" ");
		if (add.length > 1) {
			if (add[0].contains("서울") || add[0].contains("서울시") || add[0].contains("서울특별시")) {
				address = "서울특별시 " + add[1];
			} else if (add[0].contains("대구") || add[0].contains("대구시") || add[0].contains("대구광역시")) {
				address = "대구광역시 " + add[1];
			} else if (add[0].contains("인천") || add[0].contains("인천시") || add[0].contains("인천광역시")) {
				address = "인천광역시 " + add[1];
			} else if (add[0].contains("광주") || add[0].contains("광주시") || add[0].contains("광주광역시")) {
				address = "광주광역시 " + add[1];
			} else if (add[0].contains("대전") || add[0].contains("대전시") || add[0].contains("대전광역시")) {
				address = "대전광역시 " + add[1];
			} else if (add[0].contains("울산") || add[0].contains("울산시") || add[0].contains("울산광역시")) {
				address = "울산광역시 " + add[1];
			} else if (add[0].contains("세종") || add[0].contains("세종시") || add[0].contains("세종특별자치시") || add[0].contains("세종특별시")) {
				address = "세종특별자치시 " + add[1];
			} else if (add[0].contains("경기") || add[0].contains("경기도")) {
				address = "경기도 " + add[1];
			} else if (add[0].contains("강원") || add[0].contains("강원도")) {
				address = "강원도 " + add[1];
			} else if (add[0].contains("충북") || add[0].contains("충청북도")) {
				address = "충청북도 " + add[1];
			} else if (add[0].contains("충남") || add[0].contains("충청남도")) {
				address = "충청남도 " + add[1];
			} else if (add[0].contains("전북") || add[0].contains("전라북도")) {
				address = "전라북도 " + add[1];
			} else if (add[0].contains("전남") || add[0].contains("전라남도")) {
				address = "전라남도 " + add[1];
			} else if (add[0].contains("경남") || add[0].contains("경상남도")) {
				address = "경상남도 " + add[1];
			} else if (add[0].contains("경북") || add[0].contains("경상북도")) {
				address = "경상북도 " + add[1];
			} else if (add[0].contains("제주") || add[0].contains("제주도") || add[0].contains("제주특별자치도")) {
				address = "제주특별자치도 " + add[1];
			} else if (add[0].contains("부산") || add[0].contains("부산시") || add[0].contains("부산광역시")) {
				address = "부산광역시 " + add[1];
			}
			if (add.length > 2) {
				for (int i = 2; i < add.length; i++) {
					address += " " + add[i];
				}
			}
		} else {
			if (add[0].contains("서울") || add[0].contains("서울시") || add[0].contains("서울특별시")) {
				address = "서울특별시";
			} else if (add[0].contains("대구") || add[0].contains("대구시") || add[0].contains("대구광역시")) {
				address = "대구광역시 ";
			} else if (add[0].contains("인천") || add[0].contains("인천시") || add[0].contains("인천광역시")) {
				address = "인천광역시 ";
			} else if (add[0].contains("광주") || add[0].contains("광주시") || add[0].contains("광주광역시")) {
				address = "광주광역시 ";
			} else if (add[0].contains("대전") || add[0].contains("대전시") || add[0].contains("대전광역시")) {
				address = "대전광역시 ";
			} else if (add[0].contains("울산") || add[0].contains("울산시") || add[0].contains("울산광역시")) {
				address = "울산광역시 ";
			} else if (add[0].contains("세종") || add[0].contains("세종시") || add[0].contains("세종특별자치시") || add[0].contains("세종특별시")) {
				address = "세종특별자치시 ";
			} else if (add[0].contains("경기") || add[0].contains("경기도")) {
				address = "경기도 ";
			} else if (add[0].contains("강원") || add[0].contains("강원도")) {
				address = "강원도 ";
			} else if (add[0].contains("충북") || add[0].contains("충청북도")) {
				address = "충청북도 ";
			} else if (add[0].contains("충남") || add[0].contains("충청남도")) {
				address = "충청남도 ";
			} else if (add[0].contains("전북") || add[0].contains("전라북도")) {
				address = "전라북도 ";
			} else if (add[0].contains("전남") || add[0].contains("전라남도")) {
				address = "전라남도 ";
			} else if (add[0].contains("경남") || add[0].contains("경상남도")) {
				address = "경상남도 ";
			} else if (add[0].contains("경북") || add[0].contains("경상북도")) {
				address = "경상북도 ";
			} else if (add[0].contains("제주") || add[0].contains("제주도") || add[0].contains("제주특별자치도")) {
				address = "제주특별자치도 ";
			} else if (add[0].contains("부산") || add[0].contains("부산시") || add[0].contains("부산광역시")) {
				address = "부산광역시";
			}
		}
		
		return address;
	}

	private Weather sensibleTemp(Weather weather, String addressCode) throws Exception {
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getSensorytemLifeList?"
	       		+ "serviceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D"
	       		+ "&areaNo="+addressCode);
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("IndexModel");
	       
	       for(int i=0;i<nList.getLength();i++)
	        {
	           Node nNode=nList.item(i);
	           String sensibleTemp;
	           Element eElement =(Element) nNode;
	           
	           sensibleTemp=getTagValue("h3",eElement);
	           
	           if (sensibleTemp != null) {
	        	   weather.setSensibleTemp(sensibleTemp);
		           int st = Integer.parseInt(sensibleTemp);
		           
		           if (st<-45) {
		        	   weather.setSensibleTempGrade("위험");
		           } else if (st<-25) {
		        	   weather.setSensibleTempGrade("경고");
		           } else if (st<-10) {
		        	   weather.setSensibleTempGrade("주의");
		           } else weather.setSensibleTempGrade("관심");
	           }
	        }
		return weather;
	}

	private Weather thi(Weather weather, String addressCode) throws Exception {
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getDsplsLifeList?"
	       		+ "serviceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D"
	       		+ "&areaNo="+addressCode);
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("IndexModel");
	       
	       for(int i=0;i<nList.getLength();i++)
	        {
	           Node nNode=nList.item(i);
	           String thi;
	           Element eElement =(Element) nNode;
	           
	           thi=getTagValue("h3",eElement);

	           if (thi != null) {
	        	   weather.setTHI(thi);
		           int thiG = Integer.parseInt(thi);

		           if (thiG>=80) {
		        	   weather.setTHIGrade("매우높음(전원 불쾌감을 느낌)");
		           } else if (thiG>=75) {
		        	   weather.setTHIGrade("높음(인원의 50%정도 불쾌감을 느낌)");
		           } else if (thiG>=68) {
		        	   weather.setTHIGrade("보통(불쾌감이 나타나기 시작)");
		           } else weather.setTHIGrade("낮음(전원 쾌적함을 느낌)");
	           }
	        }
		return weather;
	}

	private Weather food(Weather weather, String addressCode) throws Exception {
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getFsnLifeList?"
	       		+ "serviceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D"
	       		+ "&areaNo="+addressCode);
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("IndexModel");
	       
	       for(int i=0;i<nList.getLength();i++)
	        {
	           Node nNode=nList.item(i);
	           String food;
	           Element eElement =(Element) nNode;
	           
	           food=getTagValue("today",eElement);
	           
	           if (food != null) {
	        	   weather.setFood(food);
		           int foodG = Integer.parseInt(food);

		           if (foodG>=95) {
		        	   weather.setFoodGrade("위험");
		           } else if (foodG>=70) {
		        	   weather.setFoodGrade("경고");
		           } else if (foodG>=35) {
		        	   weather.setFoodGrade("주의");
		           } else weather.setFoodGrade("관심");
	           }
	        }
		return weather;
	}

	private Weather uv(Weather weather, String addressCode) throws Exception {
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	       DocumentBuilder dBuilder =dbFactory.newDocumentBuilder();
	       org.w3c.dom.Document doc = dBuilder.parse("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getUltrvLifeList?"
	       		+ "serviceKey=dBWeSsetEKQH5l9aSW9wYkfPc7JjYZsNg3%2FimojYuBbGY4ktoST1JZU1czNJfm0A42OV8MZm8Df6yRRFTkO32Q%3D%3D"
	       		+ "&areaNo="+addressCode);
	       doc.getDocumentElement().normalize();
	        
	       NodeList nList =doc.getElementsByTagName("IndexModel");
	       
	       for(int i=0;i<nList.getLength();i++)
	        {
	           Node nNode=nList.item(i);
	           String uv;
	           Element eElement =(Element) nNode;
	           
	           uv=getTagValue("today",eElement);

	           if (uv != null) {
	        	   weather.setUv(uv);
		           int uvG = Integer.parseInt(uv);

		           if (uvG>=11) {
		        	   weather.setUvGrade("위험");
		           } else if (uvG>=8) {
		        	   weather.setUvGrade("매우높음");
		           } else if (uvG>=6) {
		        	   weather.setUvGrade("높음");
		           } else if (uvG>=3) {
		        	   weather.setUvGrade("보통");
		           } else weather.setUvGrade("낮음");
	           }
	        }
		return weather;
	}
}

