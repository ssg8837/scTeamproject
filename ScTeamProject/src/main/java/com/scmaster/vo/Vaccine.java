package com.scmaster.vo;

public class Vaccine {
	private int babyNo;
	private int diseaseNum;
	private String diseaseName;
	private String vaccineType;
	private String vaccineCheck;
	private String vaccineDate;
	private String checkDate;
	
	public Vaccine() {
		super();
	}

	public Vaccine(int babyNo, int diseaseNum, String diseaseName, String vaccineType, String vaccineCheck,
			String vaccineDate, String checkDate) {
		super();
		this.babyNo = babyNo;
		this.diseaseNum = diseaseNum;
		this.diseaseName = diseaseName;
		this.vaccineType = vaccineType;
		this.vaccineCheck = vaccineCheck;
		this.vaccineDate = vaccineDate;
		this.checkDate = checkDate;
	}

	public int getBabyNo() {
		return babyNo;
	}

	public void setBabyNo(int babyNo) {
		this.babyNo = babyNo;
	}

	public int getDiseaseNum() {
		return diseaseNum;
	}

	public void setDiseaseNum(int diseaseNum) {
		this.diseaseNum = diseaseNum;
	}

	public String getDiseaseName() {
		return diseaseName;
	}

	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}

	public String getVaccineType() {
		return vaccineType;
	}

	public void setVaccineType(String vaccineType) {
		this.vaccineType = vaccineType;
	}

	public String getVaccineCheck() {
		return vaccineCheck;
	}

	public void setVaccineCheck(String vaccineCheck) {
		this.vaccineCheck = vaccineCheck;
	}

	public String getVaccineDate() {
		return vaccineDate;
	}

	public void setVaccineDate(String vaccineDate) {
		this.vaccineDate = vaccineDate;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "Vaccine [babyNo=" + babyNo + ", diseaseNum=" + diseaseNum + ", diseaseName=" + diseaseName
				+ ", vaccineType=" + vaccineType + ", vaccineCheck=" + vaccineCheck + ", vaccineDate=" + vaccineDate
				+ ", checkDate=" + checkDate + "]";
	}
	
	
}
