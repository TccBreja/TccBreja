package br.com.youbeer.webserverapp.apresentacao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import br.com.youbeer.webserverapp.modelo.Estabelecimento;
import br.com.youbeer.webserverapp.service.IYoubeerService;
import br.com.youbeer.webserverapp.service.YoubeerServiceImpl;

public class CadastrarEstabelecimentoRatificaAction extends ActionBase {

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) {
		
		// Instância do service
    	IYoubeerService service = new YoubeerServiceImpl();
    	
    	int codigoEstabelecimento = 0;
    	
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
					
					if(item.getFieldName().equals("codigoEstabelecimento")){
						codigoEstabelecimento = Integer.parseInt(item.getString());
					}
					
					// Obtém o estabelecimento escolhido
					Estabelecimento estabelecimento = service.buscarPorCodigo(codigoEstabelecimento);
					
					// Verifica se o item não é um campo de form
					if (!item.isFormField()) {
						if (item.getName().length() > 0) {
							String caminhoFoto = this.salvarImagem(item);
							service.inserirFotosEstabelecimento(estabelecimento, item.getFieldName(), caminhoFoto);
							
						}
					}

				}

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return mapping.findForward("sucesso");
	}
	
	/**
    * @param item FileItem, representa um arquivo que é enviado pelo formulario MultiPart/Form-data
    * @return caminho String, caminho para o diretório onde a imagem foi salva 
    * @throws IOException
    */
	private String salvarImagem(FileItem item) throws IOException {
		int nLidos;
	
		// Caminho onde a imagem será armazenada
        String caminho =  getServlet().getServletContext().getRealPath("/") + "estaticos/imagens/uploads";
        File diretorio = new File(caminho);
        
        // Prepara o nome do arquivo
        String nome = item.getName();
        String arq[] = nome.split("\\\\");
        for (int i = 0; i < arq.length; i++) {
            nome = arq[i];
        }   
        
        // Grava o arquivo no diretório informado
        File file = new File(diretorio, nome);
        FileOutputStream output = new FileOutputStream(file);
        InputStream is = item.getInputStream();
        byte[] buffer = new byte[2048];
        while ((nLidos = is.read(buffer)) >= 0) {
            output.write(buffer, 0, nLidos);
        }
        output.flush();
        output.close();  
        
        return file.getAbsolutePath(); 
	}
	
	
	
	
}
