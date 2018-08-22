package com.scmaster.vo;

public class VaccineHospital {
	private String orgnm;
	private String orgTlno;
	private String orgAddr;
	private String expnYmd;
	
	public VaccineHospital() {
		super();
	}

	public VaccineHospital(String orgnm, String orgTlno, String orgAddr, String expnYmd) {
		super();
		this.orgnm = orgnm;
		this.orgTlno = orgTlno;
		this.orgAddr = orgAddr;
		this.expnYmd = expnYmd;
	}

	public String getOrgnm() {
		return orgnm;
	}

	public void setOrgnm(String orgnm) {
		this.orgnm = orgnm;
	}

	public String getOrgTlno() {
		return orgTlno;
	}

	public void setOrgTlno(String orgTlno) {
		this.orgTlno = orgTlno;
	}

	public String getOrgAddr() {
		return orgAddr;
	}

	public void setOrgAddr(String orgAddr) {
		this.orgAddr = orgAddr;
	}

	public String getExpnYmd() {
		return expnYmd;
	}

	public void setExpnYmd(String expnYmd) {
		this.expnYmd = expnYmd;
	}

	@Override
	public String toString() {
		return "VaccineHospital [orgnm=" + orgnm + ", orgTlno=" + orgTlno + ", orgAddr=" + orgAddr + ", expnYmd="
				+ expnYmd + "]";
	}
	
}
