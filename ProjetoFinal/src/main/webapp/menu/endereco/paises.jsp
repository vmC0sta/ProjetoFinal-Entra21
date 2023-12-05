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
<title>Países</title>
</head>
<body>

<nav>
    <%@include file=".././menu.jsp" %>
</nav>


   
   <main class="container">
   
	   <h1 style="margin:1.5rem 0">Países</h1>
	   
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
	           	PaisController paisController = new PaisController(dbCOnnection);
	             List<Pais> paises = paisController.exibirTodos();
	             for(Pais pais : paises){
	            	 out.print("<tr>");
	            	 out.print("<td>"+ pais.getId() +"</td>");
	            	 out.print("<td>"+ pais.getDescricao()+"</td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/endereco/alteracao/alteracaoPais/alterarPais.jsp?id="+pais.getId()+"'>editar</a></td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/endereco/exclusao/exclusaoPais/processarExclusaoPais.jsp?id="+pais.getId()+"'>excluir</a></td>");
	            	 out.print("</tr>");
	             }
	           %>
	        </tbody>
	      </table>
	      <span><a href="http://localhost:8080/ProjetoFinal/menu/endereco/cadastro/cadastroPais/cadastrarPais.jsp">Cadastrar País</span>
	      </main>
</body>
</html>