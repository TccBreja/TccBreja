<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<style>
	#titulo{ background-color: #df8e01!important;}
</style>
	
<script>
	$(document).ready(function() {
	
	// Cancela o submit do form no click do lixinho
	$('.btn-danger').click(function() {
		$(this).closest('a').attr('onclick','return false');
		var nomeEstabelecimento = $($(this).siblings('.col-md-8').find('.list-group-item-text').get(0)).html().split(':')[1];
		$('.modal-body').find('p').text("Tem certeza que deseja excluir o estabelecimento "+ nomeEstabelecimento + "?");	
		var codigoEstabelecimento = $(this).parent().find('.col-md-6').find('p')[0].innerHTML;
		$('#codigoEstabelecimentoControle').val(codigoEstabelecimento);
	});
	
	$('#btnNao').click(function() {
		window.location.reload();
	});
	
	$('#btnSim').click(function() {
		excluiEstabelecimento($('#codigoEstabelecimentoControle').val());

	});
})

	function excluiEstabelecimento(ajaxParam1){
		$.ajax({
			type: 'POST',
			url:'/WebServerApp/ExcluirEstabelecimentoServlet', 
	        data:'codigoEstabelecimento='+ajaxParam1,
		      dataType: 'json',
		      success: function(data){
		    	  if(data.retorno = "sucesso"){
		    		  window.location.reload();
		    	  }
		      },
		      error: function(jqXHR, textStatus, errorThrown){
		    	  window.location.reload();
		          console.log('ERRORS: ' + textStatus);
		      }
		 });
	}
</script>

<div class="container pt50 pb10 fundoHome">
	<div class="row">
		<div class="list-group">
		 	<logic:notEmpty name="listaEstabelecimentos">
		 		<a href="#" class="list-group-item active" id="titulo">
					<h4 class="list-group-item-heading">Lista de Estabelecimentos Cadastrados</h4>
				</a>
				<logic:iterate id="listaEstabelecimentos" name="listaEstabelecimentos">
					<a href="#" class="list-group-item" onclick="submitForm(<bean:write name="listaEstabelecimentos" property="codigoEstabelecimento"/>)">
						<div class="row">
			  				<div class="col-md-4">
								<img src="ExibirImagemServlet?codigoEstabelecimento=<bean:write name="listaEstabelecimentos" property="codigoEstabelecimento"/>&campoFoto=foto_um" alt="100%x180" style="height: 180px; width: 100%; display: block;">
							</div>
		 				 	<div class="col-md-8">
				  	 	 		<div class="col-md-6">
				  	 	 			<p style="display : none" id="idEstabelecimento"><bean:write name="listaEstabelecimentos" property="codigoEstabelecimento"/></p>
				  	 	 			<input type='hidden' name="codigoEstabelecimentoControle" id="codigoEstabelecimentoControle" value=""/>
									<p class="list-group-item-text"><strong>Nome Estabelecimento</strong> : <bean:write name="listaEstabelecimentos" property="nomeEstabelecimento"/></p>
									<p class="list-group-item-text"><strong>Endereço</strong> : <bean:write name="listaEstabelecimentos" property="endereco"/></p>
									<p class="list-group-item-text"><strong>Telefone</strong> : <bean:write name="listaEstabelecimentos" property="telefone"/></p>
							  	</div>
			  	  	  			<div class="col-md-6">
									<p class="list-group-item-text"><strong>Site</strong> : <bean:write name="listaEstabelecimentos" property="site"/></p>
									<p class="list-group-item-text"><strong>Horario de Abertura / Fechamento</strong> : <bean:write name="listaEstabelecimentos" property="horarioAbertura"/> / <bean:write name="listaEstabelecimentos" property="horarioFechamento"/></p>
									<p class="list-group-item-text"><strong>Tipo de Estabelecimento</strong> : <bean:write name="listaEstabelecimentos" property="tipoEstabelecimento"/></p>
					 		 	</div>
						  		<div class="col-md-12 pt40">
							  		<p class="list-group-item-text"><strong>Descrição</strong> : <bean:write name="listaEstabelecimentos" property="descricao"/></p>
							  	</div>
							</div>
							<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target=".bd-example-modal-sm" style="float: right; margin-top: 20px; margin-right: 20px;">
  								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							</button>
						</div>
					</a>
				</logic:iterate>
			</logic:notEmpty>
			<logic:empty name="listaEstabelecimentos">
				<a href="#" class="list-group-item active" id="titulo">
					<h4 class="list-group-item-heading">Você não possui estabelecimento cadastrados</h4>
				</a>
			</logic:empty>
		</div>
	</div>
</div>

<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title"><b>Excluir estabelecimento</b></h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnSim">Sim</button>
        <button type="button" class="btn btn-primary" id="btnNao">Não</button>
      </div>
    </div>
  </div>
</div>

<script>
	function submitForm(codigoEstabelecimento){
		$("#codigoEstabelecimento").val(codigoEstabelecimento);
		$("#cadastrarCervejasForm").submit();
	}
</script>

<form id="cadastrarCervejasForm" name="cadastrarCervejasForm" action="cadastrarCervejas.do" method="POST">
	<input type='hidden' name="codigoEstabelecimento" id="codigoEstabelecimento" value=""/>
	<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
	<input type='hidden' name="controleCerveja" id="controleCerveja" value="cadastrarCervejas"/>
</form>
