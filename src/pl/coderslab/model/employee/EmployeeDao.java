package pl.coderslab.model.employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pl.coderslab.model.Dao;
import pl.coderslab.model.DataType;

public class EmployeeDao extends Dao {
	// Singleton
	private static EmployeeDao instance = null;

	private EmployeeDao() {

	}

	public static EmployeeDao getInstance() {
		if (instance == null) {
			instance = new EmployeeDao();
		}
		return instance;
	}

	// Abstract method implementations
	@Override
	protected String getTableName() {
		return "employee";
	}

	@Override
	protected PreparedStatement prepareStatementInsert(DataType object, Connection conn) throws SQLException {
		Employee employee = (Employee) object;
		PreparedStatement stmt = conn.prepareStatement("INSERT INTO employee VALUES (default, ?, ?, ?, ?, ?, ?)",
				Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, employee.getFirstName());
		stmt.setString(2, employee.getLastName());
		stmt.setString(3, employee.getAddress());
		stmt.setString(4, employee.getPhone());
		stmt.setString(5, employee.getNote());
		stmt.setBigDecimal(6, employee.getCostPerHour());

		return stmt;
	}

	@Override
	protected PreparedStatement prepareStatementUpdate(DataType object, Connection conn) throws SQLException {
		Employee employee = (Employee) object;
		PreparedStatement stmt = conn.prepareStatement(
				"UPDATE employee SET first_name=?, last_name=?, address=?, phone=?, note=?, cost_per_hour=? WHERE id=?");
		stmt.setString(1, employee.getFirstName());
		stmt.setString(2, employee.getLastName());
		stmt.setString(3, employee.getAddress());
		stmt.setString(4, employee.getPhone());
		stmt.setString(5, employee.getNote());
		stmt.setBigDecimal(6, employee.getCostPerHour());
		stmt.setInt(7, employee.getId());

		return stmt;
	}

	@Override
	protected DataType constructFromRs(ResultSet rs) throws SQLException {
		Employee employee = new Employee(rs.getString("first_name"), rs.getString("last_name"), rs.getString("address"),
				rs.getString("phone"), rs.getString("note"), rs.getBigDecimal("cost_per_hour"));
		employee.setId(rs.getInt("id"));

		return employee;
	}

}
