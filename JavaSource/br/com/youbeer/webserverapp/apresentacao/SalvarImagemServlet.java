package br.com.youbeer.webserverapp.apresentacao;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;


/**
 * Servlet respons�vel pela exibi��o das imagens recuperadas do banco.
 * 
 * @since 29/08/2016
 * @version 1.0
 */
public class SalvarImagemServlet extends HttpServlet {

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
	 * @throws ServletException 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// Inst�ncia do service
		IYoubeerService service = new YoubeerServiceImpl();
		int codigoEstabelecimento = 0;
		byte[] imagemStream = new byte[0];
		
		// Seta MIME type da respota
		response.setContentType("text");
			
    	// Verifica se o form � do tipo multipart/form-data
		boolean isMultiPart = FileUpload.isMultipartContent(request);

		if (isMultiPart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			try {
				// Obt�m os itens do request
				List items = upload.parseRequest(request);

				// Itera os itens para analisar um a um
				Iterator iter = items.iterator();

				// Prepara cada item de arquivo
				while (iter.hasNext()) {

					FileItem item = (FileItem) iter.next();
					
					if(item.getFieldName().equals("codigoEstabelecimento")){
						codigoEstabelecimento = Integer.parseInt(item.getString());
					} else {
						// Verifica se o item n�o � um campo de formS
						if (item.getName().length() > 0) {
							service.inserirFotosEstabelecimento(codigoEstabelecimento, item);
							String nomeInput = item.getFieldName() + "_div";
							response.getWriter().write("{\"retorno\":\"sucesso\", \"input\":\""+ nomeInput +"\" }");
						}
					}
				}

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}			
	}
}
