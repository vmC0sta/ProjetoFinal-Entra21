<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="controller.endereco.*" %>
<%@ page import="model.endereco.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Estados</title>
</head>
<body>

<nav>
    <%@include file=".././menu.jsp" %>
</nav>


   
   <main class="container">
   
	   <h1 style="margin:1.5rem 0">Estados</h1>
	   
	    <table class="table table-striped">
	        <thead>
	            <tr>
	               <th>Código</th>
	               <th>Descrição</th>
	               <th>País</th>	               
	            </tr>
	        </thead>
	        <tbody>
	           <%
	           	DBConnection dbCOnnection = new MySQL(); 
	           	EstadoController estadoController = new EstadoController(dbCOnnection);
	             List<Estado> estados = estadoController.exibirTodos();
	             for(Estado estado : estados){
	            	 out.print("<tr>");
	            	 out.print("<td>"+ estado.getId() +"</td>");
	            	 out.print("<td>"+ estado.getDescricao()+"</td>");
	            	 out.print("<td>"+ estado.getPais().getDescricao()+"</td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/endereco/alteracao/alteracaoPais/alterarPais.jsp?id="+estado.getId()+"'>editar</a></td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/endereco/exclusao/exclusaoPais/processarExclusaoPais.jsp?id="+estado.getId()+"'>excluir</a></td>");
	            	 out.print("</tr>");
	             }
	           %>
	        </tbody>
	      </table>
	      <span><a href="http://localhost:8080/ProjetoFinal/menu/endereco/cadastro/cadastroPais/cadastrarPais.jsp">Cadastrar Estado</span>
	      </main>
</body>
</html>