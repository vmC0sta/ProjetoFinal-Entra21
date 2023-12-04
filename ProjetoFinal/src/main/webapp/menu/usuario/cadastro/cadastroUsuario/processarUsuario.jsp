<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="controller.usuario.*" %>
<%@ page import="model.usuario.*" %>

<%
    String nome = request.getParameter("nome");
	String senha = request.getParameter("senha");
	String pessoaId = request.getParameter("pessoa");

	MySQL dbConnection = new MySQL();
	UusuarioController usuarioController = new usuarioController(dbConnection);
	
	Usuario usuario = new Usuario();
	usuario.setDescricao(nome);
	usuario.setSigla(senha);
	usuario.setPessoa(pessoaId)
	
	if(usuarioController.salvar(usuario)){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroProduto/cadastrarUsuario.jsp");
	}

%>
