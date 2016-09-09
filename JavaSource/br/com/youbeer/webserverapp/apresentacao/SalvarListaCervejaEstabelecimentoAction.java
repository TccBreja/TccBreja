package br.com.youbeer.webserverapp.apresentacao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Cerveja;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;

public class SalvarListaCervejaEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		
		List<Cerveja> listaCervejas = new ArrayList<Cerveja>();
		Cerveja cerveja = new Cerveja();
		Estabelecimento estabelecimento = new Estabelecimento();
		
		// Obtém o código do estabelecimento da sessão
		//estabelecimento.setCodigoEstabelecimento();
		
		// Obtém a lista de cerveja pelo request
		/*
		for(){
			cerveja.setCodigoCerveja(codigoCerveja);
			cerveja.setValor(valor);
		}
		*/
		
		
		return mapping.findForward("sucesso");
	}
}