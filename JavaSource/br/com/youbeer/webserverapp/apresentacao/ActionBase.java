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
		
		try {
			retorno = executar(mapping, form, request, response);
		} catch (Exception exception) {
			
			retorno = mapping.findForward("erro");
		}

		return retorno;		
	}
	
	protected abstract ActionForward executar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response);
}
