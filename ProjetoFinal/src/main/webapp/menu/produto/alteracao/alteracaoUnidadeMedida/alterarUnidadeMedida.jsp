<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.produto.UnidadeMedidaController"%>
<%@ page import="model.produto.UnidadeMedida"%>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="java.util.*" %>
	
	
	<% 	
			
		   DBConnection dbConnection = new MySQL(); 
		   String id = request.getParameter("id");
		   UnidadeMedida unidadeMedida = new UnidadeMedidaController(dbConnection).exibir(Long.parseLong(id));
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Unidade de Medida</title>
</head>
<body>
		<nav>
			<%@include file="/menu/menu.jsp"%>
		</nav>
		
		<main class="container">
		
			<h1 style="margin: 1.5rem 0">Editar Unidade de Medida</h1>
			
			<form action="processarAlteracaoUnidadeMedida.jsp" method="POST">
				<div class="form-row">
				<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Código</label> 
						<input type="text" class="form-control" id="id" name="id" readonly="readonly" value="<% out.print(id); %>">
					</div>
					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Descrição</label> 
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descrição" value="<% out.print(unidadeMedida.getDescricao()); %>">
					</div>
					<div class="form-group col-md-1" style="margin: 1rem 0">
						<label for="id" style="font-weight: bolder">Sigla</label> 
						<input type="text" class="form-control" id="descricao" name="sigla" placeholder="Sigla"  value="<% out.print(unidadeMedida.getSigla()); %>">
					</div>
				</div>
				<button class="btn btn-primary">Salvar</button>
			</form>
		
			
		</main>