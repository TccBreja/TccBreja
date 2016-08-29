<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>
<%@ page import="br.com.youbeer.webserverapp.modelo.Estabelecimento" %>

<script>
$(document).ready(function(){
	<%Estabelecimento estabelecimento = (Estabelecimento)request.getAttribute("estabelecimento"); %>
	
	//seta os valores vindos do banco nos seus camposs=
	$("#nomeEstabelecimento").val("<%=estabelecimento.getNomeEstabelecimento()%>");
	$("#endereco").val("<%=estabelecimento.getEndereco()%>");
	$("#site").val("<%=estabelecimento.getSite()%>");
	$("#telefone").val("<%=estabelecimento.getTelefone()%>");
	$("#descricao").val("<%=estabelecimento.getDescricao()%>");
	
	//Limpa a validação
	$("#nomeEstabelecimento").keydown(function() {
		removeErro($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoWarning"), $("#nomeEstabelecimentoWarningMensage"));
		if($("#nomeEstabelecimento").val() != ''){
			removeSuccess($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoSuccess"));
		}
	});
	
	$("#nomeEstabelecimento").blur(function() {
		removeErro($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoWarning"), $("#nomeEstabelecimentoWarningMensage"));
		if($("#nomeEstabelecimento").val() != ''){
			removeSuccess($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoSuccess"));
		}
	});
	
	$("#endereco").keydown(function() {
		removeErro($("#divEndereco"), $("#divEnderecoWarning"), $("#enderecoWarningMensage"));
		if($("#endereco").val() != ''){
			removeSuccess($("#divEndereco"), $("#divEnderecoSuccess"));
		}
	});
	
	$("#endereco").blur(function() {
		removeErro($("#divEndereco"), $("#divEnderecoWarning"), $("#enderecoWarningMensage"));
		if($("#endereco").val() != ''){
			removeSuccess($("#divEndereco"), $("#divEnderecoSuccess"));
		}
	});
	$("#site").keydown(function() {
		removeErro($("#divSite"), $("#divSiteWarning"), $("#siteWarningMensage"));
		if($("#site").val() != ''){
			removeSuccess($("#divSite"), $("#divSiteSuccess"));
		}
	});
	
	$("#site").blur(function() {
		removeErro($("#divSite"), $("#divSiteWarning"), $("#siteWarningMensage"));
		if($("#site").val() != ''){
			removeSuccess($("#divSite"), $("#divSiteSuccess"));
		}
	});
	$("#telefone").keydown(function() {
		removeErro($("#divTelefone"), $("#divTelefoneWarning"), $("#telefoneWarningMensage"));
		if($("#telefone").val() != ''){
			removeSuccess($("#divTelefone"), $("#divTelefoneSuccess"));
		}
	});
	
	$("#telefone").blur(function() {
		removeErro($("#divTelefone"), $("#divTelefoneWarning"), $("#telefoneWarningMensage"));
		if($("#telefone").val() != ''){
			removeSuccess($("#divTelefone"), $("#divTelefoneSuccess"));
		}
	});
	$("#descricao").keydown(function() {
		removeErro($("#divDescricao"), $("#divDescricaoWarning"), $("#descricaoWarningMensage"));
		if($("#descricao").val() != ''){
			removeSuccess($("#divDescricao"), $("#divDescricaoSuccess"));
		}
	});
	
	$("#descricao").blur(function() {
		removeErro($("#divDescricao"), $("#divDescricaoWarning"), $("#descricaoWarningMensage"));
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
			addErro($("#divNomeEstabelecimento"), $("#divNomeEstabelecimentoWarning"), $("#nomeEstabelecimentoWarningMensage"));
		}
		//Verifica o endereco
		if($("#endereco").val() != ''){
			addSuccess($("#divEndereco"), $("#divEnderecoSuccess"));
		}else if($("#endereco").val() === ''){
			retorno = false;
			addErro($("#divEndereco"), $("#divEnderecoWarning"), $("#enderecoWarningMensage"));
		}
		//Verifica site
		if($("#site").val() != ''){
			addSuccess($("#divSite"), $("#divSiteSuccess"));
		}else if($("#site").val() === ''){
			retorno = false;
			addErro($("#divSite"), $("#divSiteWarning"), $("#siteWarningMensage"));
		}
		//Verifica telefone
		if($("#telefone").val() != ''){
			addSuccess($("#divTelefone"), $("#divTelefoneSuccess"));
		}else if($("#telefone").val() === ''){
			retorno = false;
			addErro($("#divTelefone"), $("#divTelefoneWarning"), $("#telefoneWarningMensage"));
		}
		//Verifica descricao
		if($("#descricao").val() != ''){
			addSuccess($("#divDescricao"), $("#divDescricaoSuccess"));
		}else if($("#descricao").val() === ''){
			retorno = false;
			addErro($("#divDescricao"), $("#divDescricaoWarning"), $("#descricaoWarningMensage"));
		}
		if(retorno){
			$("#adicionarFotosEstabelecimentoForm").submit();
		}
		return retorno;
	});
	
	function addErro(idDivError, idDivInternaErro, idMensageErro){
		idDivError.addClass("has-error");
		idDivError.addClass("has-feedback");
		idDivInternaErro.removeClass("notVisible");
		idMensageErro.text('Campo obrigatório');
	}
	
	function addSuccess(idDivSucess, idDivInternaSucess){
		idDivSucess.addClass("has-success");
		idDivSucess.addClass("has-feedback");
		idDivInternaSucess.removeClass("notVisible");
	}
	
	function removeErro(idDivError, idDivInternaErro, idMensageErro){
		idDivError.removeClass("has-error");
		idDivInternaErro.addClass("notVisible");
		idMensageErro.text('');
	}
	
	function removeSuccess(idDivSucess, idDivInternaSucess){
		idDivSucess.removeClass("has-success");
		idDivInternaSucess.addClass("notVisible");
	}
});
</script>
<div class="container pt50 pb10 fundoHome">
    <div class="row">
		<form class="form-horizontal pr300" action="adicionarFotosEstabelecimento.do" id="adicionarFotosEstabelecimentoForm">
		<input type='hidden' name="controleMenu" id="controleMenu" value="cadastrarEstabelecimento"/>
			<fieldset>
			
			<!-- Text input nome do estabelecimento-->
			<div class="form-group" id="divNomeEstabelecimento">
			  <label class="col-md-4 control-label" for="nomeEstabelecimento" id="nomeEstabelecimentoWarningMensage"></label>  
			  <div class="col-md-8">
			  <input id="nomeEstabelecimento" name="nomeEstabelecimento" type="text" placeholder="Nome do Estabelecimento" class="form-control input-md">
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
			<div class="form-group" id="divEndereco">
			  <label class="col-md-4 control-label" for="endereco" id="enderecoWarningMensage"></label>  
			  <div class="col-md-8">
			  <input id="endereco" name="endereco" type="text" placeholder="Endereço Completo" class="form-control input-md" >
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
			<div class="form-group" id="divSite">
			  <label class="col-md-4 control-label" for="site" id="siteWarningMensage"></label>  
			  <div class="col-md-8">
			  <input id="site" name="site" type="text" placeholder="Site do Estabelecimento" class="form-control input-md">
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
			<div class="form-group" id="divTelefone">
			  <label class="col-md-4 control-label" for="telefone" id="telefoneWarningMensage"></label>  
			  <div class="col-md-5">
			  <input id="telefone" name="telefone" type="text" placeholder="Telefone" class="form-control input-md">
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
			
			<!-- Select Basic horario de abertura -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="horarioAbertura"></label>
			  <div class="col-md-5">
			    <select id="horarioAbertura" name="horarioAbertura" class="form-control">
			      <option value="0000">Horario Abertura - 00:00</option>
			      <option value="0030">Horario Abertura - 00:30</option>
			    </select>
			  </div>
			</div>
			
			<!-- Select Basic horario de fechamento-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="horarioFechamento"></label>
			  <div class="col-md-5">
			    <select id="horarioFechamento" name="horarioFechamento" class="form-control">
			      <option value="0000">Horario Fechamento - 00:00</option>
			      <option value="0030">Horario Fechamento - 00:30</option>
			    </select>
			  </div>
			</div>
			
			
			<!-- Textarea -->
			<div class="form-group" id="divDescricao">
			  <label class="col-md-4 control-label" for="descricao" id="descricaoWarningMensage"></label>
			  <div class="col-md-5">                     
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
			
			<!-- Button -->
			<div class="form-group" style="float:right;">
			  <label class="col-md-4 control-label" for="btnConfirma"></label>
			  <div class="col-md-4">
			    <button id="btnConfirma" name="btnConfirma" class="btn btn-warning btn-lg">Confirmar</button>
			  </div>
			</div>
			
			</fieldset>
		</form>
	</div>
</div>
