package br.com.youbeer.webserverapp.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import br.com.youbeer.webserverapp.jdbc.ConnectionFactory;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;

public class EstabelecimentoDAO {

	private Connection connection;
	
	// Construtor com conexão ao banco
	public EstabelecimentoDAO() {
		try {
			connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean isExisteEstabelecimento(Estabelecimento estabelecimento) {
		if (estabelecimento == null) {
			throw new IllegalArgumentException("Estabelecimento não deve ser nulo");
		}
		
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from estabelecimento where cod_estabelecimento = ?");
			stmt.setInt(1, estabelecimento.getCodigoEstabelecimento());
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
	
	public void inserirEstabelecimento(Estabelecimento estabelecimento) {
		String sql = "insert into estabelecimento (nome, descricao, endereco, telefone, site, tipo, hora_abrir, hora_fechar) values (?,?,?,?,?,?,?)";
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
	
	public void removerEstabelecimento(Estabelecimento estabelecimento) {
		String sql = "delete from estabelecimento where cod_estabelecimento = ?";
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
	
	public void alterarEstabelecimento(Estabelecimento estabelecimento) {
		String sql = "update estabelecimento set nome = ?, descricao = ?, endereco = ?, telefone = ?, site = ?, tipo = ?, hora_abrir = ?, hora_fechar = ?  where cod_estabelecimento = ?";
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
	
	private Estabelecimento popularEstabelecimento(ResultSet rs) throws SQLException {
		Estabelecimento estabelecimento = new Estabelecimento();

		estabelecimento.setCodigoEstabelecimento(rs.getInt("cod_estabelecimento"));
		estabelecimento.setNomeEstabelecimento(rs.getString("nome"));
		estabelecimento.setDescricao(rs.getString("descricao"));
		estabelecimento.setEndereco(rs.getString("endereco"));
		estabelecimento.setTelefone(rs.getString("telefone"));
		estabelecimento.setSite(rs.getString("site"));
		estabelecimento.setTipoEstabelecimento(rs.getString("tipo"));
		estabelecimento.setHorarioAbertura(rs.getString("hora_abrir"));
		estabelecimento.setHorarioFechamento(rs.getString("hora_fechar"));
	
		return estabelecimento;
	}
	
	public List<Estabelecimento> listarEstabelecimentos(HttpSession session) {
		try {
			List<Estabelecimento> listaEstabelecimentos = new ArrayList<Estabelecimento>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from estabelecimento where cod_admin = ?");
			stmt.setInt(1, (int) session.getAttribute("cod_admin"));
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listaEstabelecimentos.add(popularEstabelecimento(rs));
			}
			
			rs.close();
			stmt.close();
			connection.close();
			return listaEstabelecimentos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Estabelecimento buscarPorCodigo(int codigoEstabelecimento) {

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from estabelecimento where cod_estabelecimento = ?");
			stmt.setInt(1, codigoEstabelecimento);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return popularEstabelecimento(rs);
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
