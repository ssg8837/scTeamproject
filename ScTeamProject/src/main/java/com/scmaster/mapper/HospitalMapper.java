package com.scmaster.mapper;

import com.scmaster.vo.Hospital;

public interface HospitalMapper {
	public int insertHspt(Hospital hospital);
	public Hospital selectHspt(String hpid);
	
}
