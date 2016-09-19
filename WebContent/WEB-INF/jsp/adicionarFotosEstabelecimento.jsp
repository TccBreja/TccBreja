<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>

<script>
	function submitForm(){
		$("[name='cadastrarEstabelecimentoRatificaForm']").submit();
	}
</script>

<% 	if (request.getParameter("controleCerveja") != null) { %>
	<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>
<% } %>

<div class="container pt50 pb10 fundoHome">

	<form action="cadastrarEstabelecimentoRatifica.do" class="form-horizontal" method="post" name="cadastrarEstabelecimentoRatificaForm" enctype="multipart/form-data" >
	<% 	if (request.getParameter("controleCerveja") != null) { %>
		<input type='hidden' name="controleCerveja" id="controleCerveja" value="atualizarEstabelecimento"/>
		<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
	<% } else { %>
		<input type='hidden' name="controleMenu" id="controleMenu" value="cadastrarEstabelecimento"/>
	<% } %>
		<input type='hidden' name="codigoEstabelecimento" value="<%=request.getAttribute("codigoEstabelecimento") %>" />
		<div class="row">
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="estaticos/imagens/bar_exemplo.jpg" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<!-- File Button --> 
				<div class="col-md-4 pb10">
					<input id="foto_um" name="foto_um" class="input-file" type="file" accept="image/*">
				</div>
			</div>
			<div class="col-xs-6 col-md-8">
			Aqui é Body Builder Ipsum PORRA! AHHHHHHHHHHHHHHHHHHHHHH..., porra! É verão o ano todo vem cumpadi. Sai filho da puta! É 13 porra! Bora caralho, você quer ver essa porra velho. Vamo monstro!
			
			Vamo monstro! Tá comigo porra. Boraaa, Hora do Show Porra. Vem porra! Negativa Bambam negativa. Aqui nóis constrói fibra, não é água com músculo.
			
			Ó o homem ali porra!, é 13 porra! Vo derrubar tudo essas árvore do parque ibirapuera. Que não vai dá rapaiz, não vai dá essa porra. Ajuda o maluco que tá doente. É nóis caraio é trapezera buscando caraio! Não vai dá não.
			
			É nóis caraio é trapezera buscando caraio! Sai de casa comi pra caralho porra. Vem porra! É verão o ano todo vem cumpadi. Vai subir árvore é o caralho porra! Que não vai dá rapaiz, não vai dá essa porra.
			
			Sai de casa comi pra caralho porra. Boraaa, Hora do Show Porra. Vai subir árvore é o caralho porra! Bora caralho, você quer ver essa porra velho. Eu quero esse 13 daqui a pouquinho aí. Não vai dá não.
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="estaticos/imagens/bar_exemplo.jpg" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<!-- File Button --> 
				<div class="col-md-4 pb10">
					<input id="foto_dois" name="foto_dois" class="input-file" type="file" accept="image/*">
				</div>
			</div>  
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="estaticos/imagens/bar_exemplo.jpg" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<div class="col-md-4 pb10">
					<input id="foto_tres" name="foto_tres" class="input-file" type="file" accept="image/*">
				</div>
			</div>  
			<div class="col-xs-6 col-md-4">
				<a href="#" class="thumbnail">
					<img src="estaticos/imagens/bar_exemplo.jpg" alt="100%x180" data-src="holder.js/100%x180" style="height: 180px; width: 100%; display: block;">
				</a>
				<div class="col-md-4 pb10">
					<input id="foto_quatro" name="foto_quatro" class="input-file" type="file" accept="image/*">
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