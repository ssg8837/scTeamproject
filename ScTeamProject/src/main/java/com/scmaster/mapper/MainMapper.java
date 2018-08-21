package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

public interface MainMapper {

	BS_User selectUser(HashMap<String, String> userMap);
	void insertUser(BS_User user);
	ArrayList<BS_Baby> selectBabyList(int loginNo);
	void insertBaby(BS_Baby baby);
	BS_Baby selectBaby(int babyNo);
	int countUser(String userId);
	
}
