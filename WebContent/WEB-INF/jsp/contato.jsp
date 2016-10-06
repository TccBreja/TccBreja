<jsp:include page="common/cabecalhoMenu.jsp"></jsp:include>

<style>
    .list-group-item {
        padding: 10px;
        background-color: #df8e01 !important;
        color: #fff !important;
        font-size: 18px !important;
    }

    .bigicon {
        font-size: 35px;
        color: #df8e01;
    }
    
    .well-sm {
    	padding: 0px !important;
    }
    
    color: #fff;
    background-color: #f0ad4e;
    border-color: #eea236;
     
</style>


<div class="container pt50 pb10 fundoHome">
    <div class="row">
    	<div class="container">
		    <div class="row">
		            <div class="well well-sm">
		                <form class="form-horizontal" method="post">
		                    <fieldset>
		                        <legend class="text-center list-group-item" style="margin-bottom: 40px;">Entre em contato</legend>
		
		                        <div class="form-group">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="fname" name="name" type="text" placeholder="Nome" class="form-control">
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="lname" name="name" type="text" placeholder="Sobrenome" class="form-control">
		                            </div>
		                        </div>
		
		                        <div class="form-group">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="email" name="email" type="text" placeholder="Email" class="form-control">
		                            </div>
		                        </div>
		
		                        <div class="form-group">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
		                            <div class="col-md-8">
		                                <input id="phone" name="phone" type="text" placeholder="Telefone" class="form-control">
		                            </div>
		                        </div>
		
		                        <div class="form-group">
		                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
		                            <div class="col-md-8">
		                                <textarea class="form-control" id="message" name="message" placeholder="Escreva sua mensagem aqui" rows="7"></textarea>
		                            </div>
		                        </div>
		
		                        <div class="form-group">
		                            <div class="col-md-12 text-center">
		                                <button type="submit" class="btn btn-primary btn-lg btn-warning">Enviar</button>
		                            </div>
		                        </div>
		                    </fieldset>
		                </form>
		        </div>
		    </div>
		</div>
	</div>
</div>
