<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="java.util.List"%>
<jsp:include page="../common/cabecalhoMenu.jsp"></jsp:include>
<script type="text/javascript" src="estaticos/js/bootstrap-filestyle.min.js"> </script>

<link href="estaticos/css/cadastrarCervejas.css" rel="stylesheet">

<script>
$(document).ready(function() {
	// Salva a imagem no banco no momento do onchange
	$('input[type="file"]').on('change', uploadFile);
})


// Função que faz o upload dos arquivos
function uploadFile(event){
    event.stopPropagation(); 
    event.preventDefault(); 
    var files = event.target.files; 
    	data = new FormData();
   
    // Prepara form de arquivo
    data.append("nomeCerveja",$('#nomeCerveja').val());	
    data.append("descricaoCerveja",$('#descricao').val());	
    data.append("tipoCerveja",$('#tipoCerveja').val());	
    data.append("teorAlcoolico",$('#teorAlcoolico').val());	
    data.append("volumeLiquido",$('#volumeLiquido').val());	
 	   
    $.each(files, function(key, value){
        data.append(event.target.name, value);
    });
    
    // Chama função ajax
    postFilesData(data); 
 }

// Ajax que direciona para a servlet de salvar imagem
function postFilesData(data){
	$.ajax({
	url:'/WebServerApp/CadastrarCervejaBancoServlet', 
	      type: 'POST',
	      data: data,
	      cache: false,
	      dataType: 'json',
	      processData: false, 
	      contentType: false, 
	      success: function(data){
	      },
	      error: function(jqXHR, textStatus, errorThrown){
	          console.log('ERRORS: ' + textStatus);
	      }
	 });
}		


</script>


<style>
	#titulo { background-color: #df8e01!important; }
	.erro {border-color: a94442; box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px red }
	.repetida {border-color: #449d44; box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px #449d44 }
</style>


<div class="container pt50 pb10 fundoHome" style="text-align: left !important; padding-right: 240px !important; padding-left: 240px !important; ">
	<div class="title" style="text-align: center; margin-bottom: 40px;">Insira os dados da cerveja a ser cadastrada</div>
	<form action="cadastrarCervejaBancoConfirma.do" id="cadastrarCervejaBancoForm" method="post" enctype="multipart/form-data" >
		<fieldset>
			<!-- Text input nome do estabelecimento-->
			<div class="form-group">
			  <label for="nomeCerveja">Nome da Cerveja</label>  
			  <div id="divNomeCerveja">
			 	  <input id="nomeCerveja" name="nomeCerveja" type="text" placeholder="Insira aqui o nome do estabelecimento" class="form-control">
			      <div class="notVisible" id="divNomeCervejaSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
  				  </div>
  			      <div class="notVisible" id="divNomeCervejaWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
  					<span id="inputError2Status" class="sr-only">(error)</span>
  				  </div>
			  </div>
			</div>
			
			<!-- Text input endereço-->
			<div class="form-group"> 
			  <label for="tipoCerveja">Tipo da Cerveja</label>  
			  <div id="divTipoCerveja">
			  	<input id="tipoCerveja" name="tipoCerveja" type="text" placeholder="Insira aqui o endereço completo" class="form-control" >
				<div class="notVisible" id="divTipoCervejaSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="notVisible" id="divTipoCervejaWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
					<span id="inputError2Status" class="sr-only">(error)</span>
				</div> 
			  </div>
			</div>
			
			<!-- Text input teorAlcoolico-->
			<div class="form-group">
			  <label  for="teorAlcoolico">Teor Alcoolico</label>  
			  <div id="divTeorAlcoolico">
			  <input id="teorAlcoolico" name="teorAlcoolico" type="text" placeholder="Insira aqui o teor alcoolico da cerveja" class="form-control">
			    <div class="notVisible" id="divTeorAlcoolicoSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="notVisible" id="divTeorAlcoolicoWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
					<span id="inputError2Status" class="sr-only">(error)</span>
				</div> 
			  </div>
			</div>
			
			<!-- Text input volumeLiquido -->
			<div class="form-group">
			  <label  for="volumeLiquido">Volume Liquido</label>  
			  <div id="divVolumeLiquido">
			  	<input id="volumeLiquido" name="volumeLiquido" type="text" placeholder="Insira o valor do volume" class="form-control">
			    <div class="notVisible" id="divVolumeLiquidoSuccess">
					<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					<span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="notVisible" id="divVolumeLiquidoWarning">
					<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
					<span id="inputError2Status" class="sr-only">(error)</span>
				</div> 
			  </div>
			</div>
			
			<table style="border:none;width: 100%;">
  				<tr>
   					<th style="width: 60%;">
   						
						<div class="col-xs-6 col-md-4" style="padding-bottom: 20px;">
							<!-- File Button --> 
							<div class="pb10" style="padding-left: 100px;">
								<input id="fotoCerveja" name="fotoCerveja" type="file" class="filestyle" data-input="false" data-badge="false" accept="image/*">
							</div>
						</div>  							
						<!-- Textarea -->
						<div class="form-group"> 
						  <label  for="descricao">Descrição</label>
						  <div id="divDescricao">                     
						    <textarea class="form-control" id="descricao" name="descricao" placeholder="Descrição da breja" rows="5"></textarea>
						     <div class="notVisible" id="divDescricaoSuccess">
								<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
								<span id="inputSuccess2Status" class="sr-only">(success)</span>
							</div>
							<div class="notVisible" id="divDescricaoWarning">
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


