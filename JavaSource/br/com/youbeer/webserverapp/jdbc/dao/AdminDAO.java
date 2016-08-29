package br.com.youbeer.webserverapp.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.youbeer.webserverapp.jdbc.ConnectionFactory;
import br.com.youbeer.webserverapp.modelo.Admin;

public class AdminDAO {
	
	private Connection connection;
	
	// Construtor com conexão ao banco
	public AdminDAO() {
		try {
			connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	private Admin popularAdmin(ResultSet rs) throws SQLException {
		Admin admin = new Admin();
		
		admin.setCod_admin(rs.getInt("cod_admin"));
		admin.setPassword(rs.getString("email"));
		admin.setUsername(rs.getString("senha"));
		
		return admin;
	}
	
	public Admin buscarPorUsername(String username) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from admin where email = ?");
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return popularAdmin(rs);
			}
			rs.close();
			stmt.close();
			connection.close();
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
