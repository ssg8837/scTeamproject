package com.scmaster.vo;

public class Weather {
	private int userNo;
	private String location;
	private String weather; //날씨
	private String cloud; // 구름
	private String temperature; //온도
	private String temperature_min;
	private String temperature_max;
	private String humidity; //습도
	private String wind; //풍량
	private String time;
	private String pm10; //미세먼지
	private String pm10Grade; //미세먼지 등급
	private String pm25; //초미세먼지
	private String pm25Grade; //초미세먼지 등급
	private String uv; //자외선지수
	private String uvGrade; //자외선지수 등급
	private String food; //식중독지수
	private String foodGrade; //식중독지수 등급
	private String THI; //불쾌지수
	private String THIGrade; //불쾌지수 등급
	private String sensibleTemp; //체감온도
	private String sensibleTempGrade; //체감온도 등급
	
	public Weather() {
		// TODO Auto-generated constructor stub
	}

	public Weather(int userNo, String location, String weather, String cloud, String temperature, String temperature_min, String temperature_max,
			String humidity, String wind) {
		super();
		this.userNo = userNo;
		this.location = location;
		this.weather = weather;
		this.cloud = cloud;
		this.temperature = temperature;
		this.temperature_min = temperature_min;
		this.temperature_max = temperature_max;
		this.humidity = humidity;
		this.wind = wind;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getCloud() {
		return cloud;
	}

	public void setCloud(String cloud) {
		this.cloud = cloud;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getTemperature_min() {
		return temperature_min;
	}

	public void setTemperature_min(String temperature_min) {
		this.temperature_min = temperature_min;
	}

	public String getTemperature_max() {
		return temperature_max;
	}

	public void setTemperature_max(String temperature_max) {
		this.temperature_max = temperature_max;
	}

	public String getHumidity() {
		return humidity;
	}

	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}

	public String getWind() {
		return wind;
	}

	public void setWind(String wind) {
		this.wind = wind;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPm10() {
		return pm10;
	}

	public void setPm10(String pm10) {
		this.pm10 = pm10;
	}

	public String getPm10Grade() {
		return pm10Grade;
	}

	public void setPm10Grade(String pm10Grade) {
		this.pm10Grade = pm10Grade;
	}

	public String getPm25() {
		return pm25;
	}

	public void setPm25(String pm25) {
		this.pm25 = pm25;
	}

	public String getPm25Grade() {
		return pm25Grade;
	}

	public void setPm25Grade(String pm25Grade) {
		this.pm25Grade = pm25Grade;
	}

	public String getUv() {
		return uv;
	}

	public void setUv(String uv) {
		this.uv = uv;
	}

	public String getUvGrade() {
		return uvGrade;
	}

	public void setUvGrade(String uvGrade) {
		this.uvGrade = uvGrade;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getFoodGrade() {
		return foodGrade;
	}

	public void setFoodGrade(String foodGrade) {
		this.foodGrade = foodGrade;
	}

	public String getTHI() {
		return THI;
	}

	public void setTHI(String tHI) {
		THI = tHI;
	}

	public String getTHIGrade() {
		return THIGrade;
	}

	public void setTHIGrade(String tHIGrade) {
		THIGrade = tHIGrade;
	}

	public String getSensibleTemp() {
		return sensibleTemp;
	}

	public void setSensibleTemp(String sensibleTemp) {
		this.sensibleTemp = sensibleTemp;
	}

	public String getSensibleTempGrade() {
		return sensibleTempGrade;
	}

	public void setSensibleTempGrade(String sensibleTempGrade) {
		this.sensibleTempGrade = sensibleTempGrade;
	}

	@Override
	public String toString() {
		return "Weather [userNo=" + userNo + ", location=" + location + ", weather=" + weather + ", cloud=" + cloud
				+ ", temperature=" + temperature + ", temperature_min=" + temperature_min + ", temperature_max="
				+ temperature_max + ", humidity=" + humidity + ", wind=" + wind + ", time=" + time + ", pm10=" + pm10
				+ ", pm10Grade=" + pm10Grade + ", pm25=" + pm25 + ", pm25Grade=" + pm25Grade + ", uv=" + uv
				+ ", uvGrade=" + uvGrade + ", food=" + food + ", foodGrade=" + foodGrade + ", THI=" + THI
				+ ", THIGrade=" + THIGrade + ", sensibleTemp=" + sensibleTemp + ", sensibleTempGrade="
				+ sensibleTempGrade + "]";
	}
}
