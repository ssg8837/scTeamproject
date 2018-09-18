package com.scmaster.mapper;

import com.scmaster.vo.Weather;

public interface WeatherMapper {
	public int insertWeather(Weather weather);
	public Weather selectWeather(Weather weather);
}
