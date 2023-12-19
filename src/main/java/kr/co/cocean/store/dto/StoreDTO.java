package kr.co.cocean.store.dto;

import org.apache.ibatis.type.Alias;

@Alias("store")
public class StoreDTO {
	private int branchID;
	private String branchName;
	private String branchLocation;
	private double branchLatitude;
	private double branchLongitude;
	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getBranchLocation() {
		return branchLocation;
	}
	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
	}
	public double getBranchLatitude() {
		return branchLatitude;
	}
	public void setBranchLatitude(double branchLatitude) {
		this.branchLatitude = branchLatitude;
	}
	public double getBranchLongitude() {
		return branchLongitude;
	}
	public void setBranchLongitude(double branchLongitude) {
		this.branchLongitude = branchLongitude;
	}
	
}
