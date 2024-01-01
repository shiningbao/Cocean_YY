package kr.co.cocean.statistics.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("ticket")
public class TicketHistoryDTO {
	 private int branchID;
	 private int ticketHistoryID;
	 private int productIndex;
	 private Date salesRegDate;
	 private int salesNumber;
	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public int getTicketHistoryID() {
		return ticketHistoryID;
	}
	public void setTicketHistoryID(int ticketHistoryID) {
		this.ticketHistoryID = ticketHistoryID;
	}
	public int getProductIndex() {
		return productIndex;
	}
	public void setProductIndex(int productIndex) {
		this.productIndex = productIndex;
	}
	public Date getSalesRegDate() {
		return salesRegDate;
	}
	public void setSalesRegDate(Date salesRegDate) {
		this.salesRegDate = salesRegDate;
	}
	public int getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(int salesNumber) {
		this.salesNumber = salesNumber;
	}
	 
}
