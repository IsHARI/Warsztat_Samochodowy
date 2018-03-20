package pl.coderslab.model.employee;

import java.math.BigDecimal;

import pl.coderslab.model.DataType;

public class Employee implements DataType {
	private int id = 0;
	private String firstName;
	private String lastName;
	private String address;
	private String phone;
	private String note;
	private BigDecimal costPerHour;
	
	public Employee(String firstName, String lastName, String address, String phone, String note,
			BigDecimal costPerHour) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phone = phone;
		this.note = note;
		this.costPerHour = costPerHour;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public BigDecimal getCostPerHour() {
		return costPerHour;
	}
	public void setCostPerHour(BigDecimal costPerHour) {
		this.costPerHour = costPerHour;
	}

}
