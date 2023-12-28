package kr.co.cocean.aquarium.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("animal")
public class AnimalDTO {
	
	private int animalID;
	private int speciesID;
	private int tankID;
	private String tankName;
	private int branchID;
	private String branchName;
	private String classificationCode;	
	private int CodeNumber;
	private String nickname;
	private int individual;
	private Date birthDate;
	private Date entryDate;	
	private String status;
	private String details;
	private String commonName;
	private String scientificName;
	private String taxonomy;
	private String animalCode;
	private String serverFileName;
	
	public String getServerFileName() {
		return serverFileName;
	}
	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}
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
	public String getTankName() {
		return tankName;
	}
	public void setTankName(String tankName) {
		this.tankName = tankName;
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
	public String getScientificName() {
		return scientificName;
	}
	public void setScientificName(String scientificName) {
		this.scientificName = scientificName;
	}
	public String getTaxonomy() {
		return taxonomy;
	}
	public void setTaxonomy(String taxonomy) {
		this.taxonomy = taxonomy;
	}
	public String getAnimalCode() {
		return animalCode;
	}
	public void setAnimalCode(String animalCode) {
		this.animalCode = animalCode;
	}
	
}
