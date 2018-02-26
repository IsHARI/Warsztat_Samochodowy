package pl.coderslab.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pl.coderslab.service.DbUtil;

public abstract class Dao {
	// Add
	public void save(DataType object) {
		try(Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt;
			
			if(object.getId() == 0) {    // Insert new object into database
				stmt = prepareStatementInsert(conn);
				stmt.executeUpdate();
				ResultSet rs = stmt.getResultSet();
				if(rs.next()) {
					object.setId(rs.getInt(1));
				}
			} else {    // Update existing object
				stmt = prepareStatementUpdate(conn);
				stmt.executeUpdate();
			}
			
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected abstract PreparedStatement prepareStatementInsert(Connection conn);
	protected abstract PreparedStatement prepareStatementUpdate(Connection conn);

	// Delete
}
