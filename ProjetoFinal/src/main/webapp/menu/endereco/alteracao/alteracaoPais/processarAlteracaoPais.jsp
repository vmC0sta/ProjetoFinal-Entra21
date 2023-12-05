<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="controller.endereco.PaisController" %>
<%@ page import="model.endereco.Pais" %>
	
	<%
		String id = request.getParameter("id");
		String descricao = request.getParameter("descricao");
		
		MySQL dbConnection = new MySQL();
		PaisController paisController = new PaisController(dbConnection);
		
		Pais pais = new Pais();
		pais.setDescricao(descricao);
	
		if (paisController.editar(Long.parseLong(id),pais)) {
		    response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/endereco/paises.jsp");
		}
		
	%>