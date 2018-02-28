package pl.coderslab.model.vehicle;

import java.time.Instant;

import pl.coderslab.model.DataType;
import pl.coderslab.model.client.Client;

public class Vehicle implements DataType {
	private int id = 0;
	private String model = "";
	private int yearOfProduction = 0;
	private String licenceNumber = "";
	private Instant nextInspectionDate = Instant.now();
	private Client owner = null;
	
	public Vehicle(String model, int yearOfProduction, String licenceNumber, Instant nextInspectionDate, Client owner) {
		this.model = model;
		this.yearOfProduction = yearOfProduction;
		this.licenceNumber = licenceNumber;
		this.nextInspectionDate = nextInspectionDate;
		this.owner = owner;
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
	public Instant getNextInspectionDate() {
		return nextInspectionDate;
	}
	public void setNextInspectionDate(Instant nextInspectionDate) {
		this.nextInspectionDate = nextInspectionDate;
	}
	public Client getOwner() {
		return owner;
	}
	public void setOwner(Client owner) {
		this.owner = owner;
	}
}
