package kr.co.cocean.statistics.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("sales")
public class SalesHistoryDTO {
	private int branchID;
	private String branchName;
	private int productID;
	private String productName;
	private String category;
	private int price;
	private int productIndex;
	private String status;
	private int totalSales;
	private int salesYear;
	private int salesMonth;
	private int monthlySalesNumber;
	private int monthlyTotalSales;
	private String yearMonth;
	private int monthlyVisitorsNumber;
	
	
	
	public int getMonthlyVisitorsNumber() {
		return monthlyVisitorsNumber;
	}
	public void setMonthlyVisitorsNumber(int monthlyVisitorsNumber) {
		this.monthlyVisitorsNumber = monthlyVisitorsNumber;
	}
	private Date salesRegDate;
	private int salesNumber;
	
	
	private Date entryDate;
	private int visitorsNumber;
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
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getProductIndex() {
		return productIndex;
	}
	public void setProductIndex(int productIndex) {
		this.productIndex = productIndex;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	public int getSalesYear() {
		return salesYear;
	}
	public void setSalesYear(int salesYear) {
		this.salesYear = salesYear;
	}
	public int getSalesMonth() {
		return salesMonth;
	}
	public void setSalesMonth(int salesMonth) {
		this.salesMonth = salesMonth;
	}
	public int getMonthlySalesNumber() {
		return monthlySalesNumber;
	}
	public void setMonthlySalesNumber(int monthlySalesNumber) {
		this.monthlySalesNumber = monthlySalesNumber;
	}
	public int getMonthlyTotalSales() {
		return monthlyTotalSales;
	}
	public void setMonthlyTotalSales(int monthlyTotalSales) {
		this.monthlyTotalSales = monthlyTotalSales;
	}
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
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
