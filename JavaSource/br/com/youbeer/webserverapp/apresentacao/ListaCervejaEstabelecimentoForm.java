package br.com.youbeer.webserverapp.apresentacao;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionForm;

import br.com.youbeer.webserverapp.modelo.Cerveja;

public class ListaCervejaEstabelecimentoForm extends ActionForm {

	/** Serial */
	private static final long serialVersionUID = -4049264767090993421L;

	/** Lista de cervejas adicionada no estabelecimento */
	List<Cerveja> listaCervejas;

	/** @return Retorno o atributo listaCervejas */
	public List<Cerveja> getListaCervejas() {
		return listaCervejas;
	}

	/** @param listaCervejas Atribui o valor ao atributo listaCervejas */
	public void setListaCervejas(List<Cerveja> listaCervejas) {
		this.listaCervejas = listaCervejas;
	}
	
	public Cerveja getCerveja(int index){
		
		if (this.listaCervejas == null) {
			this.listaCervejas = new ArrayList<Cerveja>();
		}
		
		while (index >= this.listaCervejas.size()) {
			this.listaCervejas.add(new Cerveja());
		}
		
		return (Cerveja) listaCervejas.get(index);
		
	}
}
