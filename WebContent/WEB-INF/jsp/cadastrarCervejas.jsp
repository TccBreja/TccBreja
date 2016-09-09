<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="java.util.List"%>
<%@page import="br.com.youbeer.webserverapp.modelo.Cerveja" %>
<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>

<link href="estaticos/css/cadastrarCervejas.css" rel="stylesheet">

<style>
	#titulo { background-color: #df8e01!important; }
	.erro {border-color: a94442; box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px red }
</style>

<% 
	// Index para organizar os elementos da lista
	int index = 0;
%>

<script>
	$(document).ready(function(){
		//Mascara os valores em real da aplica��o
		$(function(){
			 $(".dinheiro").maskMoney({symbol:'', 
			showSymbol:true, thousands:'.', decimal:',', symbolStay: true});
		 });
	});	
	
	// Faz o submit no form
	function submitForm(){	
			
		resultado = verificarCampos();
		
		if(resultado){
			$("#salvarListaCervejaForm").submit();	
		}
		
		return resultado;
	}
	
	// Desabilita o option ap�s escolhido
	function desabilitaOption(option){
		option.closest('select').disabled = true;
	}
	
	// Valida os campos de entrada
	function verificarCampos(){
		var	mensagemCampoObrigatorio = "Campo(s) obrigat�rio(s)";
			retorno = true;
		
		$("#salvarListaCervejaForm").find('input[type=text]').each(function() {
			if(this.value == ""){
				exibirErros(this.name, mensagemCampoObrigatorio);
				retorno = false;
			}
			
		});
		
		return retorno;
	}
	
	// Exibe as mensagens de erro
	function exibirErros(campoErro, mensagem){
		
		var campoErro = document.getElementsByName(campoErro);
		
		$(campoErro).addClass('erro');
		$(campoErro).parent().addClass('erro');
		//$("#mensagemErro").text(mensagem);
		//$("#mensagemErro").css('display','block');
	}
	
</script>

<form id="salvarListaCervejaForm" name="salvarListaCervejaForm" action="salvarListaCervejaForm">
	<div class="container pt50 pb10 fundoHome">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default panel-table">
					<div class="panel-heading" id="titulo">
						<div class="row">
							<div class="col col-xs-12" >
								<h1 class="panel-title">Lista de Cervejas</h1>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									<th><em class="fa fa-cog"></em></th>
									<th class="hidden-xs">Nome - Volume l�quido - Tipo</th>
									<th>Valor R$</th>
								</tr> 
							</thead>
							<tbody id="tratamentoListaAdd">
								<logic:notEmpty name="listaCervejasEstabelecimento">						
									<logic:iterate id="listaCervejasEstabelecimento" name="listaCervejasEstabelecimento">
										<% 	// Atualiza index
											index++;
										%>	
										<tr>
											<td align="center">
												<a class="btn btn-danger deletavel"><em class="fa fa-trash"></em></a>
											</td>
											<td class="hidden-xs">
												<select id="listaCervejasSelect" name="listaCervejasSelect<%=index%>" class="form-control" disabled>
													<option value="<bean:write name="listaCervejasEstabelecimento" property="codigoCerveja"/>"> 	
														<bean:write name="listaCervejasEstabelecimento" property="nomeCerveja"/> - 
														<bean:write name="listaCervejasEstabelecimento" property="tipo"/> : 
														<bean:write name="listaCervejasEstabelecimento" property="volumeLiquido"/>mL			
													</option>	
												</select>
											</td>
											<td>
												<div class="input-group">
													<div class="input-group-addon">$</div>
													<input type="text" name="valorCerveja<%=index%>" class="form-control dinheiro" value="<bean:write name="listaCervejasEstabelecimento" property="valor"/>">
												</div>
											</td>
										</tr>				
									</logic:iterate>
								</logic:notEmpty>
								<logic:empty name="listaCervejasEstabelecimento">
									<tr>
										<td align="center">
											<a class="btn btn-danger"><em class="fa fa-trash"></em></a>
										</td>
										<td class="hidden-xs">
											<select id="listaCervejasSelect" name="listaCervejasSelect<%=index%>" class="form-control">
												<logic:iterate id="listaCervejasBanco" name="listaCervejasBanco">
													<option value="<bean:write name="listaCervejasBanco" property="codigoCerveja"/>">
																   <bean:write name="listaCervejasBanco" property="nomeCerveja"/> -
																   <bean:write name="listaCervejasBanco" property="tipo"/> :
																   <bean:write name="listaCervejasBanco" property="volumeLiquido"/>mL	
													</option>
												</logic:iterate>
											</select>
										</td>
										<td>
											<div class="input-group">
												<div class="input-group-addon">$</div>
												<input type="text" name="valorCerveja<%=index%>" class="form-control dinheiro">
											</div>
										</td>
									</tr>
								</logic:empty>
							
							</tbody>
						</table>
						<div class="col col-xs-1 text-left pt10 pb10">
							<button type="button" class="btn btn-success" id="adicionarCerveja">
								<p>Adicionar Cerveja</p>
							</button>
						</div>		
						<div class="col col-xs-1 text-left pt10 pb10" style="float: right;">
							<button type="button" class="btn btn-success" id="btnSalvar" onclick="submitForm();" style="width: 138px; float: right;">
								<p>Salvar</p>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<input type="hidden" id="index" name="index" value="<%=index%>">
</form>

<script>
	//Adiciona uma linha de cerveja na tabela
	$("#adicionarCerveja").click(function(){
		
		// Obt�m index
		var options = "";
			index = $("#index").val();
							
		<% 	
			// Cria os options
			List<Cerveja> cervejas = (List) request.getAttribute("listaCervejasBanco");
				for (Cerveja cerveja : cervejas) {
		%>			 
					options = options + "<option value='" +  "<%=cerveja.getCodigoCerveja()%>" + "'>" + "<%=cerveja.getNomeCerveja()%>" + " - " + "<%=cerveja.getTipo()%>" + " : " 
									  + "<%=cerveja.getVolumeLiquido()%>" + "mL" + "</option>"
		
		<%
	           	}
	     %>
		
	    // Atualiza o index 
	    index++;
	    
	    // Cria o apend
		var appendLinha = "<tr><td align='center'><a class='btn btn-danger deletavel'><em class='fa fa-trash'>"
						+ "</em></a></td><td class='hidden-xs'>"
						+ "<select id='listaCervejasSelect' name='listaCervejasSelect" + index + "' class='form-control' onchange='desabilitaOption(this)'>"
						+  options	
						+ "</select></td><td><div class='input-group'><div class='input-group-addon'>$</div>"
						+ "<input type='text' name='valorCerveja" + index +"' class='form-control dinheiro'></div></td></tr>"
		
		// Adiciona linha
	    $("#tratamentoListaAdd").append(appendLinha);
						
		// Atualiza o valor do index no form
		$("#index").val(index);
						
		// Mascara os valores em real do campo valor
		$(".dinheiro").maskMoney({symbol:'', 
			showSymbol:true, thousands:'.', decimal:',', symbolStay: true});
	});
	
	//Remove uma linha de cerveja da tabela 
	$("#tratamentoListaAdd").delegate('.deletavel','click', function(){
		
		// Obtem index
		var index = $("#index").val();
		
		// Atualiza o index 
	    index--;
	
		// Remove a linha
		this.closest('tr').remove();
		
		// Atualiza o valor do index no form
		$("#index").val(index);
	});
</script>


