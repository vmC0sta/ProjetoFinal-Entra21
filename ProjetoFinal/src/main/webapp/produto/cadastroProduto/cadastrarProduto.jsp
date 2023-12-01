<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.produto.Categoria"%>
<%@ page import="model.produto.UnidadeMedida"%>
<%@ page import="controller.produto.CategoriaController"%>
<%@ page import="controller.produto.UnidadeMedidaController"%>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="java.util.*" %>

<%

	DBConnection dbCOnnection = new MySQL(); 
	CategoriaController categoriaController = new CategoriaController(dbCOnnection);
	UnidadeMedidaController unidadeMedidaController = new UnidadeMedidaController(dbCOnnection);

%>
	
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Cadastrar Produto</title>
</head>
<body>
	<nav>
		<%@include file="/menu/menu.jsp"%>
	</nav>

	<main class="container">

		<h1 style="margin: 1.5rem 0">Cadastrar Produto</h1>

		<div class="container mt-5">
			<form>
				<div class="form-row">

					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Código</label> <input
							type="text" class="form-control" id="id" placeholder="Código">
					</div>

					<div class="form-group col-md-6" style="margin: 1rem 90">
						<label for="codigoReferencia" style="font-weight: bolder">Código
							de Referência</label> <input type="text" class="form-control"
							id="codigoReferencia" placeholder="Código de Referência">
					</div>


				<div class="form-group" style="margin: 1rem 0">
					<label for="descricao" style="font-weight: bolder">Descrição</label>
					<input type="text" class="form-control" id="descricao"
						placeholder="Descrição">
				</div>


				<div class="form-group col-md-6" style="margin: 1rem 0">
					<label for="categoria" style="font-weight: bolder">Categoria</label>
					<select class="form-control" id="categoria">
					
					<%
		             	List<Categoria> categorias = categoriaController.exibirTodos();
		             	for(Categoria categoria : categorias){
		             		out.print("<option value=\"" + categoria.getId() + "\">" + categoria.getDescricao() + "</option>");
		             	}
					%>
					</select> <small class="form-text text-muted">Cadastrar Categoria</small>
				</div>

				<div class="form-group col-md-6" style="margin: 1rem 0">
					<label for="unidadeMedida" style="font-weight: bolder">Unidade
						de Medida</label> <select class="form-control" id="unidadeMedida">
						
						<%
		             	List<UnidadeMedida> unidadesMedida= unidadeMedidaController.exibirTodos();
		             	for(UnidadeMedida unidademedida: unidadesMedida){
		             		out.print("<option value=\"" + unidademedida.getId() + "\">" + unidademedida.getDescricao() + "</option>");
		             	}
					%>
						
						
					</select> <small class="form-text text-muted">Cadastrar Unidade de
						Medida</small>
				</div>
				<button type="submit" class="btn btn-primary">Enviar</button>
			</form>
		</div>


	</main>
</body>
</html>