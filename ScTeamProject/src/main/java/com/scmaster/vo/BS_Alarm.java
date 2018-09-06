package com.scmaster.vo;

public class BS_Alarm {
	private int alarmNo;
	private int babyNo;
	private int userNo;
	private String alarmTitle;
	private int alarmType;
	private int alarmAmount;
	private String alarmTime;
	private String endTime;

	public BS_Alarm()
	{
		
	}
	public BS_Alarm(int alarmNo, int babyNo, int userNo, String alarmTitle,int alarmType,int alarmAmount, String alarmTime) {
		this.alarmNo = alarmNo;
		this.babyNo = babyNo;
		this.userNo = userNo;
		this.alarmTitle = alarmTitle;
		this.alarmAmount = alarmAmount;
		this.alarmType = alarmType;
		this.alarmTime = alarmTime;
	}
	public BS_Alarm(int alarmNo, int babyNo, int userNo, String alarmTitle,int alarmType, String alarmTime,String endTime) {
		this.alarmNo = alarmNo;
		this.babyNo = babyNo;
		this.userNo = userNo;
		this.alarmTitle = alarmTitle;
		this.alarmType = alarmType;
		this.alarmTime = alarmTime;
		this.endTime = endTime;
	}
	
	public BS_Alarm(int alarmNo, int babyNo, int userNo, String alarmTitle,int alarmType,int alarmAmount, String alarmTime,String endTime) {
		this.alarmNo = alarmNo;
		this.babyNo = babyNo;
		this.userNo = userNo;
		this.alarmTitle = alarmTitle;
		this.alarmAmount = alarmAmount;
		this.alarmType = alarmType;
		this.alarmTime = alarmTime;
		this.endTime = endTime;
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

	public int getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(int alarmType) {
		this.alarmType = alarmType;
	}

	
	
	public int getAlarmAmount() {
		return alarmAmount;
	}

	public void setAlarmAmount(int alarmAmount) {
		this.alarmAmount = alarmAmount;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return "BS_Alarm [alarmNo=" + alarmNo + ", babyNo=" + babyNo + ", userNo=" + userNo + ", alarmTitle="
				+ alarmTitle + ", alarmType=" + alarmType + ", alarmAmount=" + alarmAmount + ", alarmTime=" + alarmTime
				+ ", endTime=" + endTime + "]";
	}

}
