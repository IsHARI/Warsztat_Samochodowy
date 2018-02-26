package pl.coderslab.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pl.coderslab.service.DbUtil;

public abstract class Dao {
	// Insert/Update
	public void save(DataType object) {
		try(Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt;
			
			if(object.getId() == 0) {    // Insert new object into database
				stmt = prepareStatementInsert(object, conn);
				stmt.executeUpdate();
				ResultSet rs = stmt.getResultSet();
				if(rs.next()) {
					object.setId(rs.getInt(1));
				}
			} else {    // Update existing object
				stmt = prepareStatementUpdate(object, conn);
				stmt.executeUpdate();
			}
			
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected abstract PreparedStatement prepareStatementInsert(DataType object, Connection conn) throws SQLException;
	protected abstract PreparedStatement prepareStatementUpdate(DataType object, Connection conn) throws SQLException;

	// Delete
	public void delete(DataType object) {
		try(Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt = prepareStatementDelete(object, conn);
			stmt.executeUpdate();
			
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected abstract PreparedStatement prepareStatementDelete(DataType object, Connection conn) throws SQLException;
}
