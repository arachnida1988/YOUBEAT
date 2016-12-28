package com.you.util;

import java.sql.Date;

public class Searching extends PageMaker{
	private int albumASC;
	private Date startDate;
	private Date lastDate;
	private String arraytype;
	public String getArraytype() {
		return arraytype;
	}
	public void setArraytype(String arraytype) {
		this.arraytype = arraytype;
	}
	public int getAlbumASC() {
		
		return albumASC;
	}
	public void setAlbumASC(int albumASC) {
		this.albumASC = albumASC;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	
}
