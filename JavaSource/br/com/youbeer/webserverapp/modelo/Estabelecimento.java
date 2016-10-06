package br.com.youbeer.webserverapp.modelo;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe Estabelecimento. <br>
 * Classe modelo para Estabelecimento <br>
 * <br>
 * Data de Criação: Ago 28, 2016 <br>
 */
public class Estabelecimento {
	
	/** Código identificador do estabelecimento */
	private int codigoEstabelecimento;
	
	/** Código identificador do administrador do estabelecimento */
	private int codigoAdmin;
	
	/** Nome do estabelecimento */
	private String nomeEstabelecimento;
	
	/** Endereço do estabelecimento */
	private String endereco;
	
	/** Site do estabelecimento */
	private String site;
	
	/** Telefone do estabelecimento */
	private String telefone;
	
	/** Tipo do estabelecimento */
	private String tipoEstabelecimento;
	
	/** Hora de abertura do estabelecimento */
	private String horarioAbertura;
	
	/** Hora de fechamento do estabelecimento */
	private String horarioFechamento;
	
	/** Descrição do estabelecimento */
	private String descricao;

	/** Lista de cervejas do estabelecimento */
	List<Cerveja> listaCervejas = new ArrayList<Cerveja>();

	/** @return Retorno o atributo nomeEstabelecimento */
	public String getNomeEstabelecimento() {
		return nomeEstabelecimento;
	}

	/** @param nomeEstabelecimento Atribui o valor ao atributo nomeEstabelecimento */
	public void setNomeEstabelecimento(String nomeEstabelecimento) {
		this.nomeEstabelecimento = nomeEstabelecimento;
	}

	/** @return Retorno o atributo endereco */
	public String getEndereco() {
		return endereco;
	}

	/** @param endereco Atribui o valor ao atributo endereco */
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	/** @return Retorno o atributo site */
	public String getSite() {
		return site;
	}

	/** @param site Atribui o valor ao atributo site */
	public void setSite(String site) {
		this.site = site;
	}

	/** @return Retorno o atributo telefone */
	public String getTelefone() {
		return telefone;
	}

	/** @param telefone Atribui o valor ao atributo telefone */
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	/** @return Retorno o atributo horarioAbertura */
	public String getHorarioAbertura() {
		return horarioAbertura;
	}

	/** @param horarioAbertura Atribui o valor ao atributo horarioAbertura */
	public void setHorarioAbertura(String horarioAbertura) {
		this.horarioAbertura = horarioAbertura;
	}

	/** @return Retorno o atributo horarioFechamento */
	public String getHorarioFechamento() {
		return horarioFechamento;
	}

	/** @param horarioFechamento Atribui o valor ao atributo horarioFechamento */
	public void setHorarioFechamento(String horarioFechamento) {
		this.horarioFechamento = horarioFechamento;
	}

	/** @return Retorno o atributo descricao */
	public String getDescricao() {
		return descricao;
	}

	/** @param descricao Atribui o valor ao atributo descricao */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/** @return Retorno o atributo tipoEstabelecimento */
	public String getTipoEstabelecimento() {
		return tipoEstabelecimento;
	}

	/** @param tipoEstabelecimento Atribui o valor ao atributo tipoEstabelecimento */
	public void setTipoEstabelecimento(String tipoEstabelecimento) {
		this.tipoEstabelecimento = tipoEstabelecimento;
	}

	/** @return Retorno o atributo codigoEstabelecimento */
	public int getCodigoEstabelecimento() {
		return codigoEstabelecimento;
	}

	/** @param codigoEstabelecimento Atribui o valor ao atributo codigoEstabelecimento */
	public void setCodigoEstabelecimento(int codigoEstabelecimento) {
		this.codigoEstabelecimento = codigoEstabelecimento;
	}

	/** @return Retorno o atributo codigoAdmin */
	public int getCodigoAdmin() {
		return codigoAdmin;
	}

	/** @param codigoAdmin Atribui o valor ao atributo codigoAdmin */
	public void setCodigoAdmin(int codigoAdmin) {
		this.codigoAdmin = codigoAdmin;
	}

	/** @return Retorno o atributo listaCervejas */
	public List<Cerveja> getListaCervejas() {
		return listaCervejas;
	}

	/** @param listaCervejas Atribui o valor ao atributo listaCervejas */
	public void setListaCervejas(List<Cerveja> listaCervejas) {
		this.listaCervejas = listaCervejas;
	}
	
}
