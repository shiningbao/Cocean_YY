package kr.co.cocean.statistics.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("visitors")
public class VisitorsHistoryDTO {
	 private int branchID;
	 private int visitorsHistoryID;
	 private int productIndex;
	 private Date entryDate;
	 private int visitorsNumber;
	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public int getVisitorsHistoryID() {
		return visitorsHistoryID;
	}
	public void setVisitorsHistoryID(int visitorsHistoryID) {
		this.visitorsHistoryID = visitorsHistoryID;
	}
	public int getProductIndex() {
		return productIndex;
	}
	public void setProductIndex(int productIndex) {
		this.productIndex = productIndex;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public int getVisitorsNumber() {
		return visitorsNumber;
	}
	public void setVisitorsNumber(int visitorsNumber) {
		this.visitorsNumber = visitorsNumber;
	}
	 
}
