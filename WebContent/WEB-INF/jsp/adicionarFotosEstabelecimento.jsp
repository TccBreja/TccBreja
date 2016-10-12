<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<script type="text/javascript" src="estaticos/js/bootstrap-filestyle.min.js"> </script>

<script>
	$(document).ready(function() {
		// Adequa os input file 
		$(":file").filestyle('buttonText', '&nbspEscolher arquivo');
		
		// Salva a imagem no banco no momento do onchange
		$('input[type="file"]').on('change', uploadFile);
	})
	
	// Faz o submit no form
	function submitForm(){
		$("[name='cadastrarEstabelecimentoRatificaForm']").removeAttr('enctype');
		$("[name='cadastrarEstabelecimentoRatificaForm']").submit();
	}
	
	// Função que faz o upload dos arquivos
	function uploadFile(event){
	    event.stopPropagation(); 
	    event.preventDefault(); 
	    var files = event.target.files; 
	   	 	codigoEstabelecimento = <%=request.getAttribute("codigoEstabelecimento")%>
	    	data = new FormData();
	   
	    // Atualiza form de reload
	    $('#foto_um_reload').val($('#foto_um').val());
	    $('#foto_dois_reload').val($('#foto_dois').val());
	    $('#foto_tres_reload').val($('#foto_tres').val());
	    $('#foto_quatro_reload').val($('#foto_quatro').val());
	    
	    // Prepara form de arquivo
	    data.append("codigoEstabelecimento",codigoEstabelecimento);	 
	    $.each(files, function(key, value){
	        data.append(event.target.name, value);
	    });
	    
	    // Chama função ajax
	    postFilesData(data); 
	 }
	
	// Ajax que direciona para a servlet de salvar imagem
	function postFilesData(data){
		$.ajax({
		url:'/WebServerApp/SalvarImagemServlet', 
		      type: 'POST',
		      data: data,
		      cache: false,
		      dataType: 'json',
		      processData: false, 
		      contentType: false, 
		      success: function(data){
		    	  if(data.retorno = "sucesso"){
		    		 $("#reloadForm").submit();
		    	  }
		      },
		      error: function(jqXHR, textStatus, errorThrown){
		          console.log('ERRORS: ' + textStatus);
		      }
		 });
	}
	
	// Função com chamada ajax para servlet valida cnpjcpf
	function exibirImagemServlet(ajaxParam1, ajaxParam2){
		$.ajax({
	        type:"POST", 
			url:'/WebServerApp/ExibirImagemServlet', 
	        data:'codigoEstabelecimento='+ajaxParam1+"&"+
	        	 'campoFoto='+ajaxParam2,
	        dataType:"json",
	        success: function(data) { 
	        	//$('#img1').find('img').attr('src',data);
	        	//document.getElementById(ajaxParam2);
	        },
	        error: function(req,status) {
	        	var teste;
	        	 teste =  '2';
	        }
		});  
	}
	
</script>

<% 	if (request.getParameter("controleCerveja") != null) { %>
	<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>
<% } %>

<div class="container pt40 pb10 fundoHome">
	<form action="cadastrarEstabelecimentoRatifica.do" class="form-horizontal" method="post" name="cadastrarEstabelecimentoRatificaForm" enctype="multipart/form-data" >
	<% 	if (request.getParameter("controleCerveja") != null) { %>
		<input type='hidden' name="controleCerveja" id="controleCerveja" value="atualizarEstabelecimento"/>
		<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
	<% } else { %>
		<input type='hidden' name="controleMenu" id="controleMenu" value="cadastrarEstabelecimento"/>
	<% } %>
		<input type='hidden' name="codigoEstabelecimento" value="<%=request.getAttribute("codigoEstabelecimento") %>" />
		<div id="blocoSuperior" class="row" style="margin-bottom: 20px;">
			<div class="col-xs-6 col-md-4" style="margin-top: 20px;">
				<a href="#" class="thumbnail">				
					<img src="ExibirImagemServlet?codigoEstabelecimento=<%=request.getAttribute("codigoEstabelecimento")%>&campoFoto=foto_um" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;"" id="img1">			
				</a>
				<!-- File Button --> 
				<div class="pb10" style="padding-left: 100px;">
					<input id="foto_um" name="foto_um"  type="file" class="filestyle" data-input="false" data-badge="false" accept="image/*">
				</div>
			</div>
			<div class="col-xs-6 col-md-8">
				<div class="title">Hora de adicionar fotos!</div>
				<div class="textbody pt10">	
					<div id="infofoto">
						Você pode adicionar até quatro fotos no seu estabelecimento, escolha suas melhores imagens e siga os passos abaixo para vinculá-las ao estabelecimento.
						Adicionar fotos é importante, pois aumenta a visibilidade do seu estabelecimento despertando um maior interesse nos possíveis clientes.
					</div>
					<div id="passosFoto" style="margin-top: 10px;">
						<b>	
							1) Clique no botão "Escolher arquivo".
							</br>
							2) Selecione a foto que deseja carregar e clique em abrir.
							</br>
							3) Pronto, a foto irá ser carregada no quadro correspondente. Repita o procedimento para os demais quadros.
						</b>
					</div>	
				</div>	
			</div>
		</div>
		<div class="row" id="blocoInferior">
			<div class="col-xs-6 col-md-4" style="padding-bottom: 20px;">
				<a href="#" class="thumbnail">
					<img src="ExibirImagemServlet?codigoEstabelecimento=<%=request.getAttribute("codigoEstabelecimento")%>&campoFoto=foto_dois" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<!-- File Button --> 
				<div class="pb10" style="padding-left: 100px;">
					<input id="foto_dois" name="foto_dois" type="file" class="filestyle" data-input="false" data-badge="false" accept="image/*">
				</div>
			</div>  
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="ExibirImagemServlet?codigoEstabelecimento=<%=request.getAttribute("codigoEstabelecimento")%>&campoFoto=foto_tres" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<div class="pb10" style="padding-left: 100px;">
					<input id="foto_tres" name="foto_tres" type="file" class="filestyle" data-input="false" data-badge="false" accept="image/*">
				</div>
			</div>  
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="ExibirImagemServlet?codigoEstabelecimento=<%=request.getAttribute("codigoEstabelecimento")%>&campoFoto=foto_quatro" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<div class="pb10" style="padding-left: 100px;">
					<input id="foto_quatro" name="foto_quatro" type="file" class="filestyle" data-input="false" data-badge="false" accept="image/*">
				</div>
			</div>  
		</div>
		<!-- Button -->
		<div class="form-group" style="float:right;">
			<label class="col-md-4 control-label" for="btnConfirma"></label>
			<div class="col-md-4">		
				<button id="btnConfirma" name="btnConfirma" class="btn btn-warning btn-lg" onclick="submitForm();">Confirmar</button>
			</div>
		</div>
	</form>
</div>

<form action="adicionarFotosEstabelecimento.do" id="reloadForm" name="reloadForm" method="post">
	<% 	if (request.getParameter("controleCerveja") != null) { %>
		<input type='hidden' name="controleCerveja" id="controleCerveja" value="atualizarEstabelecimento"/>
		<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
	<% } else { %>
		<input type='hidden' name="controleMenu" id="controleMenu" value="cadastrarEstabelecimento"/>
	<% } %>
	<input type='hidden' name="codigoEstabelecimento" id="codigoEstabelecimento" value="<%=request.getAttribute("codigoEstabelecimento")%>"/>
	<input type='hidden' name="reload" id="reload" value="true"/>
</form>	
