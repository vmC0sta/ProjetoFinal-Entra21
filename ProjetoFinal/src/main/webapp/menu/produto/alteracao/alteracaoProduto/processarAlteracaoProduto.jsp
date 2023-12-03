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
	%>