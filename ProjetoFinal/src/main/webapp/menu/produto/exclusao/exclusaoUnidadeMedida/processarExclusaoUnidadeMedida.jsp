<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="Util.DBConnection"%>
<%@ page import="Util.MySQL"%>
<%@ page import="controller.produto.UnidadeMedidaController"%>
<%@ page import="model.produto.UnidadeMedida"%>

<%
	DBConnection dbConnection = new MySQL();
	UnidadeMedidaController unidadeMedidaController = new UnidadeMedidaController(dbConnection);
	String id = request.getParameter("id");
	if(unidadeMedidaController.excluir(Long.parseLong(id))){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/produto/unidadesMedida.jsp");
	}
%>