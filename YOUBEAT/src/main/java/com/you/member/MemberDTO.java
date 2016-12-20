package com.you.member;

public class MemberDTO {
	private String memid;
	private String mempw;
	private String memname;
	private String mememail;
	private int memmailcheck;
	private String memrating;
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public int getMemmailcheck() {
		return memmailcheck;
	}
	public void setMemmailcheck(int memmailcheck) {
		this.memmailcheck = memmailcheck;
	}
	public String getMemrating() {
		return memrating;
	}
	public void setMemrating(String memrating) {
		this.memrating = memrating;
	}
}
