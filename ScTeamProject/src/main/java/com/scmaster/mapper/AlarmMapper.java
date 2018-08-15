package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.vo.Ajax_Alarm;
import com.scmaster.vo.BS_Alarm;
import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

public interface AlarmMapper {

	ArrayList<Ajax_Alarm> selectBabyAlarmList(int babyNum);

}
