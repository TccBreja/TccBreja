<script>

$(document).ready(function(){
	
	//Quando é clicado o botão do gerenciar estabelecimento é chamado essa action
	$("#btnCadastrarCervejas").click(function() {
		$("#cadastrarCervejaForm").submit();
	});
	
	//Quando é clicado o botão do gerenciar estabelecimento é chamado essa action
	$("#btnAtualizarEstabelecimento").click(function() {
		$("#atualizarEstabelecimentoForm").submit();
	});
	
	//Verifica qual botão deixar em evidência
	var controleCerveja = '<%=request.getParameter("controleCerveja")%>';
	
	if(controleCerveja === 'cadastrarCervejas'){
		$("#btnCadastrarCervejas").addClass('active');
	}else if(controleCerveja === 'atualizarEstabelecimento'){
		$("#btnAtualizarEstabelecimento").addClass('active');
	}

});
</script>

<form id="cadastrarCervejaForm" name="cadastrarCervejaForm" action="cadastrarCervejas.do">
	<input type='hidden' name="controleCerveja" id="controleCerveja" value="cadastrarCervejas"/>
	<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
	<input type='hidden' name=codigoEstabelecimento id="codigoEstabelecimento" value="<%=request.getParameter("codigoEstabelecimento")%>"/>
</form>

<form id="atualizarEstabelecimentoForm" name="atualizarEstabelecimentoForm" action="atualizarEstabelecimento.do">
	<input type='hidden' name="controleCerveja" id="controleCerveja" value="atualizarEstabelecimento"/>
	<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
	<input type='hidden' name=codigoEstabelecimento id="codigoEstabelecimento" value="<%=request.getParameter("codigoEstabelecimento")%>"/>
</form>


<div class="container">
    <div class="row">
		<div class="btn-group btn-group-justified">
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnCadastrarCervejas">
                    <i class="fa fa-beer fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p>Cadastrar Cervejas</p>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnAtualizarEstabelecimento">
                    <i class="fa fa-cogs fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p>Atualizar Estabelecimento</p>
                </button>
            </div>
        </div>
	</div>
</div>