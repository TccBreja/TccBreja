package br.com.youbeer.websrverapp.service;

import br.com.youbeer.webserverapp.jdbc.dao.AdminDAO;
import br.com.youbeer.webserverapp.modelo.Admin;


public class YoubeerService {
	
	 /**Construtor da classe.*/
    private YoubeerService() {
    }
    
    /** Cria uma inst�ncia da classe.*/
    private static final YoubeerService INSTANCE = new YoubeerService();
    
    /**
     * M�todo retorna a inst�ncia de ServicoExtratoService.<br>
     * @return Inst�ncia de ServicoExtratoService.
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
