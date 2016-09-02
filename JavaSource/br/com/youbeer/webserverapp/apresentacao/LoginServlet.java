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
 * Servlet respons�vel pela verifica��o do login do usu�rio administrador.
 * 
 * @since 29/08/2016
 * @version 1.0
 */
public class LoginServlet extends HttpServlet {
	
	/** serialVersionUID*/
	private static final long serialVersionUID = -3925915729863325066L;

	/**
	 * M�todo respons�vel pelas requisi��es e resposta da p�gina JSP.<br>
	 * 
	 * @param request
	 *            requisi��o da p�gina JSP.
	 * @param response
	 *            resposta para a p�gina JSP.
	 * @throws ServletException
	 *             ServletException
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		this.doPost(request, response);
	}

	/**
	 * Nome: doPost <br>
	 * Prop�sito: Processa a requisi��o da p�gina de login, e executa a aplica��o <br>
	 * Par�metros:
	 * 
	 * @param request
	 *            (HttpServletRequest, entrada, obrigat�rio)
	 * @param response
	 *            (HttpServletResponse, entrada, obrigat�rio) Tratamento de Exce��o:
	 * @throws IOException
	 *             - Caso ocorra alguma exce��o
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// Inst�ncia do service
		IYoubeerService service = new YoubeerServiceImpl();
		// Seta MIME type da respota
		response.setContentType("text");
		
		// Obt�m dados do request
		String username = String.valueOf(request.getParameter("username"));
		String senhaEntrada = String.valueOf(request.getParameter("password"));
		
		// Prepara o objeto de entrada
		Admin admin = new Admin();
		admin.setUsername(username);
		
		// Verifica pelo username se o admin est� cadastrado no banco
		if (service.isExisteAdmin(admin)) {		
			// Faz a requisi��o dos dados ao banco
			admin = service.obterDadosAdmin(admin);
			
			// Faz a verifica��o com os dados obtidos
			if(StringUtils.equals(senhaEntrada, admin.getPassword())){
				
				// Coloca o nome do usu�rio na sess�o
				request.getSession().setAttribute("username", username);
				
				// Retorna json de acesso
				response.getWriter().write("{\"retorno\":\"acessoPermitido\"}");	
			} else {
				// Retorna json de dados inv�lidos
				response.getWriter().write("{\"retorno\":\"erroSenhaInvalida\"}");
			}	
			
		} else {
			// Retorna json de admin n�o encontrado
			response.getWriter().write("{\"retorno\":\"erroUsuarioInvalido\"}");
		}
			
	}
}
