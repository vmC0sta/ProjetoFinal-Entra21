<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="Util.DBConnection"%>
<%@ page import="Util.MySQL"%>
<%@ page import="controller.produto.ProdutoController"%>
<%@ page import="model.produto.Produto"%>

<%
	DBConnection dbConnection = new MySQL();
	ProdutoController produtoController = new ProdutoController(dbConnection);
	String id = request.getParameter("id");
	if(produtoController.excluir(Long.parseLong(id))){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/produto/produtos.jsp");
	}
%>