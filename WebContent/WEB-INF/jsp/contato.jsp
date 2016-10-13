<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		
		// Input masks
		$("#inputFone").mask("(99) 9999-9999"); 
		
	    // Controla a validação do formulário
	    $("#btnEnviar").click(function() {
	    	var nome = $('#inputNome');
	    		sobrenome = $("#inputSobrenome");
	    		email = $("#inputEmail");
	    		telefone = $("#inputFone");
	    		mensagem = $("#inputMensagem");
	      	
	    	removerErros();
	    	resultado = verificarCampos(nome, sobrenome, email, telefone, mensagem);
    		
	    	if(resultado){
	    		var width =  $('#mensagemInfo').css('width');
	    			height = $('#mensagemInfo').css('height');
	    			varTop = height.substring(0,3)/2;
	    			varHtml = "<div style='height:" + height + ";'><i class='fa fa-circle-o-notch fa-spin'" 
	    					  + "style='font-size:48px; position: relative; top:150px;'></i></div>";
	    				
	    		$('#mensagemInfo').html(varHtml);
	    		setTimeout(enviarEmail(nome.val(), sobrenome.val(), email.val(), telefone.val(), mensagem.val()),200000);
	    	}
	    	
	    	return resultado;  	
	    })
	    
	    // Remove os erros quando algo é digitado no nome
	    $("#inputNome").keyup(function() {
	    	$("#inputNome").removeClass('erro');
	    	$("#inputNome").parent().parent().find('i').removeClass('erroCor');
			$("#mensagemErro").css('display','none'); 	
	    })
	    
	    // Remove os erros quando algo é digitado no sobrenome
	     $("#inputSobrenome").keyup(function() {
	    	 $("#inputSobrenome").removeClass('erro');
	    	 $("#inputSobrenome").parent().parent().find('i').removeClass('erroCor');
	    	 $("#mensagemErro").css('display','none'); 	
	    }) 
	    
	    // Remove os erros quando algo é digitado no email
	    $("#inputEmail").keyup(function() {
	    	$("#inputEmail").removeClass('erro');
	    	$("#inputEmail").parent().parent().find('i').removeClass('erroCor');
			$("#mensagemErro").css('display','none'); 	
	    })
	    
	    // Remove os erros quando algo é digitado no telefone
	     $("#inputFone").keyup(function() {
	    	 $("#inputFone").removeClass('erro');
	    	 $("#inputFone").parent().parent().find('i').removeClass('erroCor');
	    	 $("#mensagemErro").css('display','none'); 	
	    }) 
	    
		// Remove os erros quando algo é digitado na mensagem
	     $("#inputMensagem").keyup(function() {
	    	 $("#inputMensagem").removeClass('erro');
	    	 $("#inputMensagem").parent().parent().find('i').removeClass('erroCor');
	    	 $("#mensagemErro").css('display','none'); 	
	    }) 
	    
	})

	// Remove os erros de validação
	function removerErros(){
		$('.form-control').removeClass('erro')
		$('i').removeClass('erro')
		$("#mensagemErro").css('display','none');
	}
	
	// Exibe as mensagens de erro
	function exibirErros(campoErro, mensagem){	
		$(campoErro).addClass('erro');
		$(campoErro).parent().parent().find('i').addClass('erroCor');
		$("#mensagemErro").find('span').text(mensagem);
		$("#mensagemErro").css('display','block');
	}
	
	// Valida os campos de entrada
	function verificarCampos(nome, sobrenome, email, telefone, mensagem){
		
		var	mensagemCampoObrigatorio = "Campo(s) obrigatório(s)";
			mensagemEmailInvalido = 'Favor digitar um e-mail válido';
		  	filtroEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			retorno = true;
			
		if (nome.val() == "") {
			exibirErros(nome, mensagemCampoObrigatorio);
			retorno = false;
		}
		
		if (sobrenome.val() == "") {
			exibirErros(sobrenome, mensagemCampoObrigatorio);
			retorno = false;
		}
		
		if (email.val() == "") {
			exibirErros(email, mensagemCampoObrigatorio);
			retorno = false;
		} else {
			if (!filtroEmail.test(email.val())) {
				exibirErros(email, mensagemEmailInvalido);
				retorno = false;	
			}
		}
		
		if(telefone.val() == ""){
			exibirErros(telefone, mensagemCampoObrigatorio);
			retorno = false;
		}
		
		if(mensagem.val() == ""){
			exibirErros(mensagem, mensagemCampoObrigatorio);
			retorno = false;
		}
		
		return retorno;
	}
	
	function enviarEmail(nome, sobrenome, email, telefone, mensagem){
		$.ajax({
			type: 'POST',
			url:'/WebServerApp/EnviarEmailServlet', 
	        data:'nome='+nome+"&"+
       	 		 'sobrenome='+sobrenome+"&"+
       	 		 'email='+email+"&"+
       	 		 'telefone='+telefone+"&"+
       	 		 'mensagem='+mensagem,
		      dataType: 'json',
		      success: function(data){
		    	  if(data.retorno == "sucesso"){	  
		    		  $('#mensagemInfo').html("<img src='estaticos/imagens/hommer.ico'/><div class='title'>"
		    			+ "<strong>Mensagem enviada com sucesso!</strong></div>"
		    			+ "<div id='info' class='textbody' style='font-size: 24px;padding-left: 200px;padding-right: 200px;text-align: center;'>"
		    			+ "Iremos analisar a mensagem e responderemos assim que possível.</div>");
		    	  } else {
		    		  $('#mensagemInfo').html("<img src='estaticos/imagens/homer-doh.png' style='width: 25%;'/><div class='title erroCor'>"
		    			+ "<strong>Erro ao enviar o e-mail!</strong></div>"
		    			+ "<div id='info' class='textbody' style='font-size: 24px;padding-left: 200px;padding-right: 200px;text-align: center;'>"
		    			+ "Ocorreu um erro em nosso servidor, recarregue a página e tente novamente.</div>");   		
		    	  }
		      },
		      error: function(jqXHR, textStatus, errorThrown){
		    	  window.location.reload();
		          console.log('ERRORS: ' + textStatus);
		      }
		 });
	}
