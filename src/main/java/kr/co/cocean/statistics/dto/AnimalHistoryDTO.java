package kr.co.cocean.statistics.dto;

public class AnimalHistoryDTO {
	private int branchID;
	private String branchName;
	private int totalNumber;
	private int normalNumber;
	private int illedNumber;
	private int deadNumber;
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
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public int getNormalNumber() {
		return normalNumber;
	}
	public void setNormalNumber(int normalNumber) {
		this.normalNumber = normalNumber;
	}
	public int getIlledNumber() {
		return illedNumber;
	}
	public void setIlledNumber(int illedNumber) {
		this.illedNumber = illedNumber;
	}
	public int getDeadNumber() {
		return deadNumber;
	}
	public void setDeadNumber(int deadNumber) {
		this.deadNumber = deadNumber;
	}




}
