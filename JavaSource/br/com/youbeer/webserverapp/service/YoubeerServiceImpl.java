package br.com.youbeer.webserverapp.service;

import java.util.List;

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
	
	/**
	 * Verifica a existência do admin pelo username
	 * @param admin Objeto <tt>Admin</tt>.
	 * @return boolean true ou false
	 */
	public boolean isExisteAdmin(Admin admin){
		
		/** Instância do AdminDAO */
		AdminDAO adminDAO = new AdminDAO();
		
		return adminDAO.isExisteAdmin(admin);
	}
	
	/**
	 * Obtem os dados de acesso do admin
	 * @param admin Objeto da classe Admin
	 * @return saida Objeto da classe Admin
	 */
	@Override
	public Admin obterDadosAdmin(Admin admin) {
		
		/** Instância do AdminDAO */
		AdminDAO adminDAO = new AdminDAO();
	
		return adminDAO.buscarPorUsername(admin.getUsername());
	}
	
	/**
	 * Obtem a lista de cervejas do banco
	 * @return saida Lista de Objetos da classe Cerveja
	 */
	@Override
	public List<Cerveja> listarCervejas() {
		
		/** Instância do CervejaDAO */
		CervejaDAO cervejaDAO = new CervejaDAO();
		
		return cervejaDAO.listarCervejas();
	}
	
	/**
	 * Insere uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void inserirCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		
		/** Instância do CervejaDAO */
		CervejaDAO cervejaDAO = new CervejaDAO();
		
		cervejaDAO.inserirCervejaEstabelecimento(estabelecimento, cerveja);
	}
	
	/**
	 * Remove uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void removerCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		
		/** Instância do CervejaDAO */
		CervejaDAO cervejaDAO = new CervejaDAO();
		
		cervejaDAO.removerCervejaEstabelecimento(estabelecimento, cerveja);
	}
	
	/**
	 * Altera os dados de uma cerveja em um estabelecimento do banco
	 * @param cerveja Objeto <tt>Cerveja</tt>.
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	*/
	@Override
	public void alterarCervejaEstabelecimento(Estabelecimento estabelecimento, Cerveja cerveja) {
		
		/** Instância do CervejaDAO */
		CervejaDAO cervejaDAO = new CervejaDAO();
		
		cervejaDAO.alterarCervejaEstabelecimento(estabelecimento, cerveja);	
	}
	
	/**
	 * Verifica a existência do estabelecimento
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 * @return boolean true ou false
	 */
	@Override
	public boolean isExisteEstabelecimento(Admin admin) {
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		return estabelecimentoDAO.isExisteEstabelecimento(admin);
	}
	
	/**
	 * Insere o estabelecimento no banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt> populado.
	 */
	@Override
	public int inserirEstabelecimento(Estabelecimento estabelecimento) {
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		return estabelecimentoDAO.inserirEstabelecimento(estabelecimento);
		
	}
	
	/**
	 * Remove estabelecimento do banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void removerEstabelecimento(Estabelecimento estabelecimento) {
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		estabelecimentoDAO.removerEstabelecimento(estabelecimento);
	}
	
	/**
	 * Altera os dados do estabelecimento no banco
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt>.
	 */
	@Override
	public void alterarInformacoesEstabelecimento(Estabelecimento estabelecimento) {
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		estabelecimentoDAO.alterarInformacoesEstabelecimento(estabelecimento);	
	}
	
	/**
	 * Retorna a lista de estabelecimento de acordo com o código do admin
	 * @param session Objeto <tt>HttpSession</tt>.
	 * @return Lista de Objetos do tipo <tt> List<Estabelecimento></tt> 
	 */
	@Override
	public List<Estabelecimento> listarEstabelecimentos(Admin admin) {
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		return estabelecimentoDAO.listarEstabelecimentos(admin);
	}
	
	/**
	 * Retorna o estabelecimento de acordo com o código de consulta
	 * @param codigoEstabelecimento <tt>int</tt>.
	 * @return estabelecimento de Objetos do tipo <tt> Estabelecimento<Estabelecimento></tt> 
	 */
	@Override
	public Estabelecimento buscarPorCodigo(int codigoEstabelecimento) {
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		return estabelecimentoDAO.buscarPorCodigo(codigoEstabelecimento); 
	}
	
	/**
	 * Grava o caminho da foto do estabelecimento inserido pelo usuário
	 * @param estabelecimento Objeto <tt>Estabelecimento</tt> populado.
	 * @param numeroFoto <tt>String</tt> do campo que será populado.
	 * @param caminhoFoto <tt>String</tt> com o caminho da imagem a ser salva.
	 */
	public void inserirFotosEstabelecimento(Estabelecimento estabelecimento, String campoNome, String caminhoFoto){
		
		/** Instância do EstabelecimentoDAO */
		EstabelecimentoDAO estabelecimentoDAO = new EstabelecimentoDAO();
		
		estabelecimentoDAO.inserirFotosEstabelecimento(estabelecimento, campoNome, caminhoFoto); 
	}
	
	
}
