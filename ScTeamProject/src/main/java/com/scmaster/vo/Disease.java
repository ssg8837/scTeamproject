package com.scmaster.vo;

public class Disease {
	private int diseasenum;
	private String diseasename;
	private String vaccintype;
	private String diseasecontent;
	private int vaccindate;
	
	public Disease() {
		super();
	}

	public Disease(int diseasenum, String diseasename, String vaccintype, String diseasecontent, int vaccindate) {
		super();
		this.diseasenum = diseasenum;
		this.diseasename = diseasename;
		this.vaccintype = vaccintype;
		this.diseasecontent = diseasecontent;
		this.vaccindate = vaccindate;
	}

	public int getDiseasenum() {
		return diseasenum;
	}

	public void setDiseasenum(int diseasenum) {
		this.diseasenum = diseasenum;
	}

	public String getDiseasename() {
		return diseasename;
	}

	public void setDiseasename(String diseasename) {
		this.diseasename = diseasename;
	}

	public String getVaccintype() {
		return vaccintype;
	}

	public void setVaccintype(String vaccintype) {
		this.vaccintype = vaccintype;
	}

	public String getDiseasecontent() {
		return diseasecontent;
	}

	public void setDiseasecontent(String diseasecontent) {
		this.diseasecontent = diseasecontent;
	}

	public int getVaccindate() {
		return vaccindate;
	}

	public void setVaccindate(int vaccindate) {
		this.vaccindate = vaccindate;
	}

	@Override
	public String toString() {
		return "Disease [diseasenum=" + diseasenum + ", diseasename=" + diseasename + ", vaccintype=" + vaccintype
				+ ", diseasecontent=" + diseasecontent + ", vaccindate=" + vaccindate + "]";
	}
	
	
}
