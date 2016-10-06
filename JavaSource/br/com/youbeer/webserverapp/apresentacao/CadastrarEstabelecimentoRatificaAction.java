package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class CadastrarEstabelecimentoRatificaAction extends ActionBase {

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) {
		
		// Obt�m a vari�vel que determina o fluxo
		String controleMenu = request.getParameter("controleMenu");
		
		// Redireciona para jsp espec�fica
		if(controleMenu.equals("cadastrarEstabelecimento")){
			return mapping.findForward("sucessoCadastro");
		}else{
			return mapping.findForward("sucessoAtualizacao");
		}
	}	
}
