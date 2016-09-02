package br.com.youbeer.webserverapp.apresentacao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import br.com.youbeer.webserverapp.modelo.Admin;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

/**
 * Servlet responsável pela verificação do login do usuário administrador.
 * 
 * @since 29/08/2016
 * @version 1.0
 */
public class LoginServlet extends HttpServlet {
	
	/** serialVersionUID*/
	private static final long serialVersionUID = -3925915729863325066L;

	/**
	 * Método responsável pelas requisições e resposta da página JSP.<br>
	 * 
	 * @param request
	 *            requisição da página JSP.
	 * @param response
	 *            resposta para a página JSP.
	 * @throws ServletException
	 *             ServletException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		this.doPost(request, response);
	}

	/**
	 * Nome: doPost <br>
	 * Propósito: Processa a requisição da página de login, e executa a aplicação <br>
	 * Parâmetros:
	 * 
	 * @param request
	 *            (HttpServletRequest, entrada, obrigatório)
	 * @param response
	 *            (HttpServletResponse, entrada, obrigatório) Tratamento de Exceção:
	 * @throws IOException
	 *             - Caso ocorra alguma exceção
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// Instância do service
		IYoubeerService service = new YoubeerServiceImpl();
		// Seta MIME type da respota
		response.setContentType("text");
		
		// Obtém dados do request
		String username = String.valueOf(request.getParameter("username"));
		String senhaEntrada = String.valueOf(request.getParameter("password"));
		
		// Prepara o objeto de entrada
		Admin admin = new Admin();
		admin.setUsername(username);
		
		// Verifica pelo username se o admin está cadastrado no banco
		if (service.isExisteAdmin(admin)) {		
			// Faz a requisição dos dados ao banco
			admin = service.obterDadosAdmin(admin);
			
			// Faz a verificação com os dados obtidos
			if(StringUtils.equals(senhaEntrada, admin.getPassword())){
				
				// Coloca o nome do usuário na sessão
				request.getSession().setAttribute("username", username);
				
				// Retorna json de acesso
				response.getWriter().write("{\"retorno\":\"acessoPermitido\"}");	
			} else {
				// Retorna json de dados inválidos
				response.getWriter().write("{\"retorno\":\"erroSenhaInvalida\"}");
			}	
			
		} else {
			// Retorna json de admin não encontrado
			response.getWriter().write("{\"retorno\":\"erroUsuarioInvalido\"}");
		}
			
	}
}
