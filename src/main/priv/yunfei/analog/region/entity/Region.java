package main.priv.yunfei.analog.region.entity;

//数据实体类
public class Region {
	private String date;
	private String region;
	private int regionCount;
	private int sessionNumber;
	private int sessionJumpnumber;
	private double jumpRate;
	
	
	public double getJumpRate() {
		return jumpRate;
	}
	public void setJumpRate(double jumpRate) {
		this.jumpRate = jumpRate;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getRegionCount() {
		return regionCount;
	}
	public void setRegionCount(int regionCount) {
		this.regionCount = regionCount;
	}
	public int getSessionNumber() {
		return sessionNumber;
	}
	public void setSessionNumber(int sessionNumber) {
		this.sessionNumber = sessionNumber;
	}
	public int getSessionJumpnumber() {
		return sessionJumpnumber;
	}
	public void setSessionJumpnumber(int sessionJumpnumber) {
		this.sessionJumpnumber = sessionJumpnumber;
	}
	
}
