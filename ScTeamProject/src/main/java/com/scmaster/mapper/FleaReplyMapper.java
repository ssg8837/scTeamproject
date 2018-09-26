package com.scmaster.mapper;

import java.util.List;
import java.util.Map;

import com.scmaster.vo.FleaReply;

public interface FleaReplyMapper {
	/*전체목록*/
	public List<FleaReply> getReplyList(int fleaNum);
	/*리플쓰 기*/	
	public int writeReply(FleaReply fleaReply);
	/*리플 업데이트*/
	public int updateReply(Map<String,Object> update);
	/*리플 삭제*/
	public int deleteReply(Map<String,Integer> delete);
}
