<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>
<jsp:include page="common/cabecalhoCervejas.jsp"></jsp:include>

<link href="estaticos/css/cadastrarCervejas.css" rel="stylesheet">

<style>
#titulo{
	background-color: #df8e01!important;
}
</style>
<script>
$(document).ready(function(){
	//Adiciona uma linha de cerveja na tabela
	$("#adicionarCerveja").click(function(){
	    $("#tratamentoListaAdd").append("<tr><td align='center'><a class='btn btn-danger deletavel'><em class='fa fa-trash'></em></a></td><td class='hidden-xs'>Skoll</td><td>600 ml - Garrafa</td><td>R$ 6,50</td></tr>");
	});
	
	//Remove uma linha de cerveja da tabela 
	$("#tratamentoListaAdd").delegate('.deletavel','click', function(){
		this.closest('tr').remove();
	});
	
});

</script>
<div class="container pt50 pb10 fundoHome">
    <div class="row">
    	<div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading" id="titulo">
                <div class="row">
                  <div class="col col-xs-12" >
                    <h1 class="panel-title">Lista de Cervejas</h1>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">Nome</th>
                        <th>Volume líquido - Tipo</th>
                        <th>Valor R$</th>
                    </tr> 
                  </thead>
                  <tbody id="tratamentoListaAdd">
                          <tr>
                            <td align="center">
                              <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
                            </td>
                            <td class="hidden-xs">
                            	 <select id="horarioFechamento" name="horarioFechamento" class="form-control">
							      <option value="010101">Skoll</option>
							      <option value="010102">Brahma</option>
							    </select>
                            </td>
                            <td>
	                           	<select id="horarioFechamento" name="horarioFechamento" class="form-control">
							      <option value="010101">Garrafa - 600ml</option>
							      <option value="010102">Lata    - 365ml</option>
							    </select>
							</td>
                            <td>
                            	<input id="nomeEstabelecimento" name="nomeEstabelecimento" type="text" placeholder="R$ " class="form-control input-md">
                            </td>
                          </tr>
                          
                          
                        </tbody>
                </table>
                  <div class="col col-xs-1 text-left pt10 pb10">
                    <button type="button" class="btn btn-success" id="adicionarCerveja">
                    	 <p>Adicionar Cerveja</p>
                    </button>
                  </div>
              </div>
            </div>

</div></div></div>
    
    
	</div>
</div>