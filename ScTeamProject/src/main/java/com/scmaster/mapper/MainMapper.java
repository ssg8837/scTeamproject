package com.scmaster.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.scmaster.vo.BS_Baby;
import com.scmaster.vo.BS_User;

public interface MainMapper {

	BS_User selectUser(HashMap<String, String> userMap);
	void insertUser(BS_User user);
	void deleteUser(int loginNo);
	
	public BS_User myAccount(int userNo);	//회원정보보기
	public int updateUser(BS_User user);	//회원정보수정
	
	ArrayList<BS_Baby> selectBabyList(int loginNo);
	void insertBaby(BS_Baby baby);
	void deleteBaby(int babyNo);
	
	BS_Baby selectBaby(int babyNo);
	public int babyAge(int babyNo);
	
	int countUser(String userId);
	int selectUserById(String userId);
	
	Object selectImg(int userNo);
	String selectNick(int userNo);
	String selectBabyName(int babyNo);
	
	public List<BS_User> selectUserAdmin(RowBounds rb, BS_User search); //회원 정보 가져오기
	public int getTotal_user(BS_User search); //회원 총원 가져오기
	public int deleteUserAdmin(int userNo); //관리자 유저 삭제
	
}
