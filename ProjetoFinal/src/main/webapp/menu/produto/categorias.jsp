<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="controller.produto.CategoriaController" %>
<%@ page import="model.produto.Categoria" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Categorias</title>
</head>
<body>

<nav>
    <%@include file=".././menu.jsp" %>
</nav>


   
   <main class="container">
   
	   <h1 style="margin:1.5rem 0">Categorias</h1>
	   
	    <table class="table table-striped">
	        <thead>
	            <tr>
	               <th>Código</th>
	               <th>Descrição</th>
	            </tr>
	        </thead>
	        <tbody>
	           <%
	           	DBConnection dbCOnnection = new MySQL(); 
	           	CategoriaController categoriaController = new CategoriaController(dbCOnnection);
	             List<Categoria> categorias = categoriaController.exibirTodos();
	             for(Categoria categoria: categorias){
	            	 out.print("<tr>");
	            	 out.print("<td>"+ categoria.getId() +"</td>");
	            	 out.print("<td>"+ categoria.getDescricao()+"</td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/produto/alteracao/alteracaoCategoria/alterarCategoria.jsp?id="+categoria.getId()+"'>editar</a></td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/produto/exclusao/exclusaoCategoria/processarExclusaoCategoria.jsp?id="+categoria.getId()+"'>excluir</a></td>");
	            	 out.print("</tr>");
	             }
	           %>
	        </tbody>
	      </table>
	      <span><a href="http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroCategoria/cadastrarCategoria.jsp">Cadastrar categoria</span>
	      </main>
</body>
</html>