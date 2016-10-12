package br.com.youbeer.webserverapp.apresentacao;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;


/**
 * Servlet respons�vel pela exibi��o das imagens recuperadas do banco.
 * 
 * @since 29/08/2016
 * @version 1.0
 */
public class ExibirImagemServlet extends HttpServlet {

	/** serialVersionUID */
	private static final long serialVersionUID = 8619562248329364934L;
	
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
		response.setContentType("image/png");
		response.setHeader("Cache-Control", "no-cache");
		response.setIntHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
		
		// Obt�m dados do request
		int codigoEstabelecimento = Integer.parseInt((request.getParameter("codigoEstabelecimento")));
		String campoFoto = String.valueOf(request.getParameter("campoFoto"));
		
		// Faz a consulta ao banco
		byte[] imagemStream = service.recuperarFotosEstabelecimento(codigoEstabelecimento, campoFoto);
		
		// Tratamento para estabelecimento sem imagens
		if (imagemStream == null) {
			InputStream stream  = this.getServletContext().getResourceAsStream("/estaticos/imagens/bar_exemplo.jpg");
			imagemStream = IOUtils.toByteArray(stream);	 
		}
		
		// Obt�m output 
		OutputStream out = response.getOutputStream(); 
		out.write(imagemStream); 
        out.flush();  		
	}
}
