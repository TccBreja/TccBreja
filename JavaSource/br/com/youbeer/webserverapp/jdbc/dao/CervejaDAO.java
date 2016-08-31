package br.com.youbeer.webserverapp.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.youbeer.webserverapp.jdbc.ConnectionFactory;
import br.com.youbeer.webserverapp.modelo.Cerveja;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;

/**
 * Classe CervejaDAO. <br>
 * Classe que contém os métodos de interação do objeto Cerveja com o banco. <br>
 * <br>
 * Data de Criação: Ago 28, 2016 <br>
 */
public class CervejaDAO {
	
	/** Atributo que armazena a conexão com o banco*/
	private Connection connection;
	
	/**
	* Construtor que estabelece conexão com o banco
	*/
	public CervejaDAO() {
		try {
			connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Popula o objeto Cerveja
	 * @param rs Objeto <tt>ResultSet</tt>.
	 * @return Objeto do tipo <tt>Cerveja</tt> populado
	 */
	private Cerveja popularCerveja(ResultSet rs) throws SQLException {
		Cerveja cerveja = new Cerveja();
		
		cerveja.setCodigoCerveja(rs.getInt("cod_cerveja"));
		cerveja.setNomeCerveja(rs.getString("nome_cerveja"));
		cerveja.setDescricao(rs.getString("descricao_cerveja"));
		cerveja.setTipo(rs.getString("tipo_cerveja"));
		cerveja.setTeorAlcool(rs.getString("teor_alcool"));
		cerveja.setVolumeLiquido(rs.getString("volume_liquido"));
		
		return cerveja;
	}
	
	/**
	 * Insere uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	public void inserirCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		String sql = "INSERT INTO lista_cervejas_estabelecimento "
						+ "VALUES (?,?,?) ";	
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, estabelecimento.getCodigoEstabelecimento());
			stmt.setInt(2, cerveja.getCodigoCerveja());
			stmt.setString(3, cerveja.getValor());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Remove uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	public void removerCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		String sql = "DELETE FROM lista_cervejas_estabelecimento "
						+ "WHERE cod_estabelecimento = ? AND cod_cerveja = ?";
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, estabelecimento.getCodigoEstabelecimento());
			stmt.setInt(2, cerveja.getCodigoCerveja());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Altera os dados de uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	public void alterarCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja)  {
		String sql = "UPDATE lista_cervejas_estabelecimento"
						+ "SET valor_cerveja = ?  "
						+ "WHERE cod_estabelecimento = ? AND cod_cerveja = ?";
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, cerveja.getValor());
			stmt.setInt(2, estabelecimento.getCodigoEstabelecimento());
			stmt.setInt(3, cerveja.getCodigoCerveja());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

	/**
	 * Retorna a lista de cervejas cadastradas no banco.
	 * @return List do tipo <tt>Cerveja</tt> populado
	 */
	public List<Cerveja> listarCervejas() {
		try {
			List<Cerveja> listaCervejas = new ArrayList<Cerveja>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM cerveja ORDER BY cerveja.nome_cerveja");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listaCervejas.add(popularCerveja(rs));
			}
			
			rs.close();
			stmt.close();
			connection.close();
			return listaCervejas;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
