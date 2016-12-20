package com.you.board;

import java.sql.Date;

public class BoardDTO {
	
	private int bnum;
	private String bwriter;
	private String btitle;
	private String bcontents;
	private Date breg_date;
	private int bcounts;
	private int bref;
	private int bstep;
	private int bdepth;
	private String btype;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public Date getBreg_date() {
		return breg_date;
	}
	public void setBreg_date(Date breg_date) {
		this.breg_date = breg_date;
	}
	public int getBcounts() {
		return bcounts;
	}
	public void setBcounts(int bcounts) {
		this.bcounts = bcounts;
	}
	public int getBref() {
		return bref;
	}
	public void setBref(int bref) {
		this.bref = bref;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBdepth() {
		return bdepth;
	}
	public void setBdepth(int bdepth) {
		this.bdepth = bdepth;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}

}
