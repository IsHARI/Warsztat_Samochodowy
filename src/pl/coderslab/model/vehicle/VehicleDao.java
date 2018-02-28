package pl.coderslab.model.vehicle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import pl.coderslab.model.Dao;
import pl.coderslab.model.DataType;
import pl.coderslab.model.client.Client;
import pl.coderslab.model.client.ClientDao;

public class VehicleDao extends Dao {
	// Singleton
	private static VehicleDao instance = null;
	private VehicleDao() {
		
	}
	
	public static VehicleDao getInstance() {
		if(instance == null) {
			instance = new VehicleDao();
		}
		return instance;
	}

	// Abstract method implementations
	@Override
	protected String getTableName() {
		return "vehicle";
	}

	@Override
	protected PreparedStatement prepareStatementInsert(DataType object, Connection conn) throws SQLException {
		Vehicle vehicle = (Vehicle) object;

		PreparedStatement stmt = conn.prepareStatement("INSERT INTO vehicle VALUES (default, ?, ?, ?, ?, ?)",
				Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, vehicle.getModel());
		stmt.setInt(2, vehicle.getYearOfProduction());
		stmt.setString(3, vehicle.getLicenceNumber());
		stmt.setTimestamp(4, Timestamp.from(vehicle.getNextInspectionDate()));
		stmt.setInt(5, vehicle.getOwner().getId());

		return stmt;
	}

	@Override
	protected PreparedStatement prepareStatementUpdate(DataType object, Connection conn) throws SQLException {
		Vehicle vehicle = (Vehicle) object;

		PreparedStatement stmt = conn.prepareStatement("UPDATE vehicle SET ?, ?, ?, ?, ? WHERE id=?");
		stmt.setString(1, vehicle.getModel());
		stmt.setInt(2, vehicle.getYearOfProduction());
		stmt.setString(3, vehicle.getLicenceNumber());
		stmt.setTimestamp(4, Timestamp.from(vehicle.getNextInspectionDate()));
		stmt.setInt(5, vehicle.getOwner().getId());
		stmt.setInt(6, vehicle.getId());

		return stmt;
	}

	@Override
	protected DataType constructFromRs(ResultSet rs) throws SQLException {
		Vehicle vehicle = new Vehicle(rs.getString("model"), rs.getInt("year_of_production"),
				rs.getString("licence_number"), rs.getTimestamp("next_inspection_date").toInstant(),
				(Client) ClientDao.getInstance().selectById(rs.getInt("client_id")));
		vehicle.setId(rs.getInt("id"));

		return vehicle;
	}

}
