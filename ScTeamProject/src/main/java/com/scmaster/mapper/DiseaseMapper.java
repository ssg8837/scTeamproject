package com.scmaster.mapper;

import java.util.List;

import com.scmaster.vo.Disease;

public interface DiseaseMapper {

	public List<Disease> selectList();

	public Disease selectOne(int diseasenum);
	public int insertDisease(Disease disease); //질병목록 입력
	public int deleteDisease(int diseasenum); //질병목록삭제
}
