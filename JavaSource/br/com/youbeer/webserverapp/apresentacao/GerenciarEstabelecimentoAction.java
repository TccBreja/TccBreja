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
		
		/**Metodo mockado da implementação da view do estabelecimento*/
		
		List<Estabelecimento> estabelecimentos = new ArrayList<Estabelecimento>();
		
		Estabelecimento estabelecimento1 = new Estabelecimento();
		estabelecimento1.setNomeEstabelecimento("Teste Um");
		estabelecimento1.setDescricao("Aqui é Body Builder Ipsum PORRA! Vai subir árvore é o caralho porra! Negativa Bambam negativa. "
				+ "É verão o ano todo vem cumpadi. Eu quero esse 13 daqui a pouquinho aí. Tá comigo porra. Não vai dá não.");
		estabelecimento1.setEndereco("Rua x, numero 90");
		estabelecimento1.setHorarioAbertura("10:30");
		estabelecimento1.setHorarioFechamento("00:30");
		estabelecimento1.setSite("www.testeum.com.br");
		estabelecimento1.setTelefone("(11) 9999-8888");
		estabelecimento1.setFotoUm("estaticos/imagens/bar_exemplo.jpg");
		estabelecimento1.setTipoEstabelecimento("Bar");
		
		Estabelecimento estabelecimento2 = new Estabelecimento();
		estabelecimento2.setNomeEstabelecimento("Teste Dois");
		estabelecimento2.setDescricao("É verão o ano todo vem cumpadi. Eita porra!, tá saindo da jaula o monstro! Birl! "  
				+ "Aqui nóis constrói fibra, não é água com músculo. Negativa Bambam negativa. É esse que a gente quer, é ele que nóis vamo buscar.");
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
