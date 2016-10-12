package br.com.youbeer.webserverapp.apresentacao;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EnviarEmailServlet extends HttpServlet {

	/** serialVersionUID */
	private static final long serialVersionUID = 1L;
	
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
		
		// Obtém dados do request
		String nome = request.getParameter("nome");
		String sobrenome = request.getParameter("sobrenome");
		String email = request.getParameter("email");
		String fone = request.getParameter("telefone");
		String mensagem = request.getParameter("mensagem");
		
		// Seta MIME type da respota
		response.setContentType("text");
		
		try {
			// Faz as configurações do gmail
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.debug", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.mime.charset", "ISO-8859-1");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			Session session = Session.getDefaultInstance(props);
			
			// Define endereço de destinatario e remetente
			InternetAddress destinatario = new InternetAddress("debegalv@gmail.com");
			InternetAddress remetente = new InternetAddress(email);

			// Define as configurações da mensagem
			MimeMessage message = new MimeMessage(session);
			message.setSentDate(new Date());
			message.setFrom(remetente);
			message.setRecipient(Message.RecipientType.TO, destinatario);
			message.setSubject("Contato do Site");
			message.setContent("Nome: " + nome + " " + sobrenome + "<br>" + "Telefone: " + fone + "<br>"
							+ "Email: " + email + "<br>" + "Mensagem: " + mensagem, "text/html");
			
			// Define as configuração do servidor de e-mail
			Transport transport = session.getTransport("smtp");  
		    transport.connect("smtp.gmail.com","debegalv@gmail.com","debe4664");  
			Transport.send(message);
			transport.close(); 
		
			// Retorna json de sucesso
			response.getWriter().write("{\"retorno\":\"sucesso\"}");	
				
		} catch (MessagingException e) {	
			// Retorna json de erro
			response.getWriter().write("{\"retorno\":\"erro\"}");
		}
	}
}
