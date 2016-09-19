package br.com.youbeer.webserverapp.modelo;

/**
 * Classe modelo Admin
 * 
 * @since 29/08/2016
 * @version 1.0
 */
public class Admin {
	
	/** C�digo indentificador do admin */
	private int codAdmin;
	
	/** Nome de usu�rio do admin */
	private String username;
	
	/** Senha criptografada do admin */
	private String password;

	/** @return Retorno o atributo cod_admin */
	public int getCodAdmin() {
		return codAdmin;
	}

	/** @param cod_admin Atribui o valor ao atributo cod_admin */
	public void setCodAdmin(int cod_admin) {
		this.codAdmin = cod_admin;
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
