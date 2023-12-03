<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.produto.Categoria"%>
<%@ page import="model.produto.UnidadeMedida"%>
<%@ page import="controller.produto.CategoriaController"%>
<%@ page import="controller.produto.UnidadeMedidaController"%>
<%@ page import="controller.produto.ProdutoController" %>
<%@ page import="model.produto.Produto" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="java.util.*" %>

		<% 	
			
			DBConnection dbConnection = new MySQL(); 
			CategoriaController categoriaController = new CategoriaController(dbConnection);
			UnidadeMedidaController unidadeMedidaController = new UnidadeMedidaController(dbConnection);
		
		   String id = request.getParameter("id");
		   Produto produto = new ProdutoController(dbConnection).exibir(Long.parseLong(id));
		   
		   Categoria categoriaAtual = new Categoria();
		   categoriaAtual.setId(produto.getCategoria().getId());
		   categoriaAtual.setDescricao(produto.getCategoria().getDescricao());
		   
		   UnidadeMedida unidadeMedidaAtual = new UnidadeMedida();
		   unidadeMedidaAtual.setId(produto.getUnidadeMedida().getId());
		   unidadeMedidaAtual.setDescricao(produto.getUnidadeMedida().getDescricao());
		   unidadeMedidaAtual.setSigla(produto.getUnidadeMedida().getSigla());
		%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Produto</title>
</head>
<body>

		<nav>
			<%@include file="/menu/menu.jsp"%>
		</nav>
		
		<main class="container">
		
			<h1 style="margin: 1.5rem 0">Editar Produto</h1>
	
		
		<div class="container mt-5">
					<form action="processarAlteracaoProduto.jsp" method="POST">
						<div class="form-row">
						
							<div class="form-group col-md-1" style="margin: 1rem 0">
								<label for="codigoReferencia" style="font-weight: bolder">Código</label> 
								<input type="text" class="form-control" id="codigoReferencia" readonly="readonly" name="codigo" value="<% out.print(id); %>">
							</div>
				
		
							<div class="form-group col-md-6" style="margin: 1rem 90">
								<label for="codigoReferencia" style="font-weight: bolder">Código de Referência</label> 
									<input type="text" class="form-control" id="codigoReferencia" placeholder="Código de Referência" name="codigoReferencia" value="<% out.print(produto.getCodigoReferencia()); %>">
							</div>
		
		
						<div class="form-group" style="margin: 1rem 0">
							<label for="descricao" style="font-weight: bolder">Descrição</label>
							<input type="text" class="form-control" id="descricao" placeholder="Descrição" name="descricao" value="<% out.print(produto.getDescricao());%>">
						</div>
		
		
						<div class="form-group col-md-6" style="margin: 1rem 0">
							<label for="categoria" style="font-weight: bolder">Categoria</label>
							<select class="form-control" id="categoria" name="categoria">
							
		                       <%
		                            List<Categoria> categorias = categoriaController.exibirTodos();
		                            for (Categoria categoria : categorias) {
		                                out.print("<option value=\"" + categoria.getId() + "\">" + categoria.getDescricao() + "</option>");
		                            }
		                            
		                            out.print("<option value=\"" + categoriaAtual.getId() + "\"selected>" + categoriaAtual.getDescricao() + "</option>");
		                            
		                        %>
							</select> <small class="form-text text-muted"><a href="http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroCategoria/cadastrarCategoria.jsp">Cadastrar Categoria</a></small>
						</div>
		
						<div class="form-group col-md-6" style="margin: 1rem 0">
							<label for="unidadeMedida" style="font-weight: bolder">Unidade de Medida</label> 
								<select class="form-control" id="unidadeMedida" name="unidadeMedida">
		                       <%
		                            List<UnidadeMedida> unidadesMedida = unidadeMedidaController.exibirTodos();
		                            for (UnidadeMedida unidadeMedida : unidadesMedida) {
		                                out.print("<option value=\"" + unidadeMedida.getId() + "\">" + unidadeMedida.getSigla() + "</option>");
		                            }
		                        %>
								
								
							</select> 
							<small class="form-text text-muted"><a href="http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroUnidadeMedida/cadastrarUnidadeMedida.jsp">Cadastrar Unidade de Medida</a></small>
						</div>
						<button type="submit" class="btn btn-primary">Enviar</button>
					</form>
				</div>
			</main>
</body>
</html>