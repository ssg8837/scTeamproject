package com.scmaster.mapper;

import java.util.ArrayList;
import com.scmaster.vo.SNS;

public interface SNSMapper {
	ArrayList<SNS> selectPublicSNS();
	ArrayList<Integer> selectFriendList(Integer loginNo);
	ArrayList<SNS> selectSNS();

}
