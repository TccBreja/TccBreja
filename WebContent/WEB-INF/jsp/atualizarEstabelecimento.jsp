<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>
<%@ page import="br.com.youbeer.webserverapp.modelo.Estabelecimento" %>

<script>
$(document).ready(function(){
	
	// Obtém o estabelecimento
	<%Estabelecimento estabelecimento = (Estabelecimento)request.getAttribute("estabelecimento"); %>
	
	// Seta os valores vindos do banco nos seus campos
	$("#nomeEstabelecimento").val("<%=estabelecimento.getNomeEstabelecimento()%>");
	$("#endereco").val("<%=estabelecimento.getEndereco()%>");
	$("#site").val("<%=estabelecimento.getSite()%>");
	$("#telefone").val("<%=estabelecimento.getTelefone()%>");
	$("#descricao").val("<%=estabelecimento.getDescricao()%>");
	
	// Habilita timepicker
	$('.form-control.input-small').timepicker({
		showMeridian: false,
		minuteStep: 10
	});
	 
	// Input masks
	$("#telefone").mask("(99) 9999-9999"); 
	
	//Limpa a validação
	$("#nomeEstabelecimento").keydown(function() {
		removeErro($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoWarning"), $("#nomeEstabelecimento"));
		if($("#nomeEstabelecimento").val() != ''){
			removeSuccess($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoSuccess"));
		}
	});
	
	$("#nomeEstabelecimento").blur(function() {
		removeErro($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoWarning"), $("#nomeEstabelecimento"));
		if($("#nomeEstabelecimento").val() != ''){
			removeSuccess($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoSuccess"));
		}
	});
	
	$("#endereco").keydown(function() {
		removeErro($("#divEndereco"), $("#divEnderecoWarning"), $("#endereco"));
		if($("#endereco").val() != ''){
			removeSuccess($("#divEndereco"), $("#divEnderecoSuccess"));
		}
	});
	
	$("#endereco").blur(function() {
		removeErro($("#divEndereco"), $("#divEnderecoWarning"), $("#endereco"));
		if($("#endereco").val() != ''){
			removeSuccess($("#divEndereco"), $("#divEnderecoSuccess"));
		}
	});
	$("#site").keydown(function() {
		$("#site").closest('div').siblings().find('span').remove();
		removeErro($("#divSite"), $("#divSiteWarning"), $("#site"));
		if($("#site").val() != ''){
			removeSuccess($("#divSite"), $("#divSiteSuccess"));
		}
	});
	
	$("#site").blur(function() {
		$("#site").closest('div').siblings().find('span').remove();
		removeErro($("#divSite"), $("#divSiteWarning"), $("#site"));
		if($("#site").val() != ''){
			removeSuccess($("#divSite"), $("#divSiteSuccess"));
		}
	});
	$("#telefone").keydown(function() {
		removeErro($("#divTelefone"), $("#divTelefoneWarning"), $("#telefone"));
		if($("#telefone").val() != ''){
			removeSuccess($("#divTelefone"), $("#divTelefoneSuccess"));
		}
	});
	
	$("#telefone").blur(function() {
		removeErro($("#divTelefone"), $("#divTelefoneWarning"), $("#telefone"));
		if($("#telefone").val() != ''){
			removeSuccess($("#divTelefone"), $("#divTelefoneSuccess"));
		}
	});
	$("#descricao").keydown(function() {
		removeErro($("#divDescricao"), $("#divDescricaoWarning"), $("#descricao"));
		if($("#descricao").val() != ''){
			removeSuccess($("#divDescricao"), $("#divDescricaoSuccess"));
		}
	});
	
	$("#descricao").blur(function() {
		removeErro($("#divDescricao"), $("#divDescricaoWarning"), $("#descricao"));
		if($("#descricao").val() != ''){
			removeSuccess($("#divDescricao"), $("#divDescricaoSuccess"));
		}
	});
	
	//Validação do botão de envio
	//Quando é clicado o botão do estabelecimento é chamado essa action
	$("#btnConfirma").click(function() {
		
		var retorno = true;
		
		//Verifica o nome do estabelecimento
		if($("#nomeEstabelecimento").val() != ''){
			addSuccess($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoSuccess"));
		}else if($("#nomeEstabelecimento").val() === ''){
			retorno = false;
			addErro($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoWarning"), $("#nomeEstabelecimento"));
		}
		//Verifica o endereco
		if($("#endereco").val() != ''){
			addSuccess($("#divEndereco"), $("#divEnderecoSuccess"));
		}else if($("#endereco").val() === ''){
			retorno = false;
			addErro($("#divEndereco"), $("#divEnderecoWarning"), $("#endereco"));
		}
		//Verifica site
		if($("#site").val() != ''){
			retorno = validaURL($("#site").val());
			if (retorno) {
				$("#site").closest('div').siblings().find('span').remove();
				addSuccess($("#divSite"), $("#divSiteSuccess"));
			}  else {
				$("#site").closest('div').siblings().append("<span class='erro'>&nbsp(Formato inválido)</span>")
				addErro($("#divSite"), $("#divSiteWarning"), $("#site"));
			}	
		}else if($("#site").val() === ''){
			retorno = false;
			addErro($("#divSite"), $("#divSiteWarning"), $("#site"));
		}
		//Verifica telefone
		if($("#telefone").val() != ''){
			addSuccess($("#divTelefone"), $("#divTelefoneSuccess"));
		}else if($("#telefone").val() === ''){
			retorno = false;
			addErro($("#divTelefone"), $("#divTelefoneWarning"), $("#telefone"));
		}
		//Verifica descricao
		if($("#descricao").val() != ''){
			addSuccess($("#divDescricao"), $("#divDescricaoSuccess"));
		}else if($("#descricao").val() === ''){
			retorno = false;
			addErro($("#divDescricao"), $("#divDescricaoWarning"), $("#descricao"));
		}
		if(retorno){
			$("#adicionarFotosEstabelecimentoForm").submit();
		}
		return retorno;
	});
	
	// Adiciona as mensagens de erros e classes
	function addErro(idDivError, idDivInternaErro, idMensageErro){
		idDivError.addClass("has-error");
		idDivError.addClass("has-feedback");
		idDivError.siblings().addClass("erro");
		idDivInternaErro.removeClass("notVisible");
		idMensageErro.attr('placeholder','Campo obrigatório');
	}
	
	// Adiciona as classes de sucesso
	function addSuccess(idDivSucess, idDivInternaSucess){
		idDivSucess.addClass("has-success");
		idDivSucess.addClass("has-feedback");
		idDivInternaSucess.removeClass("notVisible");
	}
	
	// Limpa os erros
	function removeErro(idDivError, idDivInternaErro, idMensageErro){
		idDivError.removeClass("has-error");
		idDivError.siblings().removeClass("erro");
		idDivInternaErro.addClass("notVisible");
		if (idMensageErro.attr('id') == 'nomeEstabelecimento') {
			idMensageErro.attr('placeholder','Insira aqui o nome do estabelecimento');
		} else if (idMensageErro.attr('id') == 'endereco') {
			idMensageErro.attr('placeholder','Insira aqui o endereço completo');
		} else if (idMensageErro.attr('id') == 'site'){
			idMensageErro.attr('placeholder','Insira aqui o site do Estabelecimento');
		} else if (idMensageErro.attr('id') == 'telefone'){
			idMensageErro.attr('placeholder','(XX)XXXX-XXXX');
		} else if (idMensageErro.attr('id') == 'horarioAbertura' ){
			idMensageErro.attr('placeholder','Insira aqui o horário de abertura');
		} else if (idMensageErro.attr('id') == 'horarioFechamento'){
			idMensageErro.attr('placeholder','Insira aqui o horário de fechamento');
		} else if (idMensageErro.attr('id') == 'descricao'){
			idMensageErro.attr('placeholder','Descrição do estabelecimento');
		} 
	}
	
	// Limpa as classes de sucesso
	function removeSuccess(idDivSucess, idDivInternaSucess){
		idDivSucess.removeClass("has-success");
		idDivInternaSucess.addClass("notVisible");
	}
		
	// Faz a verificação se o site digitado é valido
	function validaURL(URL){
		var expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
			regex = new RegExp(expression);
			retorno = false;
		
		if (URL.match(regex)) {
		  retorno = true;
		} 		
		return retorno;
	}	
});
</script>

<style>
	label {font-family: 'Rock Salt', cursive; font-size: 14px;}	
	.erro {color: #a94442;}
	.has-error {border-color: a94442; box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px red;}
</style>

<div class="container pt50 pb10 fundoHome" style="text-align: left !important; padding-right: 240px !important; padding-left: 240px !important; ">
	<div class="title" style="text-align: center; margin-bottom: 40px;">Insira os dados do estabelecimento a ser cadastrado</div>
	<form action="adicionarFotosEstabelecimento.do" id="adicionarFotosEstabelecimentoForm" method="post">
		<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
		<input type='hidden' name="controleCerveja" id="controleCerveja" value="atualizarEstabelecimento"/>
		<input type='hidden' name="codigoEstabelecimento" value="<%=request.getParameter("codigoEstabelecimento")%>" />
		<fieldset>
			<!-- Text input nome do estabelecimento-->
			<div class="form-group">
			  <label for="nomeEstabelecimento">Nome do Estabelecimento</label>  
			  <div id="divNomeEstabelecimento">
			 	  <input id="nomeEstabelecimento" name="nomeEstabelecimento" type="text" placeholder="Insira aqui o nome do estabelecimento" class="form-control">
			      <div class="notVisible" id="divNomeEstabelecimentoSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
  				  </div>
  			      <div class="notVisible" id="divNomeEstabelecimentoWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
  					<span id="inputError2Status" class="sr-only">(error)</span>
  				  </div>
			  </div>
			</div>
			
			<!-- Text input endereço-->
			<div class="form-group"> 
			  <label for="endereco">Endereço</label>  
			  <div id="divEndereco">
			  	<input id="endereco" name="endereco" type="text" placeholder="Insira aqui o endereço completo" class="form-control" >
				<div class="notVisible" id="divEnderecoSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="notVisible" id="divEnderecoWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
					<span id="inputError2Status" class="sr-only">(error)</span>
				</div> 
			  </div>
			</div>
			
			<!-- Text input site-->
			<div class="form-group">
			  <label  for="site">Site</label>  
			  <div id="divSite">
			  <input id="site" name="site" type="text" placeholder="Insira aqui o site do Estabelecimento" class="form-control">
			    <div class="notVisible" id="divSiteSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="notVisible" id="divSiteWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
					<span id="inputError2Status" class="sr-only">(error)</span>
				</div> 
			  </div>
			</div>
			
			<!-- Text input telefone -->
			<div class="form-group">
			  <label  for="telefone">Telefone</label>  
			  <div id="divTelefone">
			  	<input id="telefone" name="telefone" type="text" placeholder="(XX)XXXX-XXXX" class="form-control">
			    <div class="notVisible" id="divTelefoneSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="notVisible" id="divTelefoneWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
					<span id="inputError2Status" class="sr-only">(error)</span>
				</div> 
			  </div>
			</div>
			
			<table style="border:none;width: 100%;">
  				<tr>
   					<th style="width: 60%;">
   						<!-- Select Basic tipo do estabelecimento -->
						<div class="form-group">
						  <label  for="tipoEstabelecimento">Tipo do Estabelecimento</label>
						  <div>
						    <select id="tipoEstabelecimento" name="tipoEstabelecimento" class="form-control">
						      <option value="bar">Bar</option>
						      <option value="balada">Balada</option>
						      <option value="conveniencia">Conveniência</option>
						      <option value="mercado">Mercado</option>
						    </select>
						  </div>
						</div>
						
						<!-- Text input horario de abertura -->	
						<div class="form-group">
						  <label  for="horarioAbertura">Horário Abertura</label>
						  <div class="input-group bootstrap-timepicker timepicker">
						  	<input id="horarioAbertura" name="horarioAbertura" type="text" class="form-control input-small">
						  	<span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
					   	   	<div class="notVisible" id="horarioAberturaSuccess">
								<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="inputSuccess2Status" class="sr-only">(success)</span>
							</div>
							<div class="notVisible" id="horarioAberturaWarning">
								<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div>
						  </div>
						</div>
						
						<!-- Text input horario de fechamento -->
						<div class="form-group">
						  <label  for="horarioFechamento">Horário Fechamento</label>
						  <div class="input-group bootstrap-timepicker timepicker">
						  	<input id="horarioFechamento" name="horarioFechamento" type="text" class="form-control input-small">
						  	<span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
					   	   	<div class="notVisible" id="horarioFechamentoSuccess">
								<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="inputSuccess2Status" class="sr-only">(success)</span>
							</div>
							<div class="notVisible" id="horarioFechamentoaWarning">
								<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div>
						  </div>
						</div>
						
						<!-- Textarea -->
						<div class="form-group"> 
						  <label  for="descricao">Descrição</label>
						  <div id="divDescricao">                     
						    <textarea class="form-control" id="descricao" name="descricao" placeholder="Descrição do estabelecimento" rows="5"></textarea>
						     <div class="notVisible" id="divTelefoneSuccess">
								<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="inputSuccess2Status" class="sr-only">(success)</span>
							</div>
							<div class="notVisible" id="divTelefoneWarning">
								<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div> 
						  </div>
						</div>
   				 	</th>
    				<th style="width: 40%;">
    					<img src="estaticos/imagens/caneca_cerveja.png" style="height: 50%; padding-left: 20px;">
    				</th>
					</tr>
			</table>	
		</fieldset>
		<!-- Button -->
		<div class="form-group" style="float:right;">
		  <label  for="btnConfirma"></label>
		  <div class="col-sm-2">
		    <button id="btnConfirma" name="btnConfirma" class="btn btn-warning btn-lg">Confirmar</button>
		  </div>
		</div>
	</form>
</div>