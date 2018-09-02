package com.scmaster.vo;

public class Grow_Default {

	private String gender;		//성별
	private int age;			//나이(개월)
	private double height;			//연령별 표준 신장
	private double weight_a;		//연령별 표준 체중
	private double head;			//연령별 표준 머리둘레
	private double bmi;			//연령별 표준 bmi(2세 이후)
	
	public Grow_Default() {
		super();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight_a() {
		return weight_a;
	}

	public void setWeight_a(double weight_a) {
		this.weight_a = weight_a;
	}

	public double getHead() {
		return head;
	}

	public void setHead(double head) {
		this.head = head;
	}

	public double getBmi() {
		return bmi;
	}

	public void setBmi(double bmi) {
		this.bmi = bmi;
	}

	@Override
	public String toString() {
		return "표준성장도표 [gender=" + gender + ", age=" + age + ", height=" + height + ", weight_a=" + weight_a
				+ ", head=" + head + ", bmi=" + bmi + "]";
	}

}
