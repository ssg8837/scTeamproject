package com.scmaster.vo;

public class BS_Alarm {
	private int alarmNo;
	private int babyNo;
	private int userNo;
	private String alarmTitle;		//메모
	private int alarmType;			//카테고리 분류
	private int alarmDetail;		//카테고리 세부 분류
	private int alarmAmount;		//양 (모유 젖병 이유식 유축)
	private String alarmTime;		//기록시작시간
	private String endTime;			//기록종료시간

	public BS_Alarm()
	{
		
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

	public int getAlarmDetail() {
		return alarmDetail;
	}
	public void setAlarmDetail(int alarmDetail) {
		this.alarmDetail = alarmDetail;
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
				+ alarmTitle + ", alarmType=" + alarmType + ", alarmDetail=" + alarmDetail + ", alarmAmount="
				+ alarmAmount + ", alarmTime=" + alarmTime + ", endTime=" + endTime + "]";
	}


}
