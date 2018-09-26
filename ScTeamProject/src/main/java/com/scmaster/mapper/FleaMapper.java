package com.scmaster.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.vo.Flea;

public interface FleaMapper {
	/*전체목록*/
	public List<Flea> getBoardList();
	public List<Flea> getBoardList(Map<String,String> search, RowBounds rb);
	public int countTotal(Map<String,String> search);
	/*게사글 읽기*/
	public Flea selectOne(int fleaNum);
	public int updateHits(int fleanum);
	/*글쓰기*/	
	public int boardWrite(Flea flea);
	/*게시글 업데이트*/
	public int updateBoard(Flea flea);
	/*게시글 삭제*/
	public int deleteBoard(int fleanum,int loginNo);
}
