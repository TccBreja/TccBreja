package br.com.youbeer.webserverapp.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.youbeer.webserverapp.jdbc.ConnectionFactory;
import br.com.youbeer.webserverapp.modelo.Admin;

/**
 * Classe AdminDAO. <br>
 * Classe que cont�m os m�todos de intera��o do objeto Admin com o banco. <br>
 * <br>
 * Data de Cria��o: Ago 28, 2016 <br>
 */
public class AdminDAO {
	
	/** Atributo que armazena a conex�o com o banco */
	private Connection connection;
	
	/**
	* Construtor que estabelece conex�o com o banco
	*/
	public AdminDAO() {
		try {
			connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Popula o objeto Admin
	 * @param rs Objeto <tt>ResultSet</tt>.
	 * @return Objeto do tipo <tt>Admin</tt> populado
	 */
	private Admin popularAdmin(ResultSet rs) throws SQLException {
		Admin admin = new Admin();
		
		admin.setCod_admin(rs.getInt("cod_admin"));
		admin.setPassword(rs.getString("senha"));
		admin.setUsername(rs.getString("email"));
		
		return admin;
	}
	
	/**
	 * Busca as informa��es do admin de acordo com o username
	 * @param username <tt>String</tt>.
	 * @return Objeto do tipo <tt>Admin</tt> populado
	 */
	public Admin buscarPorUsername(String username) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM admin WHERE email = ?");
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
	
	/**
	 * Verifica se o admin est� cadastrado no banco
	 * @param username <tt>String</tt>.
	 * @return Objeto do tipo <tt>Admin</tt> populado
	 */
	public boolean isExisteAdmin(Admin admin) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM admin WHERE email = ?");
			stmt.setString(1, admin.getUsername());
			ResultSet rs = stmt.executeQuery();
			boolean encontrado = rs.next();
			rs.close();
			stmt.close();
			connection.close();
			return encontrado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
