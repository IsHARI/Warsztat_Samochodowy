package pl.coderslab.model.vehicle;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pl.coderslab.model.Dao;
import pl.coderslab.model.DataType;

public class VehicleDao extends Dao {
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
		stmt.setDate(4, Date.valueOf(vehicle.getNextInspectionDate()));
		// TODO Client
		// stmt.setInt(5, vehicle.getOwner.getId);

		return stmt;
	}

	@Override
	protected PreparedStatement prepareStatementUpdate(DataType object, Connection conn) throws SQLException {
		Vehicle vehicle = (Vehicle) object;

		PreparedStatement stmt = conn.prepareStatement("UPDATE vehicle SET ?  ?, ?, ?, ? WHERE id=?");
		stmt.setString(1, vehicle.getModel());
		stmt.setInt(2, vehicle.getYearOfProduction());
		stmt.setString(3, vehicle.getLicenceNumber());
		stmt.setDate(4, Date.valueOf(vehicle.getNextInspectionDate()));
		// stmt.setInt(5, vehicle.getOwner.getId);
		stmt.setInt(6, vehicle.getId());

		return stmt;
	}

	@Override
	protected DataType constructFromRs(ResultSet rs) throws SQLException {
		Vehicle vehicle = new Vehicle(rs.getString("model"), rs.getInt("year_of_production"),
				rs.getString("licence_number"), rs.getDate("next_inspection_date").toLocalDate()
				/*, ClientDao.selectById(rs.getInt("client_id"))*/);
		vehicle.setId(rs.getInt("id"));

		return vehicle;
	}

}
