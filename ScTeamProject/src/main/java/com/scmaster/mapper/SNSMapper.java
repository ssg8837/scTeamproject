package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.vo.AdminSNS;
import com.scmaster.vo.Friend;
import com.scmaster.vo.Likely;
import com.scmaster.vo.SNS;
import com.scmaster.vo.SNS_Reply;
import com.scmaster.vo.Singo;

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
	int checkSingo(Singo singo);
	void insertSingo(Singo singo);
	public List<AdminSNS> getTotal_SNSAdminSingo(RowBounds rb); // 신고된 SNS 신고 횟수 + SNSNO + 신고된 USERNO + SNS작성일 가져오기
	public int getTotal_SNSAdmin(); //신고된 SNS 총 갯수 가져오기
	public List<Singo> selectSingoUserNo(int SNSNo); //신고한 SNS의 USERNO 가져오기
}
