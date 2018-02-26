package pl.coderslab.model.vehicle;

import java.time.LocalDate;

import pl.coderslab.model.DataType;

public class Vehicle implements DataType {
	private int id = 0;
	private String model = "";
	private int yearOfProduction = 0;
	private String licenceNumber = "";
	private LocalDate nextInspectionDate = LocalDate.now();
	// TODO: Client
	// private Client owner = new Client;
	
	public Vehicle(String model, int yearOfProduction, String licenceNumber, LocalDate nextInspectionDate/*, Client owner*/) {
		this.model = model;
		this.yearOfProduction = yearOfProduction;
		this.licenceNumber = licenceNumber;
		this.nextInspectionDate = nextInspectionDate;
		// this.owner = owner;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getYearOfProduction() {
		return yearOfProduction;
	}
	public void setYearOfProduction(int yearOfProduction) {
		this.yearOfProduction = yearOfProduction;
	}
	public String getLicenceNumber() {
		return licenceNumber;
	}
	public void setLicenceNumber(String licenceNumber) {
		this.licenceNumber = licenceNumber;
	}
	public LocalDate getNextInspectionDate() {
		return nextInspectionDate;
	}
	public void setNextInspectionDate(LocalDate nextInspectionDate) {
		this.nextInspectionDate = nextInspectionDate;
	}
//	public Client getOwner() {
//		return owner;
//	}
//	public void setOwner(Client owner) {
//		this.owner = owner;
//	}
}
