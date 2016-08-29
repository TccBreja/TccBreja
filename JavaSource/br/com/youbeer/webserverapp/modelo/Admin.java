package br.com.youbeer.webserverapp.modelo;

public class Admin {
	
	private int cod_admin;
	
	private String username;
	
	private String password;

	/** @return Retorno o atributo cod_admin */
	public int getCod_admin() {
		return cod_admin;
	}

	/** @param cod_admin Atribui o valor ao atributo cod_admin */
	public void setCod_admin(int cod_admin) {
		this.cod_admin = cod_admin;
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
