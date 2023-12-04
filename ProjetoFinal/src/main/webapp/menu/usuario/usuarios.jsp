<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="controller.usuario.*" %>
<%@ page import="model.usuario.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Usuarios</title>
</head>
<body>

<nav>
    <%@include file=".././menu.jsp" %>
</nav>


   
   <main class="container">
   
	   <h1 style="margin:1.5rem 0">Usuarios</h1>
	   
	    <table class="table table-striped">
	        <thead>
	            <tr>
	               <th>Código</th>
	               <th>Usuario</th>
	               <th>Nome</th>
	            </tr>
	        </thead>
	        <tbody>
	           <%
	           	DBConnection dbCOnnection = new MySQL(); 
	           	UsuarioController usuarioController = new UsuarioController(dbCOnnection);
	             List<Usuario> usuarios = usuarioController.exibirTodos();
	             for(Usuario usuario : usuarios){
	            	 out.print("<tr>");
	            	 out.print("<td>"+ usuario.getId() +"</td>");
	            	 out.print("<td>"+ usuario.getNome()+"</td>");
	            	 out.print("<td>"+ usuario.getPessoa().getNome() +"</td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/produto/alteracao/alteracaoProduto/alterarProduto.jsp?id="+usuario.getId()+"'>editar</a></td>");
	             	 out.print("<td><a href='http://localhost:8080/ProjetoFinal/menu/usuario/exclusao/processarExclusaoUsuario.jsp?id="+usuario.getId()+"'>excluir</a></td>");
	            	 out.print("</tr>");
	             }
	           %>
	        </tbody>
	      </table>
	      <span><a href="http://localhost:8080/ProjetoFinal/menu/usuario/cadastro/cadastroUsuario/cadastrarUsuario.jsp">Cadastrar Usuario</span>
	      </main>
</body>
</html>