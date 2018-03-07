package pl.coderslab.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pl.coderslab.service.DbUtil;

public abstract class Dao {
	protected abstract String getTableName();

	// Insert/Update
	public void save(DataType object) {
		try (Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt;

			if (object.getId() == 0) { // Insert new object into database
				stmt = prepareStatementInsert(object, conn);
				stmt.executeUpdate();
				ResultSet rs = stmt.getGeneratedKeys();
				if (rs.next()) {
					object.setId(rs.getInt(1));
				}
			} else { // Update existing object
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
	public void delete(int id) {
		try (Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM " + getTableName() + " WHERE id=?");
			stmt.setInt(1, id);
			;
			stmt.executeUpdate();

			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Select:
	protected abstract DataType constructFromRs(ResultSet rs) throws SQLException;

	// All
	public List<? extends DataType> selectAll() {
		List<DataType> selected = new ArrayList<>();
		try (Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM " + getTableName() + " ORDER BY id ASC");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				selected.add(constructFromRs(rs));
			}

			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return selected;
	}

	// By id
	public DataType selectById(int id) {
		DataType selected = null;
		try (Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM " + getTableName() + " WHERE id=?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				selected = constructFromRs(rs);
			}

			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return selected;
	}

	// By a custom comparison
	public List<? extends DataType> selectByString(String cols, String comparison) {
		List<DataType> selected = new ArrayList<>();
		try (Connection conn = DbUtil.getConn()) {
			PreparedStatement stmt = conn
					.prepareStatement("SELECT " + cols + " FROM " + getTableName() + " " + comparison);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				selected.add(constructFromRs(rs));
			}

			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return selected;
	}
	
	public List<? extends DataType> selectByString(String comparison) {
		return selectByString("*", comparison);
	}
}
