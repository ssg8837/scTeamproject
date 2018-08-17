package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

public interface AlarmMapper {

	ArrayList<BS_Alarm> selectBabyAlarmList(int babyNum);

	void insertAlarm(BS_Alarm alarm);

	void updateAlarm(BS_Alarm alarm);

	BS_Alarm selectAlarm(String alarmNo);

}
