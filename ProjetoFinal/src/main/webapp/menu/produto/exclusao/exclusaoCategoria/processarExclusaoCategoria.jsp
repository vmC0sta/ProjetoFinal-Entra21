<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="Util.DBConnection"%>
<%@ page import="Util.MySQL"%>
<%@ page import="controller.produto.CategoriaController"%>
<%@ page import="model.produto.Categoria"%>

<%
	DBConnection dbConnection = new MySQL();
	CategoriaController categoriaController = new CategoriaController(dbConnection);
	String id = request.getParameter("id");
	if(categoriaController.excluir(Long.parseLong(id))){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/produto/categorias.jsp");
	}
%>