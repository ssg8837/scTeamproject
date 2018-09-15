package com.scmaster.vo;

public class Friend {
	private int userNo;
	private int friendNo;
	private String apply;
	
	public Friend(int userNo, int friendNo, String apply) {
		this.userNo = userNo;
		this.friendNo = friendNo;
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
