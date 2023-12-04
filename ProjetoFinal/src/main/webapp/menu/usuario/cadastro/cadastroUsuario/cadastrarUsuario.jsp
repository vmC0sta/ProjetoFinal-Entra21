<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.endereco.*"%>
<%@ page import="model.pessoa.*"%>
<%@ page import="controller.pessoa.*"%>
<%@ page import="Util.DBConnection" %>
<%@ page import="Util.MySQL" %>
<%@ page import="java.util.*" %>

<%

	DBConnection dbCOnnection = new MySQL(); 
	PessoaController pessoaController = new PessoaController(dbCOnnection);

%>
	
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Cadastrar Usuario</title>
</head>
<body>
	<nav>
		<%@include file="/menu/menu.jsp"%>
	</nav>

	<main class="container">

		<h1 style="margin: 1.5rem 0">Cadastrar Usuario</h1>

		<div class="container mt-5">
			<form action="processarUsuario.jsp" method="POST">
				<div class="form-row">

					<div class="form-group col-md-6" style="margin: 1rem 0">
						<label for="codigoReferencia" style="font-weight: bolder">Nome de usuario</label> 
							<input type="text" class="form-control" id="codigoReferencia" placeholder="Código de Referência" name="codigoReferencia">
					</div>


				<div class="form-group" style="margin: 1rem 0">
					<label for="descricao" style="font-weight: bolder">Senha</label>
					<input type="text" class="form-control" id="descricao" placeholder="Descrição" name="descricao">
				</div>


				<div class="form-group col-md-6" style="margin: 1rem 0">
					<label for="categoria" style="font-weight: bolder">Pessoa</label>
					<select class="form-control" id="categoria" name="categoria">
					
                       <%
                            List<Pessoa> pessoas = PessoaController.exibirTodos();
                            for (Pessoa pessoa : pessoas) {
                                out.print("<option value=\"" + pessoa.getId() + "\">" + pessoa.getNome() + "</option>");
                            }
                        %>
					</select> 
					<small class="form-text text-muted"><a href="http://localhost:8080/ProjetoFinal/menu/produto/cadastro/cadastroCategoria/cadastrarCategoria.jsp">Cadastrar Categoria</a></small>
				</div>
				<button type="submit" class="btn btn-primary">Enviar</button>
			</form>
		</div>


	</main>
</body>
</html>