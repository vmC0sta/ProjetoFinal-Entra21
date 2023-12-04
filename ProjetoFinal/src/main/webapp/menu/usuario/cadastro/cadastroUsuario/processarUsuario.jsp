<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="controller.usuario.UsuarioController" %>
<%@ page import="model.pessoa.*" %>
<%@ page import="model.usuario.*" %>

<%
    String nome = request.getParameter("nome");
	String senha = request.getParameter("senha");
	String pessoaId = request.getParameter("pessoa");

	MySQL dbConnection = new MySQL();
	UsuarioController usuarioController = new UsuarioController(dbConnection);
	
	Usuario usuario = new Usuario();
	usuario.setNome(nome);
	usuario.setSenha(senha);
	Pessoa pessoa = new Pessoa();
	pessoa.setId(Long.parseLong(pessoaId));
	usuario.setPessoa(pessoa);
	
	if(usuarioController.salvar(usuario)){
		response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/usuario/usuarios.jsp");
	}

%>
