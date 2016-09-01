package br.com.youbeer.webserverapp.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.youbeer.webserverapp.jdbc.ConnectionFactory;
import br.com.youbeer.webserverapp.modelo.Admin;
import br.com.youbeer.webserverapp.modelo.Cerveja;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;

/**
 * Classe EstabelecimentoDAO. <br>
 * Classe que contém os métodos de interação do objeto Estabelecimento com o banco. <br>
 * <br>
 * Data de Criação: Ago 28, 2016 <br>
 */
public class EstabelecimentoDAO {
	
	/** Atributo que armazena a conexão com o banco */
	private Connection connection;
	
	
	
	/**
	* Construtor que estabelece conexão com o banco
	*/
	public EstabelecimentoDAO() {
		try {
			connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Popula o objeto Estabelecimento
	 * @param rs Objeto <tt>ResultSet</tt>.
	 * @return Objeto do tipo <tt>Estabelecimento</tt> populado
	 */
	private Estabelecimento popularEstabelecimento(ResultSet rs) throws SQLException {
		Estabelecimento estabelecimento = new Estabelecimento();

		estabelecimento.setCodigoEstabelecimento(rs.getInt("cod_estabelecimento"));
		estabelecimento.setNomeEstabelecimento(rs.getString("nome_estabelecimento"));
		estabelecimento.setDescricao(rs.getString("descricao_estabelecimento"));
		estabelecimento.setEndereco(rs.getString("endereco"));
		estabelecimento.setTelefone(rs.getString("telefone"));
		estabelecimento.setSite(rs.getString("site"));
		estabelecimento.setTipoEstabelecimento(rs.getString("tipo_estabelecimento"));
		estabelecimento.setHorarioAbertura(rs.getString("hora_abrir"));
		estabelecimento.setHorarioFechamento(rs.getString("hora_fechar"));
	
		return estabelecimento;
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
		cerveja.setValor(rs.getString("valor_cerveja"));
		
		return cerveja;
	}
	
	/**
	 * Verifica a existência do estabelecimento
	 * @param admin Objeto <tt>Admin</tt>.
	 * @return boolean true ou false
	 */
	public boolean isExisteEstabelecimento(Admin admin) {
		if (admin == null) {
			throw new IllegalArgumentException("Admin não deve ser nulo");
		}
		
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM estabelecimento WHERE cod_admin = ?");
			stmt.setInt(1, admin.getCod_admin());
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
	
	/**
	 * Insere o estabelecimento no banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt> populado.
	 */
	public void inserirEstabelecimento(Estabelecimento estabelecimento) {
		String sql = "INSERT INTO estabelecimento (nome, descricao_estabelecimento, endereco, telefone, site, tipo_estabelecimento, hora_abrir, hora_fechar) "
						+ "VALUES (?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, estabelecimento.getNomeEstabelecimento());
			stmt.setString(2, estabelecimento.getDescricao());
			stmt.setString(3, estabelecimento.getEndereco());
			stmt.setString(4, estabelecimento.getTelefone());
			stmt.setString(5, estabelecimento.getSite());
			stmt.setString(6, estabelecimento.getTipoEstabelecimento());
			stmt.setString(7, estabelecimento.getHorarioAbertura());
			stmt.setString(8, estabelecimento.getHorarioFechamento());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Remove estabelecimento do banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	public void removerEstabelecimento(Estabelecimento estabelecimento) {
		String sql = "DELETE FROM estabelecimento WHERE cod_estabelecimento = ?";
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, estabelecimento.getCodigoEstabelecimento());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Altera os dados do estabelecimento no banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	public void alterarInformacoesEstabelecimento(Estabelecimento estabelecimento) {
		String sql = "UPDATE estabelecimento"
						+ "SET nome = ?, descricao_estabelecimento = ?, endereco = ?, telefone = ?, site = ?, tipo_estabelecimento = ?, hora_abrir = ?, hora_fechar = ?  "
						+ "WHERE cod_estabelecimento = ?";
		PreparedStatement stmt;
		
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, estabelecimento.getNomeEstabelecimento());
			stmt.setString(2, estabelecimento.getDescricao());
			stmt.setString(3, estabelecimento.getEndereco());
			stmt.setString(4, estabelecimento.getTelefone());
			stmt.setString(5, estabelecimento.getSite());
			stmt.setString(6, estabelecimento.getTipoEstabelecimento());
			stmt.setString(7, estabelecimento.getHorarioAbertura());
			stmt.setString(8, estabelecimento.getHorarioFechamento());
			stmt.setInt(9, estabelecimento.getCodigoEstabelecimento());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Retorna a lista de estabelecimento de acordo com o código do admin
	 * @param admin Objeto <tt>Admin</tt>.
	 * @return Lista de Objetos do tipo <tt> List<Estabelecimento></tt> 
	 */
	public List<Estabelecimento> listarEstabelecimentos(Admin admin) {
		List<Estabelecimento> listaEstabelecimentos = new ArrayList<Estabelecimento>();
		Estabelecimento estabelecimento = new Estabelecimento();
		Cerveja cerveja = new Cerveja();
		int codigoEstabelecimento = 0;
		
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT e.cod_estabelecimento, e.nome_estabelecimento, e.tipo_estabelecimento, e.endereco, e.telefone, e.site, e.hora_abrir, e.hora_fechar, "
										+ "e.cod_admin, c.cod_cerveja, c.nome_cerveja, c.descricao_cerveja, c.tipo_cerveja, c.teor_alcool, c.volume_liquido, lc.valor_cerveja "
										+ "FROM estabelecimento e "
										+ "JOIN lista_cervejas_estabelecimento lc ON lc.cod_estabelecimento = e.cod_estabelecimento "
										+ "JOIN cerveja c on c.cod_cerveja = lc.cod_cerveja "
										+ "WHERE e.cod_admin = ?  "
										+ "ORDER BY e.cod_estabelecimento");
			
			stmt.setInt(1, admin.getCod_admin());
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// Preenche as informações do estabelecimento
				if (codigoEstabelecimento != rs.getInt("cod_estabelecimento")) {
					estabelecimento = new Estabelecimento();
					estabelecimento = popularEstabelecimento(rs);
					codigoEstabelecimento = rs.getInt("cod_estabelecimento");
				}
				
				// Preenche as informações das cerveja e adiciona a lista
				cerveja = popularCerveja(rs);
				estabelecimento.getListaCervejas().add(cerveja);
				
				//Adiciona o estabelecimento a lista de estabelecimentos
				listaEstabelecimentos.add(estabelecimento);
			}
			
			rs.close();
			stmt.close();
			connection.close();
			return listaEstabelecimentos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Retorna o estabelecimento de acordo com o código de consulta
	 * @param codigoEstabelecimento <tt>int</tt>.
	 * @return estabelecimento de Objetos do tipo <tt> Estabelecimento<Estabelecimento></tt> 
	 */
	public Estabelecimento buscarPorCodigo(int codigoEstabelecimento) {
		Estabelecimento estabelecimento = new Estabelecimento();
		Cerveja cerveja = new Cerveja();
		
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT e.cod_estabelecimento, e.nome_estabelecimento, e.tipo_estabelecimento, e.endereco, e.telefone, e.site, e.hora_abrir, e.hora_fechar, "
									+ "e.cod_admin, c.cod_cerveja, c.nome_cerveja, c.descricao_cerveja, c.tipo_cerveja, c.teor_alcool, c.volume_liquido, lc.valor_cerveja "
									+ "FROM estabelecimento e "
									+ "JOIN lista_cervejas_estabelecimento lc ON lc.cod_estabelecimento = e.cod_estabelecimento "
									+ "JOIN cerveja c on c.cod_cerveja = lc.cod_cerveja "
									+ "WHERE e.cod_estabelecimento = ?");
							
			stmt.setInt(1, codigoEstabelecimento);
			ResultSet rs = stmt.executeQuery();
			
			// Preenche as informações do estabelecimento
			estabelecimento = popularEstabelecimento(rs);
			
			while (rs.next()) {

				// Preenche as informações das cerveja e adiciona a lista
				cerveja = popularCerveja(rs);
				estabelecimento.getListaCervejas().add(cerveja);
			}
			rs.close();
			stmt.close();
			connection.close();
			return estabelecimento;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
