package com.scmaster.mapper;

import java.util.HashMap;

import com.scmaster.vo.BS_User;

public interface MainMapper {

	BS_User selectUser(HashMap<String, String> userMap);

	void insertUser(BS_User user);

}
