package br.com.youbeer.webserverapp.apresentacao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public abstract class ActionBase extends Action {
	public final ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno;
		retorno = executar(mapping, form, request, response);
		
		return retorno;
		
	}
	
	protected abstract ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response);
}
