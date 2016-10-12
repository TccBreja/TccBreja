<link href="estaticos/css/home.css" rel="stylesheet">
<link href="estaticos/css/bootstrap-timepicker.min.css" rel="stylesheet">
<link href="estaticos/css/font-awesome.min.css" rel="stylesheet">
<link href="estaticos/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Acme|Architects+Daughter|Gloria+Hallelujah|Handlee|Lobster|Arima+Madurai|Averia+Serif+Libre|Bubblegum+Sans|Mada|Merienda|Rancho|Rosario|PT+Sans|Righteous|Rock+Salt|Sansita+One|Satisfy" rel="stylesheet">
<script type="text/javascript" src="estaticos/js/jquery-3.1.0.js"></script>
<script type="text/javascript" src="estaticos/js/jquery.maskMoney.js"></script>
<script src="estaticos/js/bootstrap.min.js"></script>
<script src="estaticos/js/bootstrap-timepicker.min.js"></script>
<script src="estaticos/js/mask.js"></script>
<style>
	.title {font-family: 'Lobster', cursive; font-size: 26px; font-weight: bold;}
	.textbody {font-family: 'Rancho', cursive; text-align: justify; font-size: 20px;}
	p {font-family: 'PT Sans', sans-serif; font-size: 15px;}
	#titulo{ background: #FFB75E; /* fallback for old browsers */
			 background: -webkit-linear-gradient(to left, #FFB75E , #ED8F03); /* Chrome 10-25, Safari 5.1-6 */
			 background: linear-gradient(to left, #FFB75E , #ED8F03); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
			}
</style>


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

<form id="cadastrarEstabelecimentoForm" name="cadastrarEstabelecimentoForm" action="cadastrarEstabelecimento.do" method="post">
	<input type='hidden' name="controleMenu" id="controleMenu" value="cadastrarEstabelecimento"/>
</form>

<form id="contatoForm" name="contatoForm" action="contato.do" method="post">
	<input type='hidden' name="controleMenu" id="controleMenu" value="contato"/>
</form>

<form id="gerenciarEstabelecimentoForm" name="gerenciarEstabelecimentoForm" action="gerenciarEstabelecimento.do" method="post">
	<input type='hidden' name="controleMenu" id="controleMenu" value="gerenciarEstabelecimento"/>
</form>

<div class="container">
    <div class="row">
		<div class="btn-group btn-group-justified">
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnCadastrarEstabelecimento" style="border-radius: 20px 0px 0px 20px;">
                    <i class="fa fa-cogs fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p><b>Cadastrar Estabelecimento</b></p>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnGerenciarEstabelecimento">
                	<i class="fa fa-beer fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p><b>Genrenciar Estabelecimento</b></p>
                </button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-nav" id="btnContato" style="border-radius: 0px 20px 20px 0px;">
                    <i class="fa fa-phone fa-3x pb10 pt10" aria-hidden="true"></i>
    			    <p><b>Contato</b></p>
                </button>
            </div>
        </div>
	</div>
</div>