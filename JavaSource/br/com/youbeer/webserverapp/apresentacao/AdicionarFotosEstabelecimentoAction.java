package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Admin;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

public class AdicionarFotosEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		// Instância do service
		IYoubeerService service = new YoubeerServiceImpl();
		
		// Obtém dados da sessão
		String username = String.valueOf(request.getSession().getAttribute("username"));
				
		// Prepara o objeto de entrada para obter dados do admin
		Admin admin = new Admin();
		admin.setUsername(username);
				
		// Faz a requisição dos dados do admin
		admin = service.obterDadosAdmin(admin);
		
		// Prepara o objeto de entrada para salvar o estabelecimento
		Estabelecimento estabelecimento = new Estabelecimento();
		estabelecimento.setNomeEstabelecimento(request.getParameter("nomeEstabelecimento"));
		estabelecimento.setEndereco(request.getParameter("endereco"));
		estabelecimento.setSite(request.getParameter("site"));
		estabelecimento.setTelefone(request.getParameter("telefone"));
		estabelecimento.setTipoEstabelecimento(request.getParameter("tipoEstabelecimento"));
		estabelecimento.setHorarioAbertura(request.getParameter("horarioAbertura"));
		estabelecimento.setHorarioFechamento(request.getParameter("horarioFechamento"));
		estabelecimento.setDescricao(request.getParameter("descricao"));
		estabelecimento.setCodigoAdmin(admin.getCodAdmin());
		
		// Codigo do estabelecimento
		int codigoEstabelecimento;
		
		// Verifica o tipo de servico 
		if (StringUtils.isEmpty(request.getParameter("codigoEstabelecimento"))) {
			codigoEstabelecimento = service.inserirEstabelecimento(estabelecimento);
		} else {
			service.alterarInformacoesEstabelecimento(estabelecimento);
			codigoEstabelecimento = Integer.parseInt((request.getParameter("codigoEstabelecimento")));
		}
		
		// Seta codigo do estabelecimento no request
		request.setAttribute("codigoEstabelecimento", codigoEstabelecimento);
		
		// Retorna sucesso	
		return mapping.findForward("sucesso");
	}

	
}
