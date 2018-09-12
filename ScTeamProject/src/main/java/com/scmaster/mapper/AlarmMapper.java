package com.scmaster.mapper;

import java.util.ArrayList;
import com.scmaster.vo.BS_Alarm;

public interface AlarmMapper {

	ArrayList<BS_Alarm> selectBabyAlarmList(int babyNum);	//babyList에서도 사용합니다. 수정시 유의.

	
	void insertAlarm(BS_Alarm alarm);
	
	void insertAlarm_Detail(BS_Alarm alarm);
	
	void insertAlarm_EndTime(BS_Alarm alarm);
	
	void insertAlarm_AmountNTEndTime(BS_Alarm alarm);
	
	void insertAlarm_All(BS_Alarm alarm);

	
	void updateAlarm(BS_Alarm alarm);

	void updateAlarm_Detail(BS_Alarm alarm);
	
	void updateAlarm_EndTime(BS_Alarm alarm);

	void updateAlarm_AmountNTEndTime(BS_Alarm alarm);
	
	void updateAlarm_All(BS_Alarm alarm);	
	
	
	BS_Alarm selectAlarm(int alarmNo);

	void deleteAlarm(int alarmNo);

	ArrayList<BS_Alarm> selectAlarmList(int loginNo);

}
