package com.scmaster.mapper;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import com.scmaster.vo.Grow;

public interface GrowMapper {
	
	public List<Grow> showBabyData(int babyno);					//아이 성장기록- 출력
	public List<Grow> showBabyBMI(int babyno);					//아이 성장기록-BMI만 출력

	public List<HashMap<String, BigInteger>> showBabyDataByAge(HashMap<String, Integer> map);	//아이 성장기록 조회
	public int updateGrowData(HashMap<String, Object> map);		//아이 성장기록 수정
	
	public Grow lastInsertData(int babyno);						//가장 최근에 입력한 성장기록 출력
	public int insertBabyData(Grow grow);						//아이 성장기록 작성
	public Grow checkAge(HashMap<String, Object> map);			//입력했던 기록중에 같은 나이가 있는지 확인
}
