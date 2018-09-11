package com.scmaster.mapper;

import com.scmaster.vo.City;

public interface CityMapper {
	public City selectCityName(String cityName);
	public City selectCityNM(String cityName);
	public City selectCityCode(String cityCode);
	public int insertCity(City city);
}
