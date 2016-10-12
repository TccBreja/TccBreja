<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<style>
	.textbody{
		font-size: 24px;
	}
</style>

<% 	if (request.getParameter("controleCerveja") != null) { %>
	<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>
<% } %>

<div class="container pb10 fundoHome" style="padding-top: 20px;">
	<img src="estaticos/imagens/hommer.ico" />
	<div class="title">
		<strong><%=request.getAttribute("nomeEstabelecimento") %> cadastrado com sucesso!</strong>
	</div>
	
	<div id="info" class="textbody" style="padding-left: 200px;padding-right: 200px;text-align: center;">
		Parabéns, seu estabelecimento foi cadastrado no sistema.
		Agora vamos adicionar as cervejas e seus respectivos preços que irão ser comercializadas no <%=request.getAttribute("nomeEstabelecimento") %>.
	</div>	
	
	<form id="gerenciarEstabelecimentoForm" name="gerenciarEstabelecimentoForm" action="gerenciarEstabelecimento.do" style="margin-top: 20px;">
		<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
		<button id="btnConfirma" name="btnConfirma" class="btn btn-warning btn-lg">Cadastrar Cervejas Agora !</button>
	</form>	
</div>