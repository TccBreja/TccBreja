package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class CadastrarEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
			
		// Retorna sucesso
		return mapping.findForward("sucesso");
	}

	
}
