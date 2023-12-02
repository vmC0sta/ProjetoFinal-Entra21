<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="controller.produto.ProdutoController" %>
<%@ page import="model.produto.Produto" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Produtos</title>
</head>
<body>

<nav>
    <%@include file=".././menu.jsp" %>
</nav>


   
   <main class="container">
   
	   <h1 style="margin:1.5rem 0">Produtos</h1>
	   
	    <table class="table table-striped">
	        <thead>
	            <tr>
	               <th>Código</th>
	               <th>Código de referência</th>
	               <th>Descrição</th>
	               <th>Categoria</th>
	               <th>Unidade de medida</th>
	            </tr>
	        </thead>
	        <tbody>
	           <%
	           	DBConnection dbCOnnection = new MySQL(); 
	           	ProdutoController produtoController = new ProdutoController(dbCOnnection);
	             List<Produto> produtos = produtoController.exibirTodos();
	             for(Produto produto : produtos){
	            	 out.print("<tr>");
	            	 out.print("<td>"+ produto.getId() +"</td>");
	            	 out.print("<td>"+ produto.getCodigoReferencia()+"</td>");
	            	 out.print("<td>"+ produto.getDescricao() +"</td>");
	            	 out.print("<td>"+ produto.getCategoria() +"</td>");
	            	 out.print("<td>"+ produto.getUnidadeMedida() +"</td>");
	/*             	 out.print("<td><a href='./formEditarContato.jsp?id="+p.getId()+"'>editar</a></td>");
	 */            	 out.print("</tr>");
	             }
	           %>
	        </tbody>
	      </table>
	      <span><a href="../produto/cadastroProduto/cadastrarProduto.jsp">Cadastrar produto</span>
	      </main>
</body>
</html>