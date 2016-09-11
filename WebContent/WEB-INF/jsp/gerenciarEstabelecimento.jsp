<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<style>
	#titulo{ background-color: #df8e01!important;}
</style>

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
								<img src="<bean:write name="listaEstabelecimentos" property="fotoUm"/>" alt="100%x180" style="height: 180px; width: 100%; display: block;">
							</div>
		 				 	<div class="col-md-8">
				  	 	 		<div class="col-md-6">
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
