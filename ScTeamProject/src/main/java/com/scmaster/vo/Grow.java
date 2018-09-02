package com.scmaster.vo;

public class Grow {

	private int babyno;			//아이 번호
	private int userno;			//부모번호
	
	private String babyname;	//아이 이름
	private String babygender;	//아이 성별
	private String babybirth;	//아이 생일
	
	private double growheight;		//아이 신장
	private double growweight;		//아이 체중
	private double growhead;		//아이 머리둘레
	
	private int babyage;		//아이 나이(개월)
	private double growbmi;		//아이 bmi(2세 이후부터 추가)
	private String growregdate;	//성장기록 기입 날짜
	
	public Grow() {
		super();
	}

	public int getBabyno() {
		return babyno;
	}

	public void setBabyno(int babyno) {
		this.babyno = babyno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getBabyname() {
		return babyname;
	}

	public void setBabyname(String babyname) {
		this.babyname = babyname;
	}

	public String getBabygender() {
		return babygender;
	}

	public void setBabygender(String babygender) {
		this.babygender = babygender;
	}

	public String getBabybirth() {
		return babybirth;
	}

	public void setBabybirth(String babybirth) {
		this.babybirth = babybirth;
	}

	public double getGrowheight() {
		return growheight;
	}

	public void setGrowheight(double growheight) {
		this.growheight = growheight;
	}

	public double getGrowweight() {
		return growweight;
	}

	public void setGrowweight(double growweight) {
		this.growweight = growweight;
	}

	public double getGrowhead() {
		return growhead;
	}

	public void setGrowhead(double growhead) {
		this.growhead = growhead;
	}

	public int getBabyage() {
		return babyage;
	}

	public void setBabyage(int babyage) {
		this.babyage = babyage;
	}

	public double getGrowbmi() {
		return growbmi;
	}

	public void setGrowbmi(double growbmi) {
		this.growbmi = growbmi;
	}

	public String getGrowregdate() {
		return growregdate;
	}

	public void setGrowregdate(String growregdate) {
		this.growregdate = growregdate;
	}

	@Override
	public String toString() {
		return "내 아이 성장기록 [babyno=" + babyno + ", userno=" + userno + ", babyname=" + babyname + ", babygender=" + babygender
				+ ", babybirth=" + babybirth + ", growheight=" + growheight + ", growweight=" + growweight
				+ ", growhead=" + growhead + ", babyage=" + babyage + ", growbmi=" + growbmi + ", growregdate="
				+ growregdate + "]";
	}
	
}
