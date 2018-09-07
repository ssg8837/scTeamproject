package com.scmaster.mapper;

import java.util.ArrayList;
import com.scmaster.vo.BS_Alarm;

public interface AlarmMapper {

	ArrayList<BS_Alarm> selectBabyAlarmList(int babyNum);

	void insertAlarm(BS_Alarm alarm);
	
	void insertAlarm_Amount(BS_Alarm alarm);
	
	void insertAlarm_EndTime(BS_Alarm alarm);

	void updateAlarm(BS_Alarm alarm);

	void updateAlarm_Amount(BS_Alarm alarm);
	
	void updateAlarm_EndTime(BS_Alarm alarm);

	BS_Alarm selectAlarm(int alarmNo);

	void deleteAlarm(int alarmNo);

	ArrayList<BS_Alarm> selectAlarmList(int loginNo);

}
