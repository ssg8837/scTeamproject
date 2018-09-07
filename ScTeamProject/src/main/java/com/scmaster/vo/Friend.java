package com.scmaster.vo;

public class Friend {
	private int userNo;
	private int friendNo;
	
	public Friend(int userNo, int friendNo) {
		this.userNo = userNo;
		this.friendNo = friendNo;
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
	@Override
	public String toString() {
		return "Friend [userNo=" + userNo + ", friendNo=" + friendNo + "]";
	}
	
}
