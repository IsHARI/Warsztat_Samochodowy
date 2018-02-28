package pl.coderslab.model.client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pl.coderslab.model.Dao;
import pl.coderslab.model.DataType;

public class ClientDao extends Dao {
	// Singleton
	private static ClientDao instance = null;
	private ClientDao() {
		
	}
	
	public static ClientDao getInstance() {
		if(instance == null) {
			instance = new ClientDao();
		}
		return instance;
	}

	// Abstract method implementations
	@Override
	protected String getTableName() {
		return "client";
	}

	@Override
	protected PreparedStatement prepareStatementInsert(DataType object, Connection conn) throws SQLException {
		Client client = (Client) object;

		PreparedStatement stmt = conn.prepareStatement("INSERT INTO client VALUES(default, ?, ?, ?, ?)",
				Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, client.getFirstName());
		stmt.setString(2, client.getLastName());
		stmt.setString(3, client.getEmail());
		stmt.setString(4, client.getPhone());

		return stmt;
	}

	@Override
	protected PreparedStatement prepareStatementUpdate(DataType object, Connection conn) throws SQLException {
		Client client = (Client) object;

		PreparedStatement stmt = conn.prepareStatement(
				"UPDATE client SET first_name=?, last_name=?, email=?, phone=? WHERE id=?)");
		stmt.setString(1, client.getFirstName());
		stmt.setString(2, client.getLastName());
		stmt.setString(3, client.getEmail());
		stmt.setString(4, client.getPhone());
		stmt.setInt(5, client.getId());

		return stmt;
	}

	@Override
	protected DataType constructFromRs(ResultSet rs) throws SQLException {
		Client client = new Client(rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
				rs.getString("phone"));
		client.setId(rs.getInt("id"));
		return client;
	}
	
}
