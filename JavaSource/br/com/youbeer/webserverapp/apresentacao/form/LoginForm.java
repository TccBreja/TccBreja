package br.com.youbeer.webserverapp.apresentacao.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class LoginForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
     * Nome do usu�rio.
     */
	private String username;
	
	/**
     * Senha criptografada.
     */
	private String password;
	
	/**
	 * Valida a obrigatoriedade e a consist�ncia entre campos do formul�rio.
	 * @param mapping Classe <tt>ActionMapping</tt> fornecida pelo <i>framework</i> Struts.
	 * @param request Classe <tt>HttpServletRequest</tt> fornecida pelo <i>framework</i> Struts.
	 * @return Objeto do tipo <tt>ActionErrors</tt> contendo os erros de formato e consist�ncia encontrados no
	 * formul�rio.
	 */
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
	
		ActionErrors erros = new ActionErrors();
		
		if (getUsername() != null && !getUsername().equals("") && getPassword() != null && !getPassword().equals("")) {
			
			
		
		}
		
		return erros;
	}
	

	/** @return Retorno o atributo username */
	public String getUsername() {
		return username;
	}

	/** @param username Atribui o valor ao atributo username */
	public void setUsername(String username) {
		this.username = username;
	}

	/** @return Retorno o atributo password */
	public String getPassword() {
		return password;
	}

	/** @param password Atribui o valor ao atributo password */
	public void setPassword(String password) {
		this.password = password;
	}
	
}
