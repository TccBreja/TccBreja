package br.com.youbeer.webserverapp.apresentacao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Estabelecimento;

public class GerenciarEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		/**Metodo mockado da implementa��o da view do estabelecimento*/
		
		List<Estabelecimento> estabelecimentos = new ArrayList<Estabelecimento>();
		
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
		
		Estabelecimento estabelecimento2 = new Estabelecimento();
		estabelecimento2.setNomeEstabelecimento("Teste Dois");
		estabelecimento2.setDescricao("� ver�o o ano todo vem cumpadi. Eita porra!, t� saindo da jaula o monstro! Birl! "  
				+ "Aqui n�is constr�i fibra, n�o � �gua com m�sculo. Negativa Bambam negativa. � esse que a gente quer, � ele que n�is vamo buscar.");
		estabelecimento2.setEndereco("Rua y, numero 09");
		estabelecimento2.setHorarioAbertura("05:30");
		estabelecimento2.setHorarioFechamento("02:30");
		estabelecimento2.setSite("www.testedois.com.br");
		estabelecimento2.setTelefone("(11) 8888-9999");
		estabelecimento2.setFotoUm("estaticos/imagens/bar_exemplo.jpg");
		estabelecimento2.setTipoEstabelecimento("Mercado");
		
		estabelecimentos.add(estabelecimento1);
		estabelecimentos.add(estabelecimento2);
		
		request.setAttribute("listaEstabelecimentos", estabelecimentos);
		
		return mapping.findForward("sucesso");
	}

	
}
