package com.scmaster.vo;

public class Hospital {
	private String hpid;
	private String address;
	private String name;
	private String divNam;
	private String phone;
	private int eryn;
	private String eryynphone;
	private String time;
	private String Latitude;
	private String longitude;
	
	public Hospital() {
		// TODO Auto-generated constructor stub
	}

	public Hospital(String hpid, String address, String name, String divNam, String phone, int eryn, String eryynphone,
			String time, String latitude, String longitude) {
		super();
		this.hpid = hpid;
		this.address = address;
		this.name = name;
		this.divNam = divNam;
		this.phone = phone;
		this.eryn = eryn;
		this.eryynphone = eryynphone;
		this.time = time;
		Latitude = latitude;
		this.longitude = longitude;
	}

	public String getHpid() {
		return hpid;
	}

	public void setHpid(String hpid) {
		this.hpid = hpid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDivNam() {
		return divNam;
	}

	public void setDivNam(String divNam) {
		this.divNam = divNam;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getEryn() {
		return eryn;
	}

	public void setEryn(int eryn) {
		this.eryn = eryn;
	}

	public String getEryynphone() {
		return eryynphone;
	}

	public void setEryynphone(String eryynphone) {
		this.eryynphone = eryynphone;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getLatitude() {
		return Latitude;
	}

	public void setLatitude(String latitude) {
		Latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "Hospital [hpid=" + hpid + ", address=" + address + ", name=" + name + ", divNam=" + divNam + ", phone="
				+ phone + ", eryn=" + eryn + ", eryynphone=" + eryynphone + ", time=" + time + ", Latitude=" + Latitude
				+ ", longitude=" + longitude + "]";
	}
	
}
