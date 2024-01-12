package kr.co.cocean.store.dto;

import org.apache.ibatis.type.Alias;

@Alias("branchProduct")
public class StoreProductDTO {
	private int branchID;
	private String branchName;
	private String branchLocation;
	private double branchLatitude;
	private double branchLongitude;
	private int productID;
	private String status;
	private String productName;
	private String category;
	private int price;
	private int productIndex;
	private int idx;
	private String serverFileName;
	private int totalProductNumber;

	public int getTotalProductNumber() {
		return totalProductNumber;
	}
	public void setTotalProductNumber(int totalProductNumber) {
		this.totalProductNumber = totalProductNumber;
	}
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
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getServerFileName() {
		return serverFileName;
	}
	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}



}