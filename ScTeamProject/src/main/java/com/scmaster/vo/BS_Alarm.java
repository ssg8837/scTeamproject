package com.scmaster.vo;

public class BS_Alarm {
	private int alarmNo;
	private int babyNo;
	private String alarmTitle;
	private String alarmTime;
	
	public BS_Alarm() {
	}
	public BS_Alarm(int alarmNo, int babyNo, String alarmTitle, String alarmTime) {
		this.alarmNo = alarmNo;
		this.babyNo = babyNo;
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

	
	
}
