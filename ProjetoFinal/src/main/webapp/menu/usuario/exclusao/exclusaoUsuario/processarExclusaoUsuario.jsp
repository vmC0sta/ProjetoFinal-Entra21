<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="Util.DBConnection"%>
<%@ page import="Util.MySQL"%>
<%@ page import="controller.usuario.UsuarioController"%>
<%@ page import="model.usuario.Usuario"%>

<%
	DBConnection dbConnection = new MySQL();
	UsuarioController usuarioController = new UsuarioController(dbConnection);
	String id = request.getParameter("id");
	if(usuarioController.excluir(Long.parseLong(id))){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/usuario/usuarios.jsp");
	}
%>