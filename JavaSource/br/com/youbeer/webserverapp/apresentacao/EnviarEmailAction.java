package br.com.youbeer.webserverapp.apresentacao;

import java.util.Date;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class EnviarEmailAction extends ActionBase {

	@Override
	protected ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) {

		// Obtém sessão
		HttpSession sessao = request.getSession();

		// Obtém dados do request
		String nome = request.getParameter("nome");
		String sobrenome = request.getParameter("sobrenome");
		String email = request.getParameter("email_form");
		String fone = request.getParameter("fone");
		String mensagem = request.getParameter("mensagem");

		// Validão regex
		Pattern p = Pattern.compile("^[\\w-]+(\\.[\\w-]+)*@([\\w-]+\\.)+[a-zA-Z]{2,7}$");
		Matcher m = p.matcher(email);

		if (!m.find()) {
			sessao.setAttribute("mensagem", "1");
		} else {
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
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}

		}

		return mapping.findForward("sucesso");
	}
}
