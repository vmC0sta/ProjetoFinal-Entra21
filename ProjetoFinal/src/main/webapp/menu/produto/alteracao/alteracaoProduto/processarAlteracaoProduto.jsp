<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="controller.produto.ProdutoController" %>
<%@ page import="model.produto.Produto" %>
<%@ page import="model.produto.Categoria" %>
<%@ page import="model.produto.UnidadeMedida" %>
	
	<%
		String codigo = request.getParameter("codigo");
		String codigoReferencia = request.getParameter("codigoReferencia");
		String descricao = request.getParameter("descricao");
		String categoriaId = request.getParameter("categoria");
		String unidadeMedidaId = request.getParameter("unidadeMedida");
		
		MySQL dbConnection = new MySQL();
		ProdutoController produtoController = new ProdutoController(dbConnection);
	
		Produto produto = new Produto();
		produto.setCodigoReferencia(codigoReferencia);
		produto.setDescricao(descricao);
	
		Categoria categoriaObj = new Categoria();
		categoriaObj.setId(Long.parseLong(categoriaId));
		produto.setCategoria(categoriaObj);
	
		UnidadeMedida unidadeMedidaObj = new UnidadeMedida();
		unidadeMedidaObj.setId(Long.parseLong(unidadeMedidaId));
		produto.setUnidadeMedida(unidadeMedidaObj);
		
		if (produtoController.editar(Long.parseLong(codigo),produto)) {
		    response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/produto/produtos.jsp");
		}
		
	%>