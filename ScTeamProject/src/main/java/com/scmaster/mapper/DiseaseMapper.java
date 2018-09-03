package com.scmaster.mapper;

import java.util.List;

import com.scmaster.vo.Disease;

public interface DiseaseMapper {

	public List<Disease> selectList();

	public Disease selectOne(int diseasenum);

}
