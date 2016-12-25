package com.you.payment;

import java.sql.Date;

public class PaymentDTO {
	private int pnum;
	private String pid;
	private int pprice;
	private Date pdate;
	private String pcategory;
	private int pcategorynum;
	private String pcardtype;
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public int getPcategorynum() {
		return pcategorynum;
	}
	public void setPcategorynum(int pcategorynum) {
		this.pcategorynum = pcategorynum;
	}
	public String getPcardtype() {
		return pcardtype;
	}
	public void setPcardtype(String pcardtype) {
		this.pcardtype = pcardtype;
	}
}
