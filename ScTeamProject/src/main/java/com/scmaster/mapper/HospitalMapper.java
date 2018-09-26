package com.scmaster.mapper;

import java.util.List;

import com.scmaster.vo.Hospital;

public interface HospitalMapper {
	public int insertHspt(Hospital hospital);
	public int deleteHspt();
	public List<Hospital> selectAllHspt();
}
