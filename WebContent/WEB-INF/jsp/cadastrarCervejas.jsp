<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
	    $("#tratamentoListaAdd").append("<%=request.getAttribute("appendListaCervejas")%>");
	});
	
	//Remove uma linha de cerveja da tabela 
	$("#tratamentoListaAdd").delegate('.deletavel','click', function(){
		this.closest('tr').remove();
	});
	//Mascara os valores em real da aplicação
	$(function(){
		 $(".dinheiro").maskMoney({symbol:'', 
		showSymbol:true, thousands:'.', decimal:',', symbolStay: true});
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
								<th class="hidden-xs">Nome - Volume líquido - Tipo</th>
								<th>Valor R$</th>
							</tr> 
						</thead>
						<tbody id="tratamentoListaAdd">
							<tr>
								<td align="center">
									<a class="btn btn-danger"><em class="fa fa-trash"></em></a>
								</td>
								<td class="hidden-xs">
									<select id="listaCervejasSelect" name="listaCervejasSelect" class="form-control">
										<logic:iterate id="listaCervejas" name="listaCervejas">
											<option value="<bean:write name="listaCervejas" property="codigoCerveja"/>"><bean:write name="listaCervejas" property="nomeCerveja"/> - <bean:write name="listaCervejas" property="tipo"/></option>
										</logic:iterate>
									</select>
								</td>
								<td>
									<div class="input-group">
										<div class="input-group-addon">$</div>
										<input type="text" class="form-control dinheiro">
									</div>
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
		</div>
	</div>
</div>