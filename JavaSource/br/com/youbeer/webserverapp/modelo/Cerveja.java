package br.com.youbeer.webserverapp.modelo;

/**
 * Classe Cerveja. <br>
 * Classe modelo para Cerveja <br>
 * <br>
 * Data de Criação: Ago 28, 2016 <br>
 */
public class Cerveja {
	
	/** Código para identificação da cerveja */
	private int codigoCerveja;
	
	/** Nome da cerveja */
	private String nomeCerveja;
	
	/** Descrição da cerveja */
	private String descricao;
	
	/** Tipo da cerveja */
	private String tipo;
	
	/** Teor alcoólico da cerveja */
	private String teorAlcool;
	
	/** Volume líquido da cerveja */
	private String volumeLiquido;
	
	/** Valor de venda da cerveja */
	private String valor;

	/** @return Retorno o atributo codigoCerveja */
	public int getCodigoCerveja() {
		return codigoCerveja;
	}

	/** @param codigoCerveja Atribui o valor ao atributo codigoCerveja */
	public void setCodigoCerveja(int codigoCerveja) {
		this.codigoCerveja = codigoCerveja;
	}

	/** @return Retorno o atributo nomeCerveja */
	public String getNomeCerveja() {
		return nomeCerveja;
	}

	/** @param nomeCerveja Atribui o valor ao atributo nomeCerveja */
	public void setNomeCerveja(String nomeCerveja) {
		this.nomeCerveja = nomeCerveja;
	}

	/** @return Retorno o atributo descricao */
	public String getDescricao() {
		return descricao;
	}

	/** @param descricao Atribui o valor ao atributo descricao */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/** @return Retorno o atributo tipo */
	public String getTipo() {
		return tipo;
	}

	/** @param tipo Atribui o valor ao atributo tipo */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/** @return Retorno o atributo teorAlcool */
	public String getTeorAlcool() {
		return teorAlcool;
	}

	/** @param teorAlcool Atribui o valor ao atributo teorAlcool */
	public void setTeorAlcool(String teorAlcool) {
		this.teorAlcool = teorAlcool;
	}

	/** @return Retorno o atributo volumeLiquido */
	public String getVolumeLiquido() {
		return volumeLiquido;
	}

	/** @param volumeLiquido Atribui o valor ao atributo volumeLiquido */
	public void setVolumeLiquido(String volumeLiquido) {
		this.volumeLiquido = volumeLiquido;
	}

	/** @return Retorno o atributo valor */
	public String getValor() {
		return valor;
	}

	/** @param valor Atribui o valor ao atributo valor */
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	

}
