package com.scmaster.mapper;

import java.util.List;
import java.util.Map;

import com.scmaster.vo.Vaccine;

public interface VaccineMapper {

	public List<Vaccine> selectList(int babyNo);

	public List<Vaccine> selectList2(int babyNo);

	public int insertVaccine(Vaccine vaccine);

	public int updateVaccine(Map<String, Object> map);

}
