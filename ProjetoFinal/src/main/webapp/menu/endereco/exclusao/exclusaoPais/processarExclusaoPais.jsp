<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="Util.DBConnection"%>
<%@ page import="Util.MySQL"%>
<%@ page import="controller.endereco.PaisController"%>
<%@ page import="model.endereco.Pais"%>

<%
	DBConnection dbConnection = new MySQL();
	PaisController paisController = new PaisController(dbConnection);
	String id = request.getParameter("id");
	if(paisController.excluir(Long.parseLong(id))){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/endereco/paises.jsp");
	}
%>