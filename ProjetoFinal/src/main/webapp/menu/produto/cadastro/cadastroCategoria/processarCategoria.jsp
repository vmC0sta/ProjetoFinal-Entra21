<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="controller.produto.CategoriaController" %>
<%@ page import="model.produto.Categoria" %>

<%
    String descricao = request.getParameter("descricao");


	MySQL dbConnection = new MySQL();
	CategoriaController categoriaController = new CategoriaController(dbConnection);
	Categoria categoria = new Categoria();
	categoria.setDescricao(descricao);
	
	if(categoriaController.salvar(categoria)){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroProduto/cadastrarProduto.jsp");
	}

%>
