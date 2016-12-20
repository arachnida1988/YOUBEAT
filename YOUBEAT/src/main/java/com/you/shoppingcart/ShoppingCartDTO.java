package com.you.shoppingcart;

import java.sql.Date;

public class ShoppingCartDTO {
	private int snum;
	private String sid;
	private Date sdate;
	private String category;
	private int categorynum;
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategorynum() {
		return categorynum;
	}
	public void setCategorynum(int categorynum) {
		this.categorynum = categorynum;
	}
}
