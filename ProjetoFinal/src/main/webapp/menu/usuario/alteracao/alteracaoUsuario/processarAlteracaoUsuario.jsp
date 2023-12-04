<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="controller.usuario.*" %>
<%@ page import="model.usuario.Usuario" %>
<%@ page import="controller.pessoa.*" %>
<%@ page import="model.pessoa.Pessoa" %>


	
	<%
		String codigo = request.getParameter("id");
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
		
		if (usuarioController.editar(Long.parseLong(codigo),usuario)) {
		    response.sendRedirect("http://localhost:8080/ProjetoFinal/menu/usuario/usuarios.jsp");
		}
		
	%>