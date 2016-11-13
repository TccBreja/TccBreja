package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Cerveja;
import br.com.youbeer.webserverapp.modelo.Estabelecimento;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

public class SalvarListaCervejaEstabelecimentoAction extends ActionBase{

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
	
		// Instância do service
		IYoubeerService service = new YoubeerServiceImpl();
				
		// Obtém o estabelecimento escolhido
		int codigoEstabelecimento = Integer.parseInt(request.getParameter("codigoEstabelecimento"));
		Estabelecimento estabelecimento = service.buscarPorCodigo(codigoEstabelecimento);
		
		// Limpa a lista de cervejas anteriormente cadastradas
		for (Cerveja cerveja : estabelecimento.getListaCervejas()){
			service.removerCervejaEstabelecimento(estabelecimento, cerveja);
		}
		
		// Obtém a nova lista de cerveja pelo request 
		int index = Integer.parseInt(request.getParameter("index"));
		int quantidadeCervejas = 0;
		
		for (int i=1; i<=index; i++) {
			
			// Obtém os dados do request
			String codCervejaParametro = "listaCervejasSelect" + i;
			String valorCervejaParametro = "valorCerveja" + i;
			int codigoCerveja = Integer.parseInt(request.getParameter(codCervejaParametro));
			String valorCerveja = request.getParameter(valorCervejaParametro);
			valorCerveja = valorCerveja.replaceAll(",", ".");
			
			// Prepara o objeto Cerveja de entrada
			Cerveja cerveja = new Cerveja();
			cerveja.setCodigoCerveja(codigoCerveja);
			cerveja.setValor(valorCerveja);
			
			// Adiciona a cerveja ao cadastro do estabelecimento no banco
			service.inserirCervejaEstabelecimento(estabelecimento, cerveja);
			
			// Atualiza o total de cervejas
			quantidadeCervejas++;
		}
		
		// Atualiza a quantidade de cerveja do estabelecimento
		service.atualizarQuantidadeCervejaEstabelecimento(quantidadeCervejas, codigoEstabelecimento);
		
		// Seta nome do estabelecimento no request
		request.setAttribute("nomeEstabelecimento", estabelecimento.getNomeEstabelecimento());
		
		// Retorno
		return mapping.findForward("sucesso");
	}
}