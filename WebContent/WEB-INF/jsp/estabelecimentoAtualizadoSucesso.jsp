<link href="estaticos/css/cadastrarCervejas.css" rel="stylesheet">

<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>

<style>
	.textbody{
		font-size: 24px;
	}
</style>

<div class="container pb10 fundoHome" style="padding-top: 20px;">
	<img src="estaticos/imagens/hommer.ico" />
	<div class="title">
		<strong><%=request.getAttribute("nomeEstabelecimento") %> atualizado com sucesso!</strong>
	</div>
	
	<div id="info" class="textbody" style="padding-left: 200px;padding-right: 200px;text-align: center;">
		Parabéns, seu estabelecimento foi atualizado no sistema.
		Confira a alteração clicando em "Gerenciar Estabelecimentos" no menu superior da página.
	</div>	
		
</div>