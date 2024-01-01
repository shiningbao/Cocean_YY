package kr.co.cocean.statistics.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("product")
public class ProductHistoryDTO {
 private int branchID;
 private int productHistoryID;
 private int productIndex;
 private Date salesRegDate;
 private int salesNumber;
public int getBranchID() {
	return branchID;
}
public void setBranchID(int branchID) {
	this.branchID = branchID;
}
public int getProductHistoryID() {
	return productHistoryID;
}
public void setProductHistoryID(int productHistoryID) {
	this.productHistoryID = productHistoryID;
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
