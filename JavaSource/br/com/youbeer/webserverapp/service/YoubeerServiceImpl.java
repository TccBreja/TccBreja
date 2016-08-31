package br.com.youbeer.webserverapp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import br.com.youbeer.webserverapp.jdbc.dao.AdminDAO;
import br.com.youbeer.webserverapp.jdbc.dao.CervejaDAO;
import br.com.youbeer.webserverapp.jdbc.dao.EstabelecimentoDAO;
import br.com.youbeer.webserverapp.modelo.Admin;
import br.com.youbeer.webserverapp.modelo.Cerveja;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;

/**
 * Implementação da Interface para os serviços de manipulação ao banco.
 * 
 * @since 29/08/2016
 * @version 1.0
 */
public class YoubeerServiceImpl implements IYoubeerService  {
	
	/** Instância do AdminDAO */
	private AdminDAO adminDAO = new AdminDAO();
	
	/** Instância do EstabelecimentoDAO */
	private EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
	
	/** Instância do CervejaDAO */
	private CervejaDAO cervejaDAO = new CervejaDAO();
	
	/**
	 * Obtem os dados de acesso do admin
	 * @param admin Objeto da classe Admin
	 * @return saida Objeto da classe Admin
	 */
	@Override
	public Admin obterDadosAdmin(Admin admin) {
		return adminDAO.buscarPorUsername(admin.getUsername());
	}
	
	/**
	 * Obtem a lista de cervejas do banco
	 * @return saida Lista de Objetos da classe Cerveja
	 */
	@Override
	public List<Cerveja> listarCervejas() {
		return cervejaDAO.listarCervejas();
	}
	
	/**
	 * Insere uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void inserirCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		cervejaDAO.inserirCervejaEstabelecimento(estabelecimento, cerveja);
	}
	
	/**
	 * Remove uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void removerCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		cervejaDAO.removerCervejaEstabelecimento(estabelecimento, cerveja);
	}
	
	/**
	 * Altera os dados de uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	*/
	@Override
	public void alterarCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		cervejaDAO.alterarCervejaEstabelecimento(estabelecimento, cerveja);	
	}
	
	/**
	 * Verifica a existência do estabelecimento
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 * @return boolean true ou false
	 */
	@Override
	public boolean isExisteEstabelecimento(Estabelecimento estabelecimento) {
		return estabelecimentoDAO.isExisteEstabelecimento(estabelecimento);
	}
	
	/**
	 * Insere o estabelecimento no banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt> populado.
	 */
	@Override
	public void inserirEstabelecimento(Estabelecimento estabelecimento) {
		estabelecimentoDAO.inserirEstabelecimento(estabelecimento);
		
	}
	
	/**
	 * Remove estabelecimento do banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void removerEstabelecimento(Estabelecimento estabelecimento) {
		estabelecimentoDAO.removerEstabelecimento(estabelecimento);
	}
	
	/**
	 * Altera os dados do estabelecimento no banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void alterarInformacoesEstabelecimento(Estabelecimento estabelecimento) {
		estabelecimentoDAO.alterarInformacoesEstabelecimento(estabelecimento);	
	}
	
	/**
	 * Retorna a lista de estabelecimento de acordo com o código do admin
	 * @param session Objeto <tt>HttpSession</tt>.
	 * @return Lista de Objetos do tipo <tt> List<Estabelecimento></tt> 
	 */
	@Override
	public List<Estabelecimento> listarEstabelecimentos(HttpSession session) {
		return estabelecimentoDAO.listarEstabelecimentos(session);
	}
	
	/**
	 * Retorna o estabelecimento de acordo com o código de consulta
	 * @param codigoEstabelecimento <tt>int</tt>.
	 * @return estabelecimento de Objetos do tipo <tt> Estabelecimento<Estabelecimento></tt> 
	 */
	@Override
	public Estabelecimento buscarPorCodigo(int codigoEstabelecimento) {
		return estabelecimentoDAO.buscarPorCodigo(codigoEstabelecimento); 
	}	
}