</script>


<style>
    .list-group-item {
        padding: 10px;
        background-color: #df8e01 !important;
        color: #fff !important;
        font-size: 18px !important;
    }

    .bigicon {
        font-size: 35px;
    }
    
    .well-sm {
    	padding: 0px !important;
    }
    
   .border {
   	  border-color: #337ab7;
   }
   
   .erro {border-color: a94442; box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px red }
   
   .erroCor {color: #a94442;}
   
   .centro {
		position: absolute;
		top: 0; bottom: 0;
		left: 0; right: 0;
		margin: auto;
	}
	     
</style>

<div class="container pt50 pb10 fundoHome">
    <div class="row">
    	<div id="telefone" style="margin-bottom: 20px; padding-left: 200px; padding-right: 200px;">
    		<div class="title" style="text-align: center;">Nossos telefones</div>
    		<div id="telefoneInfo">
	    		<table style="width: 100%;">
	  				<tr>
	   					<th style="width: 12%;">
	   						<img src="estaticos/imagens/phone.png" style="width: 100%;"/>
	   				 	</th>
	    				<th style="width: 15%;">
	    					<div class="textbody" style="font-size: 22px;">
	    						9-7774-8527
	    					</div>
	    				</th>
	    				<th style="width: 9%;">
	   						<img src="estaticos/imagens/phone2.png" style="width: 100%;"/>
	   				 	</th>
	    				<th style="width: 10%;">
	    					<div class="textbody" style="font-size: 22px;">
	    						2669-8569
	    					</div>
	    				</th>
					</tr>
				</table>
			</div>	
    	</div>
    	
   		<div id="mensagem" style="padding-left: 200px; padding-right: 200px;">
   			<div class="title" style="text-align: center;">Se preferir, nos envie uma mensagem</div>
           	<div id="mensagemInfo" class="form-horizontal"> 
	         	<fieldset>
			    	<div id="nome" name="nome" class="form-group row">
			  			<span class="col-md-1  text-center"><i class="fa fa-user bigicon"></i></span>
			  			<div class="col-xs-10">
			 				<input id="inputNome" name="inputNome" type="text" placeholder="Nome" class="form-control">
				 		</div>
					</div>
					<div id="sobrenome" name="sobrenome" class="form-group row">
			  			<span class="col-md-1  text-center"><i class="fa fa-user bigicon"></i></span>
			  			<div class="col-xs-10">
			 				<input id="inputSobrenome" name="inputSobrenome" type="text" placeholder="Sobrenome" class="form-control">
				 		</div>
					</div>
					<div id="email" name="email" class="form-group row">
			  			<span class="col-md-1  text-center"><i class="fa fa-envelope-o bigicon"></i></span>
			  			<div class="col-xs-10">
			 				<input id="inputEmail" name="inputEmail" type="text" placeholder="Email" class="form-control">
				 		</div>
					</div>
					<div id="fone" name="fone" class="form-group row">
			  			<span class="col-md-1  text-center"><i class="fa fa-phone-square bigicon"></i></span>
			  			<div class="col-xs-10">
			 				<input id="inputFone" name="inputFone" type="text" placeholder="Telefone" class="form-control">
				 		</div>
					</div>
					<div id="mensagem" name="mensagem" class="form-group row">
			  			<span class="col-md-1  text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
			  			<div class="col-xs-10">
			 				 <textarea id="inputMensagem" name="inputMensagem" class="form-control" placeholder="Escreva sua mensagem aqui" 
			 				 	rows="7"></textarea>
				 		</div>
					</div>
					<div id="enviar" name="enviar" class="form-group row">
			  			<div>
		 				  <button id="btnEnviar" name="btnEnviar" type="submit" class="btn btn-primary btn-lg btn-warning">Enviar</button>
				 		</div>
					</div>
					<div id="boxInvisivel" style="height: 40px; margin-top: 20px; margin-bottom: 10px">
   						<span id="mensagemErro" class="alert alert-danger fade in glyphicon glyphicon-alert" aria-hidden="true" style="position: relative;top: -7px; font-size: 24px; color: rgb(217, 83, 79); padding-top: 5px;padding-bottom: 5px; display: none;">
   							<span align="center" style="position: relative; top: -4px; left: -8px;color: a94442; font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 18px; font-weight: 700;"></span>
   						</span>	
					</div>	
				</fieldset>
			</div>
   		</div>
    </div>
</div>


