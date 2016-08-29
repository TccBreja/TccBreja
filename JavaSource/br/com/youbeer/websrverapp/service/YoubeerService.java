package br.com.youbeer.websrverapp.service;

import br.com.youbeer.webserverapp.jdbc.dao.AdminDAO;
import br.com.youbeer.webserverapp.modelo.Admin;


public class YoubeerService {
	
	 /**Construtor da classe.*/
    private YoubeerService() {
    }
    
    /** Cria uma instância da classe.*/
    private static final YoubeerService INSTANCE = new YoubeerService();
    
    /**
     * Método retorna a instância de ServicoExtratoService.<br>
     * @return Instância de ServicoExtratoService.
     */
    public static YoubeerService getInstance() {
        return INSTANCE;
    }
    
     
    public Admin obterDadosAdmin(Admin admin){
    
    	Admin retorno = new Admin();
    	AdminDAO adminDAO = new AdminDAO();
    	
    	retorno = adminDAO.buscarPorUsername(admin.getUsername());
    	
    	return retorno;
    }
	
}
