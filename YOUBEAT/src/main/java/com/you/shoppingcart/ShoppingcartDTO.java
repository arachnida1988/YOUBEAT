package com.you.shoppingcart;

import java.sql.Date;

public class ShoppingcartDTO {
	private int snum;
	private String sid;
	private Date sdate;
	private String scategory;
	private int scategorynum;
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public String getScategory() {
		return scategory;
	}
	public void setScategory(String scategory) {
		this.scategory = scategory;
	}
	public int getScategorynum() {
		return scategorynum;
	}
	public void setScategorynum(int scategorynum) {
		this.scategorynum = scategorynum;
	}
}
