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
	SNS selectSNSbySnsNo(int snsNo);
	void insertSNS(SNS sns);
	int selectLikely(Likely temp);
	void insertLikely(Likely likely);
	void deleteLikely(Likely likely);
	void updateCountLikely(HashMap<String, Integer> map);
	int selectCountLikely(int snsNo);
	ArrayList<SNS_Reply> selectReply(int snsNo);
	int insertReply(SNS_Reply reply);
	int applyFriend(Friend friend);
	int checkFriend(Friend friend);
	ArrayList<Friend> selectApplyList(int userNo);
	int updateApply(Friend friend);
	ArrayList<Friend> selectDenyList(int loginNo);
	int deleteFriend(Friend friend);
	void deleteSns(int selectNo);
	void deleteReplyBySnsNo(int selectNo);
	void updateSNS(SNS sns);
	SNS_Reply selectReplyByRplyNo(int rplyNo);
	void deleteReplyByRplyNo(int rplyNo);
	void updateReply(SNS_Reply reply);
}
