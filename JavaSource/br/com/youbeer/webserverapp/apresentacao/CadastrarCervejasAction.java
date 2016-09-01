package br.com.youbeer.webserverapp.apresentacao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Cerveja;

public class CadastrarCervejasAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		List<Cerveja> cervejas = new ArrayList<Cerveja>();
		
		//Mock do recebimento da lista de cervejas
		
		Cerveja cerveja1 = new Cerveja();
		cerveja1.setCodigoCerveja(101010);
		cerveja1.setNomeCerveja("Skoll");
		cerveja1.setTipo("Garrafa - 600ml");
		
		Cerveja cerveja2 = new Cerveja();
		cerveja2.setCodigoCerveja(111002);
		cerveja2.setNomeCerveja("Brahma");
		cerveja2.setTipo("Garrafa - 600ml");
		
		cervejas.add(cerveja1);
		cervejas.add(cerveja2);
		cervejas.add(cerveja2);
		cervejas.add(cerveja2);
		
		
		request.setAttribute("listaCervejas", cervejas);
		request.setAttribute("appendListaCervejas", criaAppendLista(cervejas));
		return mapping.findForward("sucesso");
	}

	/**
	 * Retorna o append dinâmico com as cervejas retornadas do banco de dados
	 * @param List cervejas Objeto <tt>Cerveja</tt>.
	 */
	public String criaAppendLista(List<Cerveja> cervejas){
		
		String appendLista = "";
		appendLista += "<tr><td align='center'><a class='btn btn-danger deletavel'><em class='fa fa-trash'>"
				+ "</em></a></td><td class='hidden-xs'><select id='listaCervejasSelect' name='listaCervejasSelect' class='form-control'>"
				+ "<logic:iterate id='listaCervejas' name='listaCervejas'>";
		
		for(Cerveja cerveja : cervejas){
			appendLista += "<option value='" + cerveja.getCodigoCerveja() + "'>";
			appendLista += cerveja.getNomeCerveja() + " - " + cerveja.getTipo();
			appendLista += "</option>";
		}
		
		appendLista += "</logic:iterate></select></td><td><div class='input-group'><div class='input-group-addon'>$</div>"
				+ "<input type='text' class='form-control dinheiro'></div></td></tr>";
		return appendLista;
		
	}
	
	
}
