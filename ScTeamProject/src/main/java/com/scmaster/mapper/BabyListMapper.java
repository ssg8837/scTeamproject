package com.scmaster.mapper;

import java.util.ArrayList;
import com.scmaster.vo.BS_Alarm;

public interface BabyListMapper {

	ArrayList<BS_Alarm> selectMilkCount(int babyNo);		//1일	모유횟수
	ArrayList<BS_Alarm> selectBottleAmount(int babyNo);		//1일	젖병량
	ArrayList<BS_Alarm> selectFoodAmount(int babyNo);		//1일	이유식량
	ArrayList<BS_Alarm> selectPeeCount(int babyNo);			//1일	배소변 횟수
	ArrayList<BS_Alarm> selectShowerCount(int babyNo);		//1일	목욕 횟수
	ArrayList<BS_Alarm> selectSleepCount(int babyNo);		//1일 	수면시간

}
