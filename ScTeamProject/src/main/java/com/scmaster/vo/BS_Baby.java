package com.scmaster.vo;

public class BS_Baby {
	private int babyNo;
	private int userNo;
	private String babyGender;
	private String babyBirth;
	private String babyName;
	private String babyBlood;
	public BS_Baby()
	{
	}
	
	public BS_Baby(int babyNo, int userNo, String babyGender, String babyBirth, String babyName, String babyBlood) {
		this.babyNo = babyNo;
		this.userNo = userNo;
		this.babyGender = babyGender;
		this.babyBirth = babyBirth;
		this.babyName = babyName;
		this.babyBlood = babyBlood;
	}
	public int getBabyNo() {
		return babyNo;
	}
	public void setBabyNo(int babyNo) {
		this.babyNo = babyNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getBabyGender() {
		return babyGender;
	}
	public void setBabyGender(String babyGender) {
		this.babyGender = babyGender;
	}
	public String getBabyBirth() {
		return babyBirth;
	}
	public void setBabyBirth(String babyBirth) {
		this.babyBirth = babyBirth;
	}
	public String getBabyName() {
		return babyName;
	}
	public void setBabyName(String babyName) {
		this.babyName = babyName;
	}
	public String getBabyBlood() {
		return babyBlood;
	}
	public void setBabyBlood(String babyBlood) {
		this.babyBlood = babyBlood;
	}
	
	
}
