package br.com.youbeer.webserverapp.apresentacao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Admin;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

public class GerenciarEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		// Obtém sessão
		HttpSession session = request.getSession();
		
		// Instância do service
		IYoubeerService service = new YoubeerServiceImpl();
		
		// Obtém dados da sessão
		String username = String.valueOf(session.getAttribute("username"));
		
		// Prepara o objeto de entrada
		Admin admin = new Admin();
		admin.setUsername(username);
		
		// Faz a requisição dos dados do admin
		admin = service.obterDadosAdmin(admin);
		
		// Obtém a lista de estabelecimentos do usuário
		List<Estabelecimento> estabelecimentos = new ArrayList<Estabelecimento>();
		if (service.isExisteEstabelecimento(admin)) {
			estabelecimentos = service.listarEstabelecimentos(admin);
		}
		
		// Seta lista de estabelecimento no request
		request.setAttribute("listaEstabelecimentos", estabelecimentos);
		
		// Retorno
		return mapping.findForward("sucesso");
	}

	
}
