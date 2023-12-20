package kr.co.cocean.aquarium.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("animal")
public class AnimalDTO {
	
	private int animalID;
	private int speciesID;
	private int tankID;
	private int branchID;
	private String classificationCode;	
	private int CodeNumber;
	private String nickname;
	private int individual;
	private Date birthDate;
	private Date entryDate;	
	private String status;
	private String details;
	private String commonName;
	

	public int getAnimalID() {
		return animalID;
	}
	public void setAnimalID(int animalID) {
		this.animalID = animalID;
	}
	public int getSpeciesID() {
		return speciesID;
	}
	public void setSpeciesID(int speciesID) {
		this.speciesID = speciesID;
	}
	public int getTankID() {
		return tankID;
	}
	public void setTankID(int tankID) {
		this.tankID = tankID;
	}
	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public String getClassificationCode() {
		return classificationCode;
	}
	public void setClassificationCode(String classificationCode) {
		this.classificationCode = classificationCode;
	}
	public int getCodeNumber() {
		return CodeNumber;
	}
	public void setCodeNumber(int codeNumber) {
		CodeNumber = codeNumber;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getIndividual() {
		return individual;
	}
	public void setIndividual(int individual) {
		this.individual = individual;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getCommonName() {
		return commonName;
	}
	public void setCommonName(String commonName) {
		this.commonName = commonName;
	}
}
