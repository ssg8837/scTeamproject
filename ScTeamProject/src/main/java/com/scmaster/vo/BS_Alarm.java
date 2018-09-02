package com.scmaster.vo;

public class BS_Alarm {
	private int alarmNo;
	private int babyNo;
	private int userNo;
	private String alarmTitle;
	private String alarmTime;
	
	public BS_Alarm() {
	}

	public BS_Alarm(int alarmNo, int babyNo, int userNo, String alarmTitle, String alarmTime) {
		super();
		this.alarmNo = alarmNo;
		this.babyNo = babyNo;
		this.userNo = userNo;
		this.alarmTitle = alarmTitle;
		this.alarmTime = alarmTime;
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
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

	public String getAlarmTitle() {
		return alarmTitle;
	}

	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}

	public String getAlarmTime() {
		return alarmTime;
	}

	public void setAlarmTime(String alarmTime) {
		this.alarmTime = alarmTime;
	}

	@Override
	public String toString() {
		return "BS_Alarm [alarmNo=" + alarmNo + ", babyNo=" + babyNo + ", userNo=" + userNo + ", alarmTitle="
				+ alarmTitle + ", alarmTime=" + alarmTime + "]";
	}
	

	
	
}
