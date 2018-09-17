package com.scmaster.vo;

import java.math.BigDecimal;

public class Friend {
	private int userNo;
	private int friendNo;
	private String apply;//Y:신청중, N:이미 친구, D:거절당함.
	
	public Friend(int userNo, int friendNo, String apply) {
		this.userNo = userNo;
		this.friendNo = friendNo;
		this.apply =apply;
	}
	
	public Friend(BigDecimal userNo, BigDecimal friendNo, String apply) {
		this.userNo = userNo.intValue();
		this.friendNo = friendNo.intValue();
		this.apply =apply;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getFriendNo() {
		return friendNo;
	}
	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}
	
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	@Override
	public String toString() {
		return "Friend [userNo=" + userNo + ", friendNo=" + friendNo + ", apply=" + apply + "]";
	}
	
	
}
