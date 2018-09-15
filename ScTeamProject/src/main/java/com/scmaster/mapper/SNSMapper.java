package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.vo.Friend;
import com.scmaster.vo.Likely;
import com.scmaster.vo.SNS;
import com.scmaster.vo.SNS_Reply;

public interface SNSMapper {
	ArrayList<SNS> selectPublicSNS();
	ArrayList<Integer> selectFriendList(Integer loginNo);
	ArrayList<SNS> selectSNS(Integer loginNo);
	void insertSNS(SNS sns);
	int selectLikely(Likely temp);
	void insertLikely(Likely likely);
	void deleteLikely(Likely likely);
	void updateCountLikely(HashMap<String, Integer> map);
	int selectCountLikely(int snsNo);
	ArrayList<SNS_Reply> selectReply(int snsNo);
	int insertReply(SNS_Reply reply);
	int applyFriend(Friend friend);
	int selectFriend(Friend friend);
	ArrayList<Friend> selectApplyList(Friend friend);
	int updateApply(Friend friend);
}
