package pl.coderslab.model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;

import pl.coderslab.model.Dao;
import pl.coderslab.model.DataType;
import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.employee.EmployeeDao;
import pl.coderslab.model.vehicle.Vehicle;
import pl.coderslab.model.vehicle.VehicleDao;

public class OrderDao extends Dao {
	// Singleton
	private static OrderDao instance = null;

	private OrderDao() {

	}

	public static OrderDao getInstance() {
		if (instance == null) {
			instance = new OrderDao();
		}
		return instance;
	}

	// Abstract method implementations
	@Override
	protected String getTableName() {
		return "orders";
	}

	@Override
	protected PreparedStatement prepareStatementInsert(DataType object, Connection conn) throws SQLException {
		Order order = (Order) object;
		PreparedStatement stmt = conn.prepareStatement(
				"INSERT INTO orders VALUES(default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				Statement.RETURN_GENERATED_KEYS);
		stmt.setTimestamp(1, Timestamp.from(order.getTakeInDate()));
		stmt.setTimestamp(2, Timestamp.from(order.getPlannedRepairBeginDate()));
		stmt.setTimestamp(3, Timestamp.from(order.getRepairBeginDate()));
		stmt.setTimestamp(4, Timestamp.from(order.getRepairEndDate()));
		stmt.setInt(5, order.getEmployee().getId());
		stmt.setString(6, order.getProblemDescription());
		stmt.setString(7, order.getRepairDescription());
		stmt.setString(8, order.getStatus().toString());
		stmt.setInt(9, order.getVehicle().getId());
		stmt.setBigDecimal(10, order.getCostForClient());
		stmt.setBigDecimal(11, order.getCostOfParts());
		stmt.setBigDecimal(12, order.getCostPerHour());
		stmt.setInt(13, order.workHours);

		return stmt;
	}

	@Override
	protected PreparedStatement prepareStatementUpdate(DataType object, Connection conn) throws SQLException {
		Order order = (Order) object;
		PreparedStatement stmt = conn
				.prepareStatement("UPDATE orders SET take_in_date=?, planned_repair_begin_date=?, repair_begin_date=?, "
						+ "repair_end_date=?, employee_id=?, problem_description=?, repair_description=?, "
						+ "status=?, vehicle_id=?, cost_for_client=?, cost_of_parts=?, cost_per_hour=?, work_hours=? WHERE id=?");
		stmt.setTimestamp(1, Timestamp.from(order.getTakeInDate()));
		stmt.setTimestamp(2, Timestamp.from(order.getPlannedRepairBeginDate()));
		stmt.setTimestamp(3, Timestamp.from(order.getRepairBeginDate()));
		stmt.setTimestamp(4, Timestamp.from(order.getRepairEndDate()));
		stmt.setInt(5, order.getEmployee().getId());
		stmt.setString(6, order.getProblemDescription());
		stmt.setString(7, order.getRepairDescription());
		stmt.setString(8, order.getStatus().toString());
		stmt.setInt(9, order.getVehicle().getId());
		stmt.setBigDecimal(10, order.getCostForClient());
		stmt.setBigDecimal(11, order.getCostOfParts());
		stmt.setBigDecimal(12, order.getCostPerHour());
		stmt.setInt(13, order.workHours);
		stmt.setInt(14, order.getId());

		return stmt;
	}

	@Override
	protected DataType constructFromRs(ResultSet rs) throws SQLException {
		Order order = new Order(rs.getTimestamp("take_in_date").toInstant(), rs.getTimestamp("planned_repair_begin_date").toInstant(),
				(Employee) EmployeeDao.getInstance().selectById(rs.getInt("employee_id")), rs.getString("problem_description"),
				(Vehicle) VehicleDao.getInstance().selectById(rs.getInt("vehicle_id")));
		
		order.setId(rs.getInt("id"));
		order.setRepairBeginDate(rs.getTimestamp("repair_begin_date").toInstant());
		order.setRepairEndDate(rs.getTimestamp("repair_end_date").toInstant());
		order.setRepairDescription(rs.getString("repair_description"));
		order.setStatus(Order.Status.valueOf(rs.getString("status")));
		order.setCostOfParts(rs.getBigDecimal("cost_of_parts"));
		order.setCostPerHour(rs.getBigDecimal("cost_per_hour"));
		
		return order;
	}

}
