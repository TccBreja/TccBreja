package br.com.youbeer.webserverapp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * <p>
 *	Classe Connection Factory que se conecta ao banco de dados <br/>
 * </p>
 */
public class ConnectionFactory {
	
	/**
	 * Obtém a conexão com o banco de dados
	 * @return conexão estabelecida Objeto <tt>Connection</tt>.
	*/
	public Connection getConnection() throws SQLException {
		System.out.println("conectando ...");

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}

		return DriverManager.getConnection("jdbc:mysql://localhost/youbeer",
				"root", "a1a2a3");
	}
}
