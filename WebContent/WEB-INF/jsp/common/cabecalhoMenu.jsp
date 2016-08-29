
<link href="estaticos/css/home.css" rel="stylesheet">
<script type="text/javascript" src="estaticos/js/jquery-3.1.0.js"></script>
<link href="estaticos/css/bootstrap.min.css" rel="stylesheet">
<script src="estaticos/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="estaticos/css/font-awesome.min.css">

<script>

$(document).ready(function(){
	
	//Quando é clicado o botão do estabelecimento é chamado essa action
	$("#btnCadastrarEstabelecimento").click(function() {
		$("#cadastrarEstabelecimentoForm").submit();
	});
	
	//Quando é clicado o botão do contato é chamado essa action
	$("#btnContato").click(function() {
		$("#contatoForm").submit();
	});
	
	//Quando é clicado o botão do gerenciar estabelecimento é chamado essa action
	$("#btnGerenciarEstabelecimento").click(function() {
		$("#gerenciarEstabelecimentoForm").submit();
	});
	
	//Verifica qual botão deixar em evidência
	var controleMenu = '<%=request.getParameter("controleMenu")%>';
	
	$("#btnCadastrarEstabelecimento").removeClass('active');
	$("#btnContato").removeClass('active');
	
	if(controleMenu === 'cadastrarEstabelecimento'){
		$("#btnCadastrarEstabelecimento").addClass('active');
	}else if(controleMenu === 'contato'){
		$("#btnContato").addClass('active');
	}else if(controleMenu === 'gerenciarEstabelecimento'){
		$("#btnGerenciarEstabelecimento").addClass('active');
	}

});
</script>

<form id="cadastrarEstabelecimentoForm" name="cadastrarEstabelecimentoForm" action="cadastrarEstabelecimento.do">
	<input type='hidden' name="controleMenu" id="controleMenu" value="cadastrarEstabelecimento"/>
</form>

<form id="contatoForm" name="contatoForm" action="contato.do">
	<input type='hidden' name="controleMenu" id="controleMenu" value="contato"/>
</form>

<form id="gerenciarEstabelecimentoForm" name="gerenciarEstabelecimentoForm" action="gerenciarEstabelecimento.do">
	<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
</form>

<div class="container">
    <div class="row">
		<div class="btn-group btn-group-justified">
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnCadastrarEstabelecimento">
                    <i class="fa fa-cogs fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p>Cadastrar Estabelecimento</p>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnGerenciarEstabelecimento">
                	<i class="fa fa-beer fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p>Genrenciar Estabelecimento / Cadastrar Cerveja</p>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnContato">
                    <i class="fa fa-phone fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p>Contato</p>
                </button>
            </div>
        </div>
	</div>
</div>