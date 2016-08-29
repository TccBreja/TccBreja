package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Estabelecimento;

public class AtualizarEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		Estabelecimento estabelecimento1 = new Estabelecimento();
		estabelecimento1.setNomeEstabelecimento("Teste Um");
		estabelecimento1.setDescricao("Aqui � Body Builder Ipsum PORRA! Vai subir �rvore � o caralho porra! Negativa Bambam negativa. "
				+ "� ver�o o ano todo vem cumpadi. Eu quero esse 13 daqui a pouquinho a�. T� comigo porra. N�o vai d� n�o.");
		estabelecimento1.setEndereco("Rua x, numero 90");
		estabelecimento1.setHorarioAbertura("10:30");
		estabelecimento1.setHorarioFechamento("00:30");
		estabelecimento1.setSite("www.testeum.com.br");
		estabelecimento1.setTelefone("(11) 9999-8888");
		estabelecimento1.setFotoUm("estaticos/imagens/bar_exemplo.jpg");
		estabelecimento1.setTipoEstabelecimento("Bar");
		estabelecimento1.setCodigoEstabelecimento(1);
		
		request.setAttribute("estabelecimento", estabelecimento1);
		
		return mapping.findForward("sucesso");
	}

	
}
