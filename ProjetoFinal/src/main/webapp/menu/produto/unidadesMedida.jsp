<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="controller.produto.UnidadeMedidaController" %>
<%@ page import="model.produto.UnidadeMedida" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Unidades de Medida</title>
</head>
<body>

<nav>
    <%@include file=".././menu.jsp" %>
</nav>


   
   <main class="container">
   
	   <h1 style="margin:1.5rem 0">Unidades de Medida</h1>
	   
	    <table class="table table-striped">
	        <thead>
	            <tr>
	               <th>Código</th>
	               <th>Descrição</th>
	               <th>Sigla</th>
	            </tr>
	        </thead>
	        <tbody>
	           <%
	           	DBConnection dbCOnnection = new MySQL(); 
	           	UnidadeMedidaController unidadeMedidaController = new UnidadeMedidaController(dbCOnnection);
	             List<UnidadeMedida> unidadesMedida = unidadeMedidaController.exibirTodos();
	             for(UnidadeMedida unidadeMedida: unidadesMedida){
	            	 out.print("<tr>");
	            	 out.print("<td>"+ unidadeMedida.getId() +"</td>");
	            	 out.print("<td>"+ unidadeMedida.getDescricao()+"</td>");
	            	 out.print("<td>"+ unidadeMedida.getSigla()+"</td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/produto/alteracao/alteracaoUnidadeMedida/alterarUnidadeMedida.jsp?id="+unidadeMedida.getId()+"'>editar</a></td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/produto/exclusao/exclusaoUnidadeMedida/processarExclusaoUnidadeMedida.jsp?id="+unidadeMedida.getId()+"'>excluir</a></td>");
	            	 out.print("</tr>");
	             }
	           %>
	        </tbody>
	      </table>
	      <span><a href="http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroUnidadeMedida/cadastrarUnidadeMedida.jsp">Cadastrar Unidade de Medida</span>
	      </main>
</body>
</html>