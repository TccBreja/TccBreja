package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Estabelecimento;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

public class CadastrarEstabelecimentoRatificaAction extends ActionBase {

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) {
		// Inst�ncia do service
		IYoubeerService service = new YoubeerServiceImpl();
						
		// Obt�m o estabelecimento 
		int codigoEstabelecimento = Integer.parseInt(request.getParameter("codigoEstabelecimento"));
		Estabelecimento estabelecimento = service.buscarPorCodigo(codigoEstabelecimento);
		
		// Seta o nome do estabelecimento no request
		request.setAttribute("nomeEstabelecimento", estabelecimento.getNomeEstabelecimento());
		
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
