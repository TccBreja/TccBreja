<link href="estaticos/css/login.css" rel="stylesheet">
<script type="text/javascript" src="estaticos/js/jquery-3.1.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
<link href="estaticos/css/bootstrap.min.css" rel="stylesheet">
<script src="estaticos/js/bootstrap.min.js"></script>

<style>
	.erro {border-color: a94442; box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px red }
</style>
              
<script>
	$(document).ready(function() {
	    
		// Function para o efeito de background
		$(document).mousemove(function(event) {
	        TweenLite.to($("body"), 
	        .5, {
	            css: {
	                backgroundPosition: "" + parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / '12') + "px, " + parseInt(event.pageX / '15') + "px " + parseInt(event.pageY / '15') + "px, " + parseInt(event.pageX / '30') + "px " + parseInt(event.pageY / '30') + "px",
	            	"background-position": parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / 12) + "px, " + parseInt(event.pageX / 15) + "px " + parseInt(event.pageY / 15) + "px, " + parseInt(event.pageX / 30) + "px " + parseInt(event.pageY / 30) + "px"
	            }
	        })
	    })
	    
	    // Controla a validação do formulário
	    $("#login").click(function() {
	    	var login = $('#username').val();
	    		senha = $("#password").val();
	    	
	    	removerErros();
	    	resultado = verificarCampos(login, senha);
	    	
	    	if(resultado){
	    		verificarDadosLogin(login, senha);
	    	}
	    	
	    	return resultado;
	    	
	    })
	    
	     // Remove os erros quando algo é digitado no username
	    $("#username").keyup(function() {
	    	$("#username").removeClass('erro');
			$("#mensagemErro").css('display','none'); 	
	    })
	    
	    // Remove os erros quando algo é digitado no password
	     $("#password").keyup(function() {
	    	 $("#password").removeClass('erro');
	    	 $("#mensagemErro").css('display','none'); 	
	    }) 
	    
	})

	// Remove os erros de validação
	function removerErros(){
		$('.form-control').removeClass('erro')
		$("#mensagemErro").css('display','none');
	}
	
	// Exibe as mensagens de erro
	function exibirErros(campoErro, mensagem){
		
		var campoErro = document.getElementById(campoErro);
		
		$(campoErro).addClass('erro');
		$("#mensagemErro").text(mensagem);
		$("#mensagemErro").css('display','block');
	}
	
	// Valida os campos de entrada
	function verificarCampos(login, senha){
		
		var	mensagemCampoObrigatorio = "Campo(s) obrigatório(s)";
			mensagemEmailInvalido = 'Favor digitar um e-mail válido';
			mensagemSenhaInvalida = 'O campo senha deve ter no mínimo 6 caracteres';
		  	filtroEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			retorno = true;
			campoErro = "";
		
		// Verificação de campos nulos	
		if(login == ""){
			campoErro = ["username"];
			exibirErros(campoErro, mensagemCampoObrigatorio);
			retorno = false;
		} else {
			if(!filtroEmail.test(login)){
				exibirErros(campoErro, mensagemEmailInvalido);
				retorno = false;	
			}
		}
		
		if(senha == ""){
			campoErro = ["password"];
			exibirErros(campoErro, mensagemCampoObrigatorio);
			retorno = false;
		} else {
			if(senha.length < 6){
				exibirErros(campoErro, mensagemSenhaInvalida);
				retorno = false;	
			}
		}
		
		
		return retorno;
	}
	
	// Função com chamada ajax para servlet valida cnpjcpf
	function verificarDadosLogin(ajaxParam1, ajaxParam2){
		$.ajax({
	        type:"POST", 
			url:'/WebServerApp/LoginServlet', 
	        data:'username='+ajaxParam1+"&"+
	        	 'password='+ajaxParam2,
	        dataType:"json",
	        success: function(data) { 
	        	if (data.retorno == "acessoPermitido") {	        		
	        		$('#loginForm').attr('action','home.do');
	        		$('#loginForm').submit();
	        	} else {
	        		if (data.retorno == "erroUsuarioInvalido") {	
	        		 	$('input[type="submit"]').prop('disabled', true);
	        			exibirErros(null, "Usuário não encontrado");
	        		} else {
	        			$('input[type="submit"]').prop('disabled', true);
	        			exibirErros(null, "Senha inválida");
	        		}
	        	}	
	        },
	        error: function(req,status) {
	        	var teste;
	        	 teste =  '2';
	        }
		});  
	}
</script>

 <body>
     <div class="container">
         <div class="row vertical-offset-100">
             <div class="col-md-4 col-md-offset-4">
                 <div class="panel panel-default">
                     <div class="panel-heading">                                
                         <div class="row-fluid user-row">
                             <img src="estaticos/imagens/logo.jpg" class="img-responsive" alt="Conxole Admin"/>
                         </div>
                     </div>
                     <div class="panel-body">
                         <form accept-charset="UTF-8" name="loginForm" id="loginForm" method="POST" action="">
                             <fieldset>
                                 <label class="panel-login">
                                     <div class="login_result"></div>
                                 </label>
                                 <input class="form-control" placeholder="Username" id="username" type="text">
                                 <input class="form-control" placeholder="Password" id="password" type="password" minlength="6" maxlength="12">
                                 <div id="boxInvisivel" style="height: 40px; margin-top: 10px; margin-bottom: 10px;">
                                 	<span id="mensagemErro" align="center" style="display: none; color: a94442; font-family: Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 14px; font-weight: 700"></span>
                                 </div>
                                 <input type="button" class="btn btn-lg btn-warning btn-block" id="login" value="Login »">
                             </fieldset>
                         </form>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </body>