package pl.coderslab.model.order;

import java.math.BigDecimal;
import java.time.Instant;

import pl.coderslab.model.DataType;
import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.vehicle.Vehicle;

public class Order implements DataType {
	public enum Status {
		TAKEN_IN, COSTS_APPROVED, IN_REPAIR, DONE, CANCELLED
	}
	
	private int id = 0;
	private Instant takeInDate;
	private Instant plannedRepairBeginDate;
	private Instant repairBeginDate;
	private Instant repairEndDate;
	private Employee employee;
	private String problemDescription;
	private String repairDescription = "";
	private Status status = Status.TAKEN_IN;
	private Vehicle vehicle;
	private BigDecimal costForClient = null;
	private BigDecimal costOfParts = null;
	private BigDecimal costPerHour;
	private int workHours = 0;

	public Order(Instant takeInDate, Instant plannedRepairBeginDate, Employee employee, String problemDescription,
			Vehicle vehicle) {
		this.takeInDate = takeInDate;
		this.plannedRepairBeginDate = plannedRepairBeginDate;
		this.repairBeginDate = plannedRepairBeginDate; // Placeholders until proper
		this.repairEndDate = plannedRepairBeginDate;   // values can be assigned
		this.employee = employee;
		this.problemDescription = problemDescription;
		this.vehicle = vehicle;
		this.costPerHour = this.employee.getCostPerHour();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Instant getTakeInDate() {
		return takeInDate;
	}
	public void setTakeInDate(Instant takeInDate) {
		this.takeInDate = takeInDate;
	}
	public Instant getPlannedRepairBeginDate() {
		return plannedRepairBeginDate;
	}
	public void setPlannedRepairBeginDate(Instant plannedRepairBeginDate) {
		this.plannedRepairBeginDate = plannedRepairBeginDate;
	}
	public Instant getRepairBeginDate() {
		return repairBeginDate;
	}
	public void setRepairBeginDate(Instant repairBeginDate) {
		this.repairBeginDate = repairBeginDate;
	}
	public Instant getRepairEndDate() {
		return repairEndDate;
	}
	public void setRepairEndDate(Instant repairEndDate) {
		this.repairEndDate = repairEndDate;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getProblemDescription() {
		return problemDescription;
	}
	public void setProblemDescription(String problemDescription) {
		this.problemDescription = problemDescription;
	}
	public String getRepairDescription() {
		return repairDescription;
	}
	public void setRepairDescription(String repairDescription) {
		this.repairDescription = repairDescription;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Vehicle getVehicle() {
		return vehicle;
	}
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}
	public BigDecimal getCostForClient() {
		return costForClient;
	}
	public void setCostForClient(BigDecimal costForClient) {
		this.costForClient = costForClient;
	}
	public BigDecimal getCostOfParts() {
		return costOfParts;
	}
	public void setCostOfParts(BigDecimal costOfParts) {
		this.costOfParts = costOfParts;
	}
	public BigDecimal getCostPerHour() {
		return costPerHour;
	}
	public void setCostPerHour(BigDecimal costPerHour) {
		this.costPerHour = costPerHour;
	}
	public int getWorkHours() {
		return workHours;
	}
	public void setWorkHours(int workHours) {
		this.workHours = workHours;
	}
	
}
