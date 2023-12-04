<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.usuario.*"%>
<%@ page import="model.pessoa.*"%>
<%@ page import="controller.usuario.UsuarioController"%>
<%@ page import="Util.DBConnection"%>
<%@ page import="Util.MySQL"%>
<%@ page import="java.util.*"%>
<%@ page import="controller.pessoa.PessoaController" %>

<%
	DBConnection dbConnection = new MySQL();
	PessoaController pessoaController = new PessoaController(dbConnection);
	
	String id = request.getParameter("id");
	Usuario usuario = new UsuarioController(dbConnection).exibir(Long.parseLong(id));
	Pessoa pessoaAtual = new Pessoa();
	pessoaAtual.setId(usuario.getPessoa().getId());
	pessoaAtual.setNome(usuario.getPessoa().getNome());
%>


<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Editar Usuario</title>
</head>
<body>

	<nav>
		<%@include file="/menu/menu.jsp"%>
	</nav>

	<main class="container">

		<h1 style="margin: 1.5rem 0">Editar Usuário</h1>

		<div class="container mt-5">
			<form action="processarAlteracaoUsuario.jsp" method="POST">
				<div class="form-row">

					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="codigoReferencia" style="font-weight: bolder">Código</label> <input type="text" class="form-control"
							id="codigoReferencia" readonly="readonly" name="id" value="<% out.print(id); %>">
					</div>

					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="codigoReferencia" style="font-weight: bolder">Nome de usuário</label> <input type="text" class="form-control"
							id="codigoReferencia" placeholder="nome de usuario" name="nome" value="<% out.print(usuario.getNome()); %>">
					</div>


					<div class="form-group" style="margin: 1rem 0">
						<label for="descricao" style="font-weight: bolder">Senha:</label> <input type="password" class="form-control"
							id="descricao" placeholder="senha" name="senha" value="<% out.print(usuario.getSenha());%>">
					</div>


					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="categoria" style="font-weight: bolder">Pessoa</label>
						<select class="form-control" id="categoria" name="pessoa">

							<%
							List<Pessoa> pessoas = pessoaController.exibirTodos();
							for (Pessoa pessoa : pessoas) {
								out.print("<option value=\"" + pessoa.getId() + "\">" + pessoa.getNome() + "</option>");
							}
							
                            out.print("<option value=\"" + pessoaAtual.getId() + "\"selected>" + pessoaAtual.getNome() + "</option>");

							
							%>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">Enviar</button>
			</form>
		</div>


	</main>
</body>
</html>