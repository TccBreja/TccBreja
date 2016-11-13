package br.com.youbeer.webserverapp.append.beer;

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

import br.com.youbeer.webserverapp.modelo.Cerveja;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

public class CadastrarCervejaBancoServlet extends HttpServlet {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 8619562248329364934L;
	
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
	 * @throws ServletException 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String nomeCerveja = "";
		String descricaoCerveja = "";
		String tipoCerveja = "";
		String teorAlcoolico = "";
		String volumeLiquido = "";
		
		// Instância do service
		IYoubeerService service = new YoubeerServiceImpl();
		byte[] imagemStream = new byte[0];
		
		// Seta MIME type da respota
		response.setContentType("text");
			
    	// Verifica se o form é do tipo multipart/form-data
		boolean isMultiPart = FileUpload.isMultipartContent(request);

		if (isMultiPart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			try {
				// Obtém os itens do request
				List items = upload.parseRequest(request);

				// Itera os itens para analisar um a um
				Iterator iter = items.iterator();

				// Prepara cada item de arquivo
				while (iter.hasNext()) {

					FileItem item = (FileItem) iter.next();
					
					if(!item.getFieldName().equals("fotoCerveja")){
				
						if(item.getFieldName().equals("nomeCerveja")){
							nomeCerveja = item.getString();
						}
						
						if(item.getFieldName().equals("descricaoCerveja")){
							descricaoCerveja = item.getString();	
						}
	
						if(item.getFieldName().equals("tipoCerveja")){
							tipoCerveja = item.getString();
						}
	
						if(item.getFieldName().equals("teorAlcoolico")){
							teorAlcoolico = item.getString();
						}
	
						if(item.getFieldName().equals("volumeLiquido")){
							volumeLiquido = item.getString();
						}
						
						
					} else {
						// Verifica se o item não é um campo de formS
						if (item.getName().length() > 0) {
							
							Cerveja cerveja = new Cerveja();
							cerveja.setNomeCerveja(nomeCerveja);
							cerveja.setDescricao(descricaoCerveja);
							cerveja.setTipo(tipoCerveja);
							cerveja.setTeorAlcool(teorAlcoolico);
							cerveja.setVolumeLiquido(volumeLiquido);
							
							service.cadastrarCervejaBanco(cerveja, item);
							
							response.getWriter().write("{\"retorno\":\"sucesso\"}");
						}
					}
				}

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}			
	}



}
