package kr.co.cocean.aquarium.dto;

import java.util.ArrayList;

public class AnimalListFilterDTO {
	private int inchargeEmployeeID;
	private ArrayList<String> statusValues;
	private ArrayList<String> classifiValues;
	
	
	public int getInchargeEmployeeID() {
		return inchargeEmployeeID;
	}
	public void setInchargeEmployeeID(int inchargeEmployeeID) {
		this.inchargeEmployeeID = inchargeEmployeeID;
	}
	public ArrayList<String> getStatusValues() {
		return statusValues;
	}
	public void setStatusValues(ArrayList<String> statusValues) {
		this.statusValues = statusValues;
	}
	public ArrayList<String> getClassifiValues() {
		return classifiValues;
	}
	public void setClassifiValues(ArrayList<String> classifiValues) {
		this.classifiValues = classifiValues;
	}
}
